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
                        {{ item.title }}
                </div>
            </div>
        </div>
    </div>
</template>


<script>

export default {

    name: "TopPanel",

    data() {
        return {
            anchors: [
                { title: 'Save Ukraine!', id: 'save' },
                { title: 'Про Фонд', id: 'about' },
                { title: 'Реквізити Фонду', id: 'requisites' }
            ],
            activeAnchor: 0
        }
    },

    methods: {

        anchorClick(index) {
            this.activeAnchor = index;
            if (this.anchors[this.activeAnchor]) {
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
    overflow-y: auto;
}

.logo {
    img {
        display: inline-block;
        margin-right: 5px;
    }
}

.anchors {
    width: 40%;
    position: relative;
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

    .top-panel {
        justify-content: flex-start;
    }

    .anchors {
        .anchors-menu {
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-end;
            &-item {
                padding-bottom: 2px;
            }
        }
    }

}

</style>
