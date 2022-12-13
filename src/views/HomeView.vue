<template>
  <div class="mx-auto max-w-screen-xl h-full py-auto px-4 sm:px-6 lg:px-8 flex">
    <div class="w-1/2 my-auto">
      <h1 class="text-7xl text-slate-700 dark:text-slate-300 align-middle font-extrabold">Your minimalistic app for weather status</h1>
      <img src="/img/google_play_dark.png" alt="Weather App Mockup" class="my-10"
           :class="{ hidden: appStore.getDark}">
      <img src="/img/google_play_light.png" alt="Weather App Mockup" class="my-10"
           :class="{ hidden: !appStore.getDark}">
    </div>
    <div class="w-1/2">
      <img src="/img/mockup_dark.png" alt="Weather App Mockup" class="my-10 ml-auto"
           :class="{ hidden: !appStore.getDark}">
      <img src="/img/mockup_light.png" alt="Weather App Mockup" class="my-10 ml-auto"
           :class="{ hidden: appStore.getDark}">
    </div>
  </div>
</template>

<script setup lang="ts">
import { useAppStore } from "@/stores/AppStore";
const appStore = useAppStore();
</script>

<script lang="ts">
export default {
  name: "HomeView"
}
</script>

<style scoped>

</style>
