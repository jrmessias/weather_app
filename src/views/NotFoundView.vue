<template>
    <div class="mx-auto max-w-screen-xl h-full py-auto px-4 sm:px-6 lg:px-8 flex-grow">
    <div class="w-full my-auto">
      <h1 class="text-7xl text-slate-700 dark:text-slate-300 align-middle font-extrabold h-100 py-64">Not found</h1>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useAppStore } from "@/stores/AppStore";
const appStore = useAppStore();
</script>

<script lang="ts">
export default {
  name: "NotFoundView"
}
</script>

<style scoped>

</style>
