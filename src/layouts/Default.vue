<template>
    <div class="wrapper" id="top">
        <div class="languages">
            <p v-for="lang in languages" class="lang-item"
                :class="{ active: activeLang === lang }" @click="changeLang(lang)">
                    {{ lang }}
            </p>
        </div>
        <TopPanel :lang="activeLang" />
        <SaveUkraine :lang="activeLang" />
        <FundAbout :lang="activeLang" />
        <Requisites :lang="activeLang" />
        <Footer :lang="activeLang" />
    </div>
</template>

<script>

import TopPanel from "../components/layout/TopPanel.vue";
import SaveUkraine from "../components/layout/SaveUkraine.vue";
import FundAbout from "../components/layout/FundAbout.vue";
import Requisites from "../components/layout/Requisites.vue";
import Footer from "../components/layout/Footer.vue";

export default {

    components: {
        TopPanel,
        SaveUkraine,
        FundAbout,
        Requisites,
        Footer
    },

    data() {
        return {
            languages: ['UK', 'EN'],
            activeLang: localStorage.getItem('saveUkraineLang') ? localStorage.getItem('saveUkraineLang') : 'UK'
        }
    },

    methods: {
      changeLang(lang) {
          this.activeLang = lang;
          localStorage.setItem('saveUkraineLang', lang);
      }
    }

}

</script>


<style lang="scss">

.wrapper {
    width: 100%;
    min-height: 100vh;
    padding-top: 20px;
    background: var(--main-background);
    overflow-y: scroll;
    .languages {
        display: flex;
        flex-direction: row;
        float: right;
        margin-bottom: 7px;
        padding-right: 10px;
        .lang-item {
            color: var(--usial-color);
            margin-left: 10px;
            padding-bottom: 2px;
            cursor: pointer;
            user-select: none;
            &.active {
                color: var(--active-anchor-color);
                border-bottom: 2px solid var(--underline-color);
            }
        }
    }
}

</style>
