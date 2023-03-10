<script setup>
import {RouterView} from 'vue-router'
import NavBarComponent from "@/components/NavBarComponent.vue";
import FooterComponent from "@/components/FooterComponent.vue";
import {useAppStore} from "@/stores/AppStore";

const appStore = useAppStore();
appStore.isDark = (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches))

if (appStore.isDark) {
  document.documentElement.classList.add('dark')
  localStorage.theme = 'dark'
}
</script>

<template>
  <NavBarComponent/>
  <RouterView/>
  <FooterComponent/>
</template>

<style scoped>
</style>
