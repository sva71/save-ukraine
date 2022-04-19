<template>
    <div class="fund-about" id="about">
        <div class="text">
            <p class="text-title">{{ textTitle[lang] }}</p>
            <br>
            <p class="text-p1">{{ textP1[lang] }}</p>
            <br>
            <p class="text-p2">{{ textP2[lang] }}</p>
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

    props: { lang: String },

    data() {
        return {
            textTitle: { 'UK': 'Про Фонд', 'EN': 'About Us' },
            textP1: {
                'UK': 'Ми - безпосередні учасники бойових дій, тому поінформовані про актуальний дефіцит українських ' +
                    'військових і розробили найшвидші шляхи вирішення адресних потреб. Даємо змогу усім небайдужим ' +
                    'з будь-якої точки планети дистанційно брати участь у боях за Україну першочергової важливості, ' +
                    'підтримуючи збройний арсенал на передовій.',
                'EN': 'Being the on-site participants of the combat in Ukraine, we are aware of the current ' +
                    'necessities of the troops and have worked out the quickest routes to address the targeted needs. ' +
                    'We would like to invite all who care from anywhere in the world to remotely support the battles ' +
                    'for Ukraine. This is of paramount importance at the moment and you will be helping to aid the ' +
                    'armed arsenal at the frontline.'
            },
            textP2: {
                'UK': 'Ми працюємо з Укроборонпромом, власноруч забезпеуємо армію танками та летальною зброєю. А також ' +
                    'блискавично лагодимо підбите й повертаємо на лінію 0. Швидко доставляємо в гарячі точки бойові ' +
                    'літаки та гелікоптери, засоби ППО, ПЗРК, важку бронетехніку, іншу зброю.',
                'EN': 'We work with Ukroboronprom, we personally provide the army with tanks and lethal weapons. ' +
                    'We also quickly repair the damaged and return it back to where it is needed. We deliver combat ' +
                    'aircraft and helicopters, air defense systems, MANPADS, heavy armored vehicles, and other ' +
                    'weapons to hot spots.'
            }
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
