<template>
  <div class="w-full">
    <footer
        class="text-center lg:text-left bg-slate-100 text-slate-600 dark:bg-slate-900 dark:text-slate-500 pt-1">
      <div class=" mx-auto max-w-7xl border-t border-slate-300 dark:border-slate-700">
        <div class="mx-6 py-10 text-center md:text-left">
          <div class="grid grid-1 md:grid-cols-2 lg:grid-cols-2 gap-8">
            <div class="">
              <h6 class="uppercase font-semibold mb-4 flex items-center justify-center md:justify-start">
                Wheater App
              </h6>
              <p>
                App make with <a href="https://flutter.dev/" target="_blank" class="underline" title="Flutter">Flutter</a> for portfolio. With <a href="https://openweathermap.org/" target="_blank" class="underline" title="OpenWheather">OpenWheather</a>
                to get wheater status, <a href="https://erikflowers.github.io/weather-icons/" target="_blank" class="underline" title="Wheater Icons">Wheater Icons</a> and
                <a href="https://fontawesome.com/" target="_blank" class="underline" title="Font Awesome">Font Awesome</a> to beautify app.
              </p>
            </div>
            <div class="">
              <h6 class="uppercase font-semibold mb-4 flex justify-center md:justify-start">
                Resources
              </h6>
              <p>
                In the app you can get weather data from current location or insert a city. You also can configure theme (dark/light mode), language and unit to show weather data.
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="text-center p-6 bg-slate-200 dark:bg-slate-800">
        <span>&copy; 2022 Copyright - </span>
        <a class="text-slate-600 font-semibold" href="https://www.jrmessias.com.br">jrmessias</a>
      </div>
    </footer>
  </div>
</template>

<script>
export default {
  name: "FooterComponent"
}
</script>

<style scoped>

</style>
