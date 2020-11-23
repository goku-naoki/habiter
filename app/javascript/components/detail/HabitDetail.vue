<template>
  <div>
    <DetailHeader :habit-user="habitUser" @updated="updated"/>
    <HabitProgress :habit-user="habitUser"/>
    <HabitCalender :habit-user="habitUser"/>
  </div>
  
</template>

<script>
import axios from 'axios';
import DetailHeader from './DetailHeader'
import HabitProgress from './HabitProgress'
import HabitCalender from './HabitCalender'

export default{
  data(){
    console.log('hoge')
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
    HabitCalender
  }
}

</script>

<style scoped lang="scss">

</style>