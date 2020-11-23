<template>
  <div class="mypage">
    <MyPageHeader :user="user"/>
    <MyHabits :user="user"/>
  </div>
</template>

<script>
import axios from 'axios';
import MyPageHeader from './MyPageHeader'
import MyHabits from './MyHabits'


export default{
  data(){
    return{
      user:{}
    }
  },
  props:{
    id:Number
  },
  components:{
    MyPageHeader,
    MyHabits
  },
  created(){
  
    axios
    .get(`/api/v1/users/${this.id}`)
    .then(response => {
      
       this.user=response.data
    })
  }

}

</script>

<style scoped lang="scss">
  

</style>
