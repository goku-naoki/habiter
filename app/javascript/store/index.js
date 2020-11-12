import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store = () => {
    return new Vuex.Store({
        state: {
            selectedDate:"",
        },
        mutations: {
            setDate(state, val) {
                state.selectedDate = val
            },
        },
        actions: {
        }
    })
}

export default store

