// vue  hello.vueでも読み込む
import Vue from 'vue';
import Router from 'vue-router';
import axios from 'axios';

//components
import SignUp  from "./components/userAuth/SignUp.vue"
import SignIn  from "./components/userAuth/SignIn.vue"
import HabitIndex from './components/habits/HabitIndex.vue'

Vue.use(Router)
const router = new Router({
  routes: [
    { path: '/user/signup', 
      name: 'SignUp',
      component: SignUp,
      meta: {
        isPublic: true,
        isSignIn: true
      }
    },
    { path: '/user/signin', 
      name: 'SignIn',
      component: SignIn,
      meta: {
        isPublic: true,
        isSignIn: true
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
  const isSignIn=to.matched.some(page => page.meta.isSignIn)
  axios
    .get('/api/v1/users/check_auth.json')
    .then(response => {
      if(isSignIn){
        if(response.data.auth) {
          next('/')
            }
        else{
          next()
          }
      }
      else if(isPublic){
        next()
      }
      else {
        if(response.data.auth) {
          next()
            }
        else{
          next('/user/signup')
          }
      }    

    })
  
})

export default router