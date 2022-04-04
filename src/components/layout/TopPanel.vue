<template>
    <div class="top-panel">
        <div class="logo">
            <img src="../../assets/img/heart.png" alt="ukrainian_heart">
            <img src="../../assets/img/SaveUkraine.png" alt="save_ukraine">
        </div>
        <div class="anchors">
            <div class="anchors-menu">
                <div class="anchors-menu-item"
                    v-for="(item, index) in anchors"
                    :class="{ active: index === activeAnchor }"
                    @click="anchorClick(index)">
                        {{ item.title[lang] }}
                </div>
            </div>
            <p class="burger-symbol" @click="dropdownVisible = !dropdownVisible">&#9776;</p>
            <div v-if="dropdownVisible" class="burger-menu">
                <div class="burger-menu-items">
                    <p class="arrow" @click="dropdownVisible = false">&#8592;</p>
                    <div class="anchors-menu-item"
                         v-for="(item, index) in anchors"
                         :class="{ active: index === activeAnchor }"
                         @click="anchorClick(index)">
                        {{ item.title[lang] }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>


<script>

export default {

    name: "TopPanel",

    props: {
        lang: String
    },

    data() {
        return {
            anchors: [
                { title: { 'UK': 'Save Ukraine!', 'EN': 'Save Ukraine!' }, id: 'save' },
                { title: { 'UK': 'Про Фонд', 'EN': 'Fund About' }, id: 'about' },
                { title: { 'UK': 'Реквізити Фонду', 'EN': 'Fund Details' }, id: 'details' }
            ],
            activeAnchor: 0,
            dropdownVisible: false
        }
    },

    methods: {

        anchorClick(index) {
            this.activeAnchor = index;
            this.dropdownVisible = false;
            if (this.anchors[this.activeAnchor]) {
                window.location.hash = 'top';
                window.location.hash = this.anchors[this.activeAnchor].id;
            }
        }

    }

}

</script>


<style scoped lang="scss">

.top-panel {
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    padding: 0 5px;
}

.logo {
    img {
        display: inline-block;
        margin-right: 5px;
    }
}

.anchors {
    width: 40%;
    &-menu {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        &-item {
            padding-bottom: 5px;
            color: var(--anchor-color);
            font-size: var(--anchor-menu-font-size);
            line-height: var(--anchor-menu-line-height);
            cursor: pointer;
            transition: color 500ms;
            &:hover {
                color: var(--anchor-hover-color);
            }
            &.active {
                color: var(--active-anchor-color);
                border-bottom: 2px solid var(--underline-color);
            }
        }
    }
    .burger-symbol {
        display: none;
        float: right;
        cursor: pointer;
        font-size: var(--burger-font-size);
    }
    .burger-menu {
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        position: absolute;
        display: flex;
        flex-direction: row;
        justify-content: flex-end;
        background: rgba(0, 0, 0, 0.75);
        &-items {
            width: 60%;
            height: 100%;
            position: absolute;
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: flex-start;
            padding-left: 50px;
            background: white;
            border-radius: 4px;
            user-select: none;
            .arrow {
                width: 100%;
                cursor: pointer;
                user-select: none;
                font-family: Gilroy-Regular, sans-serif;
                font-size: var(--burger-font-size);
            }
        }
    }
}

@media (max-width: 1100px) {
    .top-panel {
        justify-content: space-between;
    }
    .anchors {
        width: 50%;
    }
}

@media (max-width: 650px) {
    .anchors {
        .anchors-menu {
            display: none
        }
        .burger-symbol {
            display: block;
        }
    }
}

</style>
