<template>
    <div class="req" id="details">
        <p class="req-title">{{ reqTitleText[lang] }}</p>
        <p class="req-subtitle">{{ reqSubTitleText[lang] }}</p>
        <div class="req-accounts">
            <div class="req-accounts-names">
                <div
                    v-for="(item, index) in accounts" class="req-accounts-names-item"
                    :class="{ active: index === activeAccount }"
                    @click="activeAccount = index">
                        {{ item.name[lang] }}
                </div>
            </div>
            <div v-if="accounts[activeAccount].ibanCode" class="req-accounts-values">
                <div class="req-accounts-values-row">
                    <div class="requisite">
                        <p class="req-name">Company Name</p>
                        <p class="req-value">{{ accounts[activeAccount].companyName }}</p>
                    </div>
                    <div class="requisite">
                        <p class="req-name">IBAN Code</p>
                        <p class="req-value">{{ accounts[activeAccount].ibanCode }}</p>
                    </div>
                </div>
                <div class="req-accounts-values-row">
                    <div class="requisite">
                        <p class="req-name">Bank Name</p>
                        <p class="req-value">{{ accounts[activeAccount].bankName }}</p>
                    </div>
                    <div class="requisite">
                        <p class="req-name">Bank SWIFT Code</p>
                        <p class="req-value">{{ accounts[activeAccount].swiftCode }}</p>
                    </div>
                </div>
                <div class="req-accounts-values-row">
                    <div class="requisite">
                        <p class="req-name">Company address</p>
                        <p class="req-value">{{ accounts[activeAccount].address }}</p>
                    </div>
                </div>
            </div>
            <div v-if="accounts[activeAccount].accountName" class="req-accounts-values">
                <div class="req-accounts-values-row">
                    <div class="requisite">
                        <p class="req-name">Paypal Account</p>
                        <p class="req-value">{{ accounts[activeAccount].accountName }}</p>
                    </div>
                    <div class="requisite">
                        <p class="req-name">Site</p>
                        <p class="req-value">
                            <a :href="accounts[activeAccount].gotoUrl" target="_blank">
                                {{ accounts[activeAccount].gotoUrl }}
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>


<script>


export default {

    name: "Requisites",

    props: { lang: String },

    data() {
        return {
            reqTitleText: { 'UK': 'Реквізити Фонду', 'EN': 'Fund Details'},
            reqSubTitleText: { 'UK': 'Банківські рахунки', 'EN': 'Accounts' },
            accounts: [
                {
                    name: { 'UK': 'Євро', 'EN': 'EUR'},
                    companyName: 'Charity fund "SaveUkraine"',
                    ibanCode: 'UA773052990000026008030119568',
                    bankName: 'JSC CB "Privatbank"',
                    swiftCode: 'PBANUA2X',
                    address: 'UKRAINE, Kyiv, 29, Voloshska St., 04070'
                },
                {
                    name: {'UK': 'Долар', 'EN': 'USD'},
                    companyName: 'Charity fund "SaveUkraine"',
                    ibanCode: 'UA773052990000026008030119568',
                    bankName: 'JSC CB "Privatbank"',
                    swiftCode: 'PBANUA2X',
                    address: 'UKRAINE, Kyiv, 29, Voloshska St., 04070'

                },
                {
                    name: {'UK': 'Гривня', 'EN': 'UAH' },
                    companyName: 'Charity fund "SaveUkraine"',
                    ibanCode: 'UA773052990000026008030119568',
                    bankName: 'JSC CB "Privatbank"',
                    swiftCode: 'PBANUA2X',
                    address: 'UKRAINE, Kyiv, 29, Voloshska St., 04070'

                },
                {
                    name: {'UK': 'PayPal', 'EN': 'PayPal'},
                    companyName: '',
                    ibanCode: '',
                    bankName: '',
                    swiftCode: '',
                    address: '',
                    accountName: 'donate@saveukrainefund.com',
                    gotoUrl: 'http://paypal.com'
                },
            ],
            activeAccount: 0
        }
    },

    methods: {
        accountClick(index) {
            this.activeAccount = index;
            if (this.accounts[this.activeAccount].gotoUrl) {
                window.open(this.accounts[this.activeAccount].gotoUrl, '_blank');
            }
        }
    }

}

</script>


<style scoped lang="scss">

.req {

    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    background: var(--main-background);
    padding: 100px 0;

    &-title {
        font-size: var(--title-font-size);
        line-height: var(--title-line-height);
    }

    &-subtitle {
        margin-top: 30px;
        font-family: Gilroy-Regular, sans-serif;
        color: var(--usial-color);
        font-size: var(--anchor-font-size);
        line-height: var(--anchor-line-height);
    }

    &-accounts {
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        align-items: center;
        margin-top: 50px;
        &-names {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            &-item {
                margin: 25px 0;
                color: var(--anchor-color);
                font-size: var(--anchor-menu-font-size);
                line-height: var(--anchor-menu-line-height);
                cursor: pointer;
                transition: color 500ms;
                &:hover {
                    color: var(--anchor-hover-color);
                }
                &.active {
                    &:after {
                        content: "";
                        width: 166px;
                        height: 2px;
                        display: block;
                        background-color: var(--underline-color);
                    }
                }
            }
        }
        &-values {
            width: 66%;
            height: 439px;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: center;
            padding: 46px 100px;
            background: var(--shadow-color);
            border-radius: 4px;
            &-row {
                width: 100%;
                display: flex;
                flex-direction: row;
                justify-content: flex-start;
                flex-wrap: wrap;
                align-items: center;
                margin-top: 40px;
                .requisite {
                    width: 50%;
                    display: flex;
                    flex-direction: column;
                    justify-content: space-between;
                    align-items: flex-start;
                    .req-name {
                        font-family: Gilroy-Regular, sans-serif;
                        color: var(--active-anchor-color);
                        font-size: var(--anchor-font-size);
                        line-height: var(--anchor-line-height);
                    }
                    .req-value {
                        color: var(--underline-color);
                        font-size: var(--anchor-menu-font-size);
                        line-height: var(--anchor-menu-line-height);
                    }
                }
            }
        }
    }

}

@media (max-width: 1000px) {
    .req-accounts-values {
        padding: 46px 5px;
    }
}

@media (max-width: 730px) {
    .req-accounts {
        flex-direction: column;
        &-values {
            width: 90%;
        }
        &-names {
            width: 90%;
            flex-direction: row;
            justify-content: space-around;
            &-item {
                &.active {
                    &:after {
                        display: none;
                    }
                    border-bottom: 2px solid var(--underline-color);
                }
            }
        }
    }
}

@media (max-width: 600px) {
    .req-accounts-values-row {
        .requisite {
            width: 100%;
        }
    }
}

@media (max-width: 400px) {
    .req-title {
        font-size: var(--title-mobile-font-size);
        line-height: var(--title-mobile-line-height);
    }
}

@media (max-width: 360px) {
    .req-accounts-values-row {
        .requisite {
            .req-name, .req-value {
                font-size: 0.8em;
            }
        }
    }
}

</style>