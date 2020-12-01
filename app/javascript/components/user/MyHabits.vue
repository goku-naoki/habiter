<template>
  <div class="my-habits">
    <div class="my-habits__inner">
      <p class="my-habits__inner-title">
        Habits
      </p>
      <ul class="my-habits__inner__list">
        <MyHabit :habit-user="habitUser" v-for="habitUser in user.habit_users" :key="habitUser.id"/>
      </ul>
    </div>
  </div>
</template>


<script>
import axios from 'axios';
import MyHabit from './MyHabit'
export default{

   props:{
    user:{
      habit_users:Array
    }
  },
  

components:{
  MyHabit
}

  

}

</script>

<style scoped lang="scss">
  .my-habits{
    width:100%;
    height:100vh;
    padding-top:60px;
    margin-bottom: 50px;
    overflow: scroll;
    &__inner{
      width:95%;
      height: 100%;;
      margin:0 auto;
      padding-top:40px;
      &-title{
        font-size:1.8rem;
        margin-bottom:20px;
      }
      &__list{
        display: flex;
        flex-wrap:wrap;
      }
    }
  }

</style>
