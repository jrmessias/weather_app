<template>
  <nav class="bg-slate-200 dark:bg-slate-900 shadow">
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
      <div class="flex h-16 items-center justify-between">
        <div class="flex items-center">
          <div class="flex-shrink-0">
            <a href="/" title="Home">
            <img class="h-8 w-8" src="/img/icon.svg"
                 alt="Weather App">
            </a>
          </div>
<!--          <div class="hidden md:block">-->
<!--            <div class="ml-10 flex items-baseline space-x-4">-->
<!--              <a href="/about"-->
<!--                 class="text-slate-800 hover:bg-slate-300 hover:text-slate-800 hover:dark:bg-slate-800 dark:text-slate-300 px-3 py-2 rounded-full text-sm font-medium">About</a>-->
<!--              <a href="/404"-->
<!--                 class="text-slate-800 hover:bg-slate-300 hover:text-slate-800 hover:dark:bg-slate-800 dark:text-slate-300 px-3 py-2 rounded-full text-sm font-medium">404</a>-->
<!--            </div>-->
<!--          </div>-->
        </div>
        <div class="md:block">
          <div class="ml-4 flex items-end md:items-center md:ml-6">
            <div class="ml-3">
              <a href="#" class="cursor-pointer" @click="toggleDarkMode">
                <svg :class="{ hidden: appStore.getDark }" class="fill-slate-500" xmlns="http://www.w3.org/2000/svg" width="24"
                     height="24" viewBox="0 0 24 24">
                  <path
                      d="M12 11.807A9.002 9.002 0 0 1 10.049 2a9.942 9.942 0 0 0-5.12 2.735c-3.905 3.905-3.905 10.237 0 14.142 3.906 3.906 10.237 3.905 14.143 0a9.946 9.946 0 0 0 2.735-5.119A9.003 9.003 0 0 1 12 11.807z"></path>
                </svg>
                <svg :class="{ hidden: !appStore.getDark }" class="fill-slate-500" xmlns="http://www.w3.org/2000/svg" width="24"
                     height="24" viewBox="0 0 24 24">
                  <path
                      d="M6.995 12c0 2.761 2.246 5.007 5.007 5.007s5.007-2.246 5.007-5.007-2.246-5.007-5.007-5.007S6.995 9.239 6.995 12zM11 19h2v3h-2zm0-17h2v3h-2zm-9 9h3v2H2zm17 0h3v2h-3zM5.637 19.778l-1.414-1.414 2.121-2.121 1.414 1.414zM16.242 6.344l2.122-2.122 1.414 1.414-2.122 2.122zM6.344 7.759 4.223 5.637l1.415-1.414 2.12 2.122zm13.434 10.605-1.414 1.414-2.122-2.122 1.414-1.414z"></path>
                </svg>
              </a>
            </div>
          </div>
        </div>
<!--        <div class="-mr-2 flex md:hidden">-->
<!--          &lt;!&ndash; Mobile menu button &ndash;&gt;-->
<!--          <button type="button"-->
<!--                  class="inline-flex items-center justify-center rounded-md dark:bg-slate-800 p-2 text-slate-400 hover:bg-slate-300 dark:hover:bg-slate-700 hover:text-white focus:outline-none"-->
<!--                  aria-controls="mobile-menu" aria-expanded="false" @click="toggleMenuMobile">-->
<!--            <span class="sr-only">Open main menu</span>-->
<!--            <svg :class="{ hidden: isMobile, block: !isMobile }" class="block h-6 w-6"-->
<!--                 xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"-->
<!--                 stroke-width="1.5" stroke="currentColor" aria-hidden="true">-->
<!--              <path stroke-linecap="round" stroke-linejoin="round"-->
<!--                    d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"/>-->
<!--            </svg>-->
<!--            <svg :class="{ hidden: !isMobile, block: isMobile }" class="h-6 w-6" xmlns="http://www.w3.org/2000/svg"-->
<!--                 fill="none" viewBox="0 0 24 24"-->
<!--                 stroke-width="1.5" stroke="currentColor" aria-hidden="true">-->
<!--              <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/>-->
<!--            </svg>-->
<!--          </button>-->
<!--        </div>-->
      </div>
    </div>

    <!-- Mobile menu, show/hide based on menu state. -->
<!--    <div :class="{ hidden: !isMobile }" class="transition-all duration-300 md:hidden" id="mobile-menu">-->
<!--      <div class="space-y-1 px-2 pt-2 pb-3 sm:px-3 transition-all duration-300">-->
<!--        <a href="/about" class="bg-slate-300 dark:bg-slate-900 text-slate-900 dark:text-slate-300 block px-3 py-2 rounded-full text-base font-medium"-->
<!--           aria-current="page">About</a>-->
<!--        <a href="/404" class="dark:bg-slate-900 dark:text-slate-300 block px-3 py-2 rounded-md text-base font-medium"-->
<!--           aria-current="page">404</a>-->
<!--      </div>-->
<!--    </div>-->
  </nav>
</template>
<script setup type="ts">
import {ref} from "vue"
import {useAppStore} from "@/stores/AppStore";

const appStore = useAppStore();

let isMobile = ref(false)

function toggleMenuMobile() {
  isMobile.value = isMobile.value != true
}

function toggleDarkMode() {
  appStore.toggleDark()
  if (appStore.getDark) {
    document.documentElement.classList.add('dark')
    localStorage.theme = 'dark'
  } else {
    document.documentElement.classList.remove('dark')
    localStorage.theme = 'light'
  }
}
</script>
<script type="ts">
export default {
  name: "NavBarComponent"
}
</script>
<style scoped>
</style>
