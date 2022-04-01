import { createI18n } from 'vue-i18n'

import en from '@/locales/en'
import uk from '@/locales/uk'

const messages = {
  en: en,
  uk: uk,
}

export default {
  install(app) {
    const i18n = createI18n({
      locale: 'uk', // set locale
      fallbackLocale: 'uk', // set fallback locale
      messages,
    })

    app.use(i18n)
  },
}
