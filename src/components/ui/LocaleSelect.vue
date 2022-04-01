<template>
  <div class="space-x-5">
    <a
      v-for="lang in langs"
      :key="lang.code"
      @click="onDropdownClick(lang.code)"
      style="font-weight: normal;"
      class="text-black !text-lg cursor-pointer "
      :class="{'!font-medium !text-primary-9 border-b border-primary-9': $i18n.locale === lang.code }"
    >
      {{ lang.label }}
    </a>
  </div>
</template>

<script>
export default {
  data() {
    return {
      langs: [{
        code: 'uk',
        label: 'UK',
      },
      {
        code: 'en',
        label: 'EN',
      }],
    }
  },
  methods: {
    onDropdownClick(command) {
      this.$root.$i18n.locale = command
    },
  },
}
</script>

<style>

</style>
