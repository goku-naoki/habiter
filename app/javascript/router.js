// vue  hello.vueでも読み込む
import Vue from 'vue';
import Router from 'vue-router';
import axios from 'axios';

//components
import SignUp  from "./components/userAuth/SignUp.vue"
import HabitIndex from './components/habits/HabitIndex.vue'

Vue.use(Router)
const router = new Router({
  routes: [
    { path: '/user/signup', 
      name: 'SignupForm',
      component: SignUp,
      meta: {
        isPublic: true
      }
    },
    { path: '/',
    name: 'HabitIndex',
    component: HabitIndex
    },
   
  ]
 
})


router.beforeEach((to, from, next) => {
  const isPublic=to.matched.some(page => page.meta.isPublic)
  if (isPublic){
      next()
   }
  else {
    axios
      .get('/api/v1/users/check_auth.json')
      .then(response => {
        if(response.data.auth) {
          next()
             }
        else{
          next('/user/signup')
          }
      })
      
   
  }    
})

export default router