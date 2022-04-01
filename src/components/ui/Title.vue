<template>

  <p class="relative pb-5 w-max before:absolute before:bottom-0 before:left-0 before:w-[100px] before:h-px"
     :class="{'text-4xl lg:text-5xl': fontSize === 'default', 'text-4xl': fontSize === 'small', 'text-primary-9': color === 'default', 'text-white': color === 'white', 'before:bg-primary-9': color === 'default', 'before:bg-white': color === 'white' }"
  >{{ text }}</p>

</template>

<script>

export default {
  props: {
    text: {
      type: String,
      default: () => '',
    },
    fontSize: {
      type: String,
      default: () => 'default',
    },
    color: {
      type: String,
      default: () => 'default',
    },
  },
}

</script>

<style lang="scss">

</style>