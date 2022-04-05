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
            textTitle: { 'UK': 'Про Фонд', 'EN': 'Fund About' },
            textP1: {
                'UK': 'Ми - безпосередні учасники бойових дій, тому поінформовані про актуальний дефіцит українських ' +
                    'військових і розробили найшвидші шляхи вирішення адресних потреб. Даємо змогу усім небайдужим ' +
                    'з будь-якої точки планети дистанційно брати участь у боях за Україну першочергової важливості, ' +
                    'підтримуючи збройний арсенал на передовій.',
                'EN': 'We are direct participants in hostilities, so we have actual information about needs of our ' +
                    'troops and we\'ve developed the fastest routes of solving targeted needs. We give an opportunity ' +
                    'to all those who are not indifferent from anywhere in the world to take part in priority battles ' +
                    'for Ukraine distantly and support weapons arsenal at the forefront.'
            },
            textP2: {
                'UK': 'Ми працюємо з Укроборонпромом, власноруч забезпеуємо армію танками та летальною зброєю. А також ' +
                    'блискавично лагодимо підбите й повертаємо на лінію 0. Швидко доставляємо в гарячі точки бойові ' +
                    'літаки та гелікоптери, засоби ППО, ПЗРК, важку бронетехніку, іншу зброю.',
                'EN': 'We contribute with Ukroboronprom, provide armed forces with tanks and lethal weapons by ' +
                    'ourselves. Also we lightning fast repair damaged equipment and return it to the forefront. ' +
                    'Fast delivery military planes and helicopters, air defence systems, anti-aircraft missile systems, ' +
                    'heavy armored vehicles and other weapons to hot spots.'
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