<template>
  <div class='habit-index'>
    <IndexHeader/>
    <HabitList :habits="habits" />
  </div>
</template>

<script>
import axios from 'axios';
import IndexHeader from './IndexHeader'
import HabitList from './HabitList'

export default{

  data(){
    return{
      habits:[]
    }
  },
  created(){
    axios
      .get('/api/v1/habits')
      .then(response => {
        this.habits = response.data
      })
  },
  components:{
    IndexHeader,
    HabitList
  }
 
}
</script>
