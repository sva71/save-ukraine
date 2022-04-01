<template>
    <div class="footer">
        <div class="logo">
            <img src="../../assets/img/heart.png" alt="ukrainian_heart">
            <img src="../../assets/img/SaveUkraine.png" alt="save_ukraine">
        </div>
        <p>{{ email }}</p>
        <p>{{ address }}</p>
    </div>
</template>


<script>

export default {

    name: "Footer",

    data() {
        return {
            email: 'support@saveukraine.org.ua',
            address: '00001, м. Київ, вул. Хрещатик 15, офіс 43'
        }
    }

}

</script>


<style scoped lang="scss">

.footer {
    width: 100%;
    height: 92px;
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    flex-wrap: wrap;
    background-color: #EAEDFF;
    .logo {
        img {
            display: inline-block;
            margin-right: 5px;
        }
    }
    p {
        font-family: Gilroy-Regular, sans-serif;
        font-size: var(--anchor-font-size);
        line-height: var(--anchor-line-height);
    }
}

@media (max-width: 400px) {
    .footer {
        p {
            font-size: 0.8em;
        }
    }
}

</style>