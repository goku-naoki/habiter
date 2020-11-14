import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
const day=new Date
const store = () => {
    return new Vuex.Store({
        state: {
            selectedDate:day,
            currentUser:{},
        },
        mutations: {
            setDate(state, val) {
                state.selectedDate = val
            },
            setCurrentUser(state, val) {
              state.currentUser = val
          },
        },
        actions: {
        }
    })
}

export default store
