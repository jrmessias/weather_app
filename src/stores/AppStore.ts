import {defineStore} from "pinia";

export const useAppStore = defineStore("AppStore", {
    state: () => {
        return {
            isDark: false,
        }
    },
    actions:{
        toggleDark(){
            this.isDark = !this.isDark;
        }
    },
    getters: {
        getDark():boolean{
            return this.isDark;
        }
    }
})
