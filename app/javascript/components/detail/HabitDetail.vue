<template>
  <div>
    <DetailHeader :habit="habitUser.habit"/>
    <HabitProgress :habit-user="habitUser"/>
  </div>
  
</template>

<script>
import axios from 'axios';
import DetailHeader from './DetailHeader'
import HabitProgress from './HabitProgress'
// import moment from 'moment';
// import Csrf from '../..//mixins/csrf'
export default{
  data(){
    console.log('hoge')
    return{
      habitUser:{
        
      }
    }
  },
  props:{
      id:Number
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
    HabitProgress
  }
}

</script>

<style scoped lang="scss">

</style>