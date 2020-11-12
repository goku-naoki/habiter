import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
const day=new Date
const store = () => {
    return new Vuex.Store({
        state: {
            selectedDate:day,
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

