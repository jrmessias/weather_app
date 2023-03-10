import {createApp, onMounted} from 'vue'
import { createPinia } from 'pinia'
import AOS from "aos";

import App from './App.vue'
import router from './router'

import './assets/main.css'
import "aos/dist/aos.css";

const app = createApp(App)

app.use(createPinia())
app.use(router)

onMounted(() => {
    AOS.init();
});

app.mount('#app')
