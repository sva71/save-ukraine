<template>
    <div class="req" id="requisites">
        <p class="req-title">{{ reqTitleText }}</p>
        <p class="req-subtitle">{{ reqSubTitleText }}</p>
        <div class="req-accounts">
            <div class="req-accounts-names">
                <div
                    v-for="(item, index) in accounts" class="req-accounts-names-item"
                    :class="{ active: index === activeAccount }"
                    @click="activeAccount = index">
                        {{ item.name }}
                </div>
            </div>
            <div class="req-accounts-values">
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
        </div>
    </div>
</template>


<script>

import {Back} from "@element-plus/icons-vue";
export default {

    name: "Requisites",
    components: {Back},
    data() {
        return {
            reqTitleText: 'Реквізити Фонду',
            reqSubTitleText: 'Lorem ipsum dolor amet',
            accounts: [
                {
                    name: 'Євро рахунок',
                    companyName: 'SaveUkraine',
                    ibanCode: 'UA000000000000000000000000000',
                    bankName: 'AAA AA "PRIVATBANK, 120 KHRESCHATYK STR., KYIV, 00001, UKRAINE"',
                    swiftCode: 'SAVEUKRAINE',
                    address: 'Ukraine, 00001, Kyiv, Khreschatyk str., 154, office 43'
                },
                {
                    name: 'Долар рахунок',
                    companyName: '',
                    ibanCode: '',
                    bankName: '',
                    swiftCode: '',
                    address: ''

                },
                {
                    name: 'Гривня рахунок',
                    companyName: '',
                    ibanCode: '',
                    bankName: '',
                    swiftCode: '',
                    address: ''

                },
                {
                    name: 'PayPal рахунок',
                    companyName: '',
                    ibanCode: '',
                    bankName: '',
                    swiftCode: '',
                    address: ''

                },
            ],
            activeAccount: 0
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
            padding: 46px 0;
            background: var(--shadow-color);
            border-radius: 4px;
            &-row {
                width: 100%;
                display: flex;
                flex-direction: row;
                justify-content: flex-start;
                align-items: center;
                margin-top: 40px;
                .requisite {
                    display: flex;
                    flex-direction: column;
                    justify-content: space-between;
                    align-items: flex-start;
                    margin-left: 100px;
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
    .req-accounts-values-row {
        .requisite {
            margin-left: 5px;
            .req-name, .req-value {
                font-size: 0.8em;
            }
        }
    }
}

@media (max-width: 550px) {
    .req-accounts-values-row {
        flex-wrap: wrap;
    }
}

@media (max-width: 400px) {
    .req-accounts-values-row {
        .requisite {
            margin-left: 0;
            .req-name, .req-value {
                font-size: 0.6em;
            }
        }
    }
}

</style>