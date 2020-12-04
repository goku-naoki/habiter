<template>
  <div class="habit-list">
    <ul class="habit-list__box" >
      <Habit :user-habit="habit" v-for="habit in habits" :key="habit.id" />
    </ul>
  </div>
</template>

<script>
import Habit from './Habit'

export default{

  props:{
    habits:Array
  },

  components:{
    Habit
  },
  
}
</script>

<style scoped lang="scss">
  .habit-list{
    width:100%;
    height: 100vh;
    padding-top:60px; //header
    margin-bottom: 50px;; //footer
    overflow: scroll;
    &__box{
      width:95%;
      margin:0 auto;
      background: white;
    }
  }
</style>