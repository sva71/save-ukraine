import { createApp } from 'vue'

import App from './App.vue'

import './assets/scss/index.scss'

import Vue3SmoothScroll from 'vue3-smooth-scroll'
import i18nPlugin from './plugins/i18n'

const app = createApp(App)
	.use(Vue3SmoothScroll)
  .use(i18nPlugin)


app.mount('#app');