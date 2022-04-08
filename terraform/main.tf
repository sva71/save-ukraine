terraform {
  required_version = ">= 1.0.10"
  backend "s3" {
    bucket         = "terraform-state-file-omq7diwu6nl19n9m"
    dynamodb_table = "terraform-state-file-omq7diwu6nl19n9m"
    encrypt        = true
    key            = "saveukrainefund/production/terraform.tfstate"
    region         = "eu-central-1"
    profile        = "it-army"
  }
}

provider "aws" {
  alias   = "cloudfront"
  region  = "us-east-1"
  profile = "it-army"

  default_tags {
    tags = {
      Owner       = "Terraform"
      Environment = local.environment
      Project     = local.project_name
    }
  }
}

provider "aws" {
  region  = "eu-central-1"
  profile = "it-army"

  default_tags {
    tags = {
      Owner       = "Terraform"
      Environment = local.environment
      Project     = local.project_name
    }
  }
}


locals {
  project_name = "saveukrainefund"
  environment  = "production"
  main_domain  = "saveukrainefund.com"
}

# ------------------------------------------
# Data blocs
# ------------------------------------------

data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "allow_s3_access" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:GetBucketLocation",
      "s3:AbortMultipartUpload"
    ]
    resources = [
      "arn:${data.aws_partition.current.partition}:s3:::${local.project_name}-${local.environment}",
      "arn:${data.aws_partition.current.partition}:s3:::${local.project_name}-${local.environment}/*"
    ]
    effect = "Allow"
  }
  statement {
    actions = [
      "cloudfront:CreateInvalidation"
    ]
    resources = [
      "arn:${data.aws_partition.current.partition}:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${module.cdn.cloudfront_distribution_id}"
    ]
    effect = "Allow"
  }
}

data "aws_iam_policy_document" "oai" {
  statement {
    sid    = "GetObject"
    effect = "Allow"

    actions = [
      "s3:GetObject"
    ]
    principals {
      type        = "AWS"
      identifiers = module.cdn.cloudfront_origin_access_identity_iam_arns
    }
    resources = ["${module.s3_bucket.s3_bucket_arn}/*"]
  }
  statement {
    sid    = "ListBucket"
    effect = "Allow"

    actions = [
      "s3:ListBucket"
    ]
    principals {
      type        = "AWS"
      identifiers = module.cdn.cloudfront_origin_access_identity_iam_arns
    }
    resources = [module.s3_bucket.s3_bucket_arn]
  }
}

# ------------------------------------------
# Create IAM user
# ------------------------------------------

resource "aws_iam_user" "this" {
  name = "${local.project_name}-cloudfront-deploy"
}
resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_iam_user_policy" "allow_s3_access" {
  name   = aws_iam_user.this.name
  user   = aws_iam_user.this.name
  policy = data.aws_iam_policy_document.allow_s3_access.json
}

# ------------------------------------------
# Get Zone ID
# ------------------------------------------

data "aws_route53_zone" "this" {
  name = local.main_domain
}

# ------------------------------------------
# Create ACM
# ------------------------------------------

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "3.4.0"

  domain_name = local.main_domain
  zone_id     = data.aws_route53_zone.this.zone_id

  subject_alternative_names = [
    "*.${local.main_domain}"
  ]

  wait_for_validation = true

  providers = {
    aws = aws.cloudfront
  }
}

# ------------------------------------------
# Create S3 for CloudFront
# ------------------------------------------

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.15.0"

  bucket = "${local.project_name}-${local.environment}"
  acl    = "private"
}

resource "aws_s3_bucket_policy" "this" {
  bucket = module.s3_bucket.s3_bucket_id
  policy = data.aws_iam_policy_document.oai.json

  depends_on = [module.cdn]
}

# ------------------------------------------
# Create CloudFront
# ------------------------------------------

module "cdn" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "2.9.3"

  aliases = [
    local.main_domain,
    "www.${local.main_domain}"
  ]

  price_class         = "PriceClass_All"
  wait_for_deployment = false
  default_root_object = "index.html"

  create_origin_access_identity = true
  origin_access_identities = {
    s3_bucket = "${local.project_name}-${local.environment}"
  }

  origin = {
    s3 = {
      domain_name = module.s3_bucket.s3_bucket_bucket_regional_domain_name
      s3_origin_config = {
        origin_access_identity = "s3_bucket"
      }
    }
  }

  default_cache_behavior = {
    cache_policy_id           = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    origin_request_policy_id  = "59781a5b-3903-41f3-afcb-af62929ccde1"
    target_origin_id          = "s3"
    viewer_protocol_policy    = "redirect-to-https"
    use_forwarded_values      = false
    query_string              = false
    query_string_cache_keys   = []
    headers                   = []
    cookies_forward           = "none"
    cookies_whitelisted_names = []
    allowed_methods           = ["GET", "HEAD", "DELETE", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods            = ["GET", "HEAD"]
    compress                  = true
    query_string              = true
  }

  viewer_certificate = {
    acm_certificate_arn      = module.acm.acm_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}

# ------------------------------------------
# Create Route53 record
# ------------------------------------------

resource "aws_route53_record" "this" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = local.main_domain
  type    = "A"

  alias {
    name                   = module.cdn.cloudfront_distribution_domain_name
    zone_id                = module.cdn.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "www.${local.main_domain}"
  type    = "A"

  alias {
    name                   = module.cdn.cloudfront_distribution_domain_name
    zone_id                = module.cdn.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = true
  }
}
