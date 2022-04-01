<template>
    <div class="wrapper" id="top">
        <TopPanel />
        <SaveUkraine />
        <FundAbout />
        <Requisites />
        <Footer />
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
            text: 'Hello, world!'
        }
    }

}

</script>


<style lang="scss">

.wrapper {
    width: 100%;
    min-height: 100vh;
    padding-top: 50px;
    background: var(--main-background);
    overflow-y: scroll;
}

</style>
