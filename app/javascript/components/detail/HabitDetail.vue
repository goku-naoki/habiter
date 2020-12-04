<template>
  <div class="habit-detail">
    <DetailHeader :habit-user="userHabit" @updated="updated"/>
    <div class="habit-detail__main">
      <HabitProgress :habit-user="userHabit"/>
      <HabitCalender :habit-user="userHabit"/>
    </div>
    <Footer></Footer>
  </div>
</template>

<script>
import axios from 'axios';
import DetailHeader from './DetailHeader'
import HabitProgress from './HabitProgress'
import HabitCalender from './HabitCalender'
import Footer from '../global/Footer' 

export default{
  data(){

    return{
      userHabit:{
        
      },
    }
  },
  props:{
      id:Number
    },
  methods:{
    updated(response){
     
      this.userHabit=response
  
    }
  },
  created(){
    axios
      .get(`/api/v1/habits/${this.id}`)
      .then(response => {
        this.userHabit=response.data
      })
  },
  components:{
    DetailHeader,
    HabitProgress,
    HabitCalender,
    Footer
  }
}

</script>

<style scoped lang="scss">
  .habit-detail__main{
    height:100vh; //footerとheaderがfixedだから
    overflow: scroll;
    padding-top:60px;
   margin-bottom: 50px;
  }
</style>