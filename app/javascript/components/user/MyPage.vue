<template>
  <div class="mypage">
    <MyPageHeader :user="user"/>
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
    getUser(id){
      axios
      .get(`/api/v1/users/${id}`)
      .then(response => {
        this.user=response.data
      })
    }
  },
  watch:{
    id(val){
      this.getUser(val)
    }
  },
  
  created(){
    this.getUser(this.id)
  
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
