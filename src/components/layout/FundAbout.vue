<template>
    <div class="fund-about" id="about">
        <div class="text">
            <p class="text-title">{{ textTitle }}</p>
            <br>
            <p class="text-p1">{{ textP1 }}</p>
            <br>
            <p class="text-p2">{{ textP2 }}</p>
        </div>
        <div class="photo">
            <img src="../../assets/img/flower.png" alt="flower_pic">
            <div class="shadow"></div>
        </div>
    </div>
</template>


<script>

export default {

    name: "FundAbout",

    data() {
        return {
            textTitle: 'Про Фонд',
            textP1: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut quis facilisi nec nulla. Lectus ac ' +
                'scelerisque eu ligula sed at at vitae. Orci pulvinar nunc sit cras nunc, cras euismod mattis. ' +
                'Sit egestas elit, elementum pellentesque morbi. ',
            textP2: 'Nulla id sociis diam id venenatis. Ullamcorper id in diam facilisis at netus diam tincidunt. ' +
                'Facilisis et enim, amet nulla ornare scelerisque curabitur massa orci. Laoreet in molestie vitae ' +
                'elit sem enim, adipiscing. Egestas urna, dolor, enim arcu. Accumsan vel massa arcu eu.'
        }
    }

}

</script>


<style scoped lang="scss">

.fund-about {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    flex-wrap: wrap;
    padding: 100px 0;
    background: white;
}

.text {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: flex-start;
    width: 32%;
    &-title {
        color: var(--active-anchor-color);
        font-size: var(--title-font-size);
        line-height: var(--title-line-height);
    }
    &-p1, &-p2 {
        color: var(--usial-color);
        font-family: Gilroy-Regular, sans-serif;
        font-size: var(--anchor-font-size);
        line-height: var(--anchor-line-height);
    }
}

.photo {
    width: 588px;
    height: 400px;
    position: relative;
    overflow-y: hidden;
    img {
        width: 558px;
        float: right;
    }
    .shadow {
        width: 30px;
        height: 340px;
        top: 30px;
        left: 0;
        position: absolute;
        background: var(--shadow-color);
    }
}

@media (max-width: 865px) {
    .text {
        width: 90%;
        margin-bottom: 50px;
    }

}

@media (max-width: 650px) {
    .text-title {
        font-size: var(--title-mobile-font-size);
        line-height: var(--title-mobile-line-height);
    }
}

@media (max-width: 600px) {
    .photo {
        display: none;
    }
}

</style>