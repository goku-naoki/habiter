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

  data(){
    return{

    }
  },
  created(){
    axios
      .get('/api/v1/posts.json')
      .then(response => {
        this.posts = response.data
        this.isLoading=false
      })
  },
  components:{
    IndexHeader,
    HabitList
  }
 
}
</script>
