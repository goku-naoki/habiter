<template>
  <div class="mypage">
    <MyPageHeader :user="user" @userUpdated="userUpdated"/>
    <MyHabits :user="user"/>
    <Footer></Footer>
  </div>
</template>

<script>
import axios from 'axios';
import MyPageHeader from './MyPageHeader'
import MyHabits from './MyHabits'
import Footer from '../global/Footer' 


export default{
  data(){
    return{
      user:{}
    }
  },
  props:{
    id:Number
  },
  methods:{
    fetchUser(){
      axios
      .get(`/api/v1/users/${this.id}`)
      .then(response => {
        this.user=response.data
      })
    },
    userUpdated(val){
     
      this.user=val
      debugger
    }
  },
  watch:{
    id(val){
      this.fetchUser(val)
    }
  },
  
  created(){
    this.fetchUser()
  
  },
  components:{
    MyPageHeader,
    MyHabits,
    Footer
  },

}

</script>

<style scoped lang="scss">
  

</style>
