<template>
    <div class="save-ukraine" id="save">
        <p class="big-title">{{ bigTitle[lang] }}</p>
        <div class="subtitle">{{ subTitle[lang] }}</div>
        <p class="description-text">{{ descriptionText[lang] }}</p>
        <div class="arrow" title="Гортати донизу" @click="scrollDown()">
            <svg width="60" height="60" viewBox="0 0 60 60" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M59.5 30C59.5 46.2924 46.2924 59.5 30 59.5C13.7076 59.5 0.5 46.2924 0.5 30C0.5 13.7076 13.7076 0.5 30 0.5C46.2924 0.5 59.5 13.7076 59.5 30Z" stroke="#E7E7E7"/>
                <path d="M30 18.75V41.25" stroke="#2B47FF" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M19.5 30.75L30 41.25L40.5 30.75" stroke="#2B47FF" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </div>
        <div>
            <div class="hands"></div>
            <div class="flag-line">
                <div class="flag-blue-line"></div>
                <div class="flag-yellow-line"></div>
            </div>
        </div>
    </div>
</template>


<script>

export default {

    name: "SaveUkraine",

    props: {
        lang: String
    },

    data() {
        return {
            bigTitle: { 'UK': 'Save Ukraine!', 'EN': 'Save Ukraine!' },
            subTitle: { 'UK': 'Благодійний фонд «Save Ukraine».', 'EN': 'Charitable Foundation «Save Ukraine».'},
            descriptionText: {
                'UK': 'Швидке забезпечення термінових потреб ЗСУ, Нацгвардії, поліції та інших військових формувань.\n' +
                    'Фонд засновано з 2014 року - з початку першої військової агресії росії. Дві хвилини на просте ' +
                    'оформлення донату - і солдати вже отримують ваш внесок у вигляді забезпечення. Ми оминаємо ' +
                    'бюрократію і даємо сувору звітність. Кожна ваша гривня - це крок до Перемоги і підсилення ' +
                    'бойового духу, адже відчувати вашу підтримку - безцінно!',
                'EN': 'Fast provision of urgent needs of Ukrainian Armed Forces, National Guard, Police and other ' +
                    'military units. Foundation founded in 2014 - from the begining of russian agression. Two minutes ' +
                    'on simple donation registration - and ukrainian troops are already receiving your deposit in the ' +
                    'useful stuff form. We avoid bureaucracy and provide strict reporting. Every your UAH is one step ' +
                    'to the Victory and morale boost, cause feeling of your support - priceless.'
            }
        }
    },

    methods: {

        scrollDown() {
            window.location.hash = 'top';
            window.location.hash = 'details';
        }

    }

}

</script>


<style scoped lang="scss">

.save-ukraine {
    width: 100%;
    height: calc(100vh - 115px);
    padding-top: 50px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    @media (max-height: 790px) {
        height: auto;
    }
}

.big-title {
    font-size: var(--big-title-font-size);
    line-height: var(--big-title-line-height);
}

.subtitle, .description-text {
    width: 70%;
    text-align: center;
    color: var(--usial-color);
    font-family: Gilroy-Regular, sans-serif;
    font-size: 20px;
    line-height: 26px;
}

.arrow {
    cursor: pointer;
    &:hover {
        svg path:first-child {
            stroke: var(--underline-color);
        }
    }
}

.hands {
    width: 1209px;
    height: 389px;
    background: url("../../assets/img/hands.png") no-repeat;
    background-size: contain;
}

.flag-line {
    width: 100%;
    height: 20px;
}

.flag-blue-line {
    height: 100%;
    background-color: var(--underline-color);
}

.flag-yellow-line {
    height: 100%;
    background-color: var(--underline-yellow-color);
}

@media (max-width: 1100px) {
    .hands {
        width: 900px;
        height: 288px;
    }
}

@media (max-width: 900px) {
    .hands {
        width: 800px;
        height: 256px;
    }
}

@media (max-width: 800px) {
    .hands {
        width: 600px;
        height: 192px;
    }
}

@media (max-width: 700px) {
    .hands {
        width: 500px;
        height: 160px;
    }
}

@media (max-width: 600px) {
    .hands {
        width: 400px;
        height: 128px;
    }
}

@media (max-width: 515px) {
    .big-title {
        font-size: 40px;
    }
}

</style>