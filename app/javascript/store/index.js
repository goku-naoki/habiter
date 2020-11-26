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
        getters:{
            currentUser(state){return state.currentUser}
        },
        mutations: {
            setDate(state, val) {
                state.selectedDate = val
            },
            setCurrentUser(state, val) {
           
               state.currentUser = val.user  //userまで指定しないと、computed上手く取得出来ない
               //sign時とappでのvalの指定深さが違った
          }, 
        },
        actions: {
        }
    })
}

export default store
