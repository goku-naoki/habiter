<template>
  <div class="habit-detail">
    <DetailHeader :habit-user="habitUser" @updated="updated"/>
    <div class="habit-detail__main">
      <HabitProgress :habit-user="habitUser"/>
      <HabitCalender :habit-user="habitUser"/>
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
      habitUser:{
        
      },
    }
  },
  props:{
      id:Number
    },
  methods:{
    updated(response){
     
      this.habitUser=response
  
    }
  },
  created(){
    axios
      .get(`/api/v1/habits/${this.id}`)
      .then(response => {
        this.habitUser=response.data
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