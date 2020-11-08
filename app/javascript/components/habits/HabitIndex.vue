<template>
  <div class='habit-index'>
    <IndexHeader/>
    <HabitList/>
  </div>
</template>

<script>
import axios from 'axios';
import IndexHeader from './IndexHeader'
import HabitList from './HabitList'

export default{
  components:{
    IndexHeader,
    HabitList
  }
 
}
</script>
