<template>
  <li class="habit-item">
    <router-link :to="{ name: 'HabitDetail', params: { id: habitUser.id } } ">
      <div class="habit-item__inner">
        <p>{{habitUser.habit.name}}</p>
      </div>
    </router-link>
  </li>
</template>


<script>
import axios from 'axios';

export default{

   props:{
    habitUser:Object
  },
  



  

}

</script>

<style scoped lang="scss">
  .habit-item{
    width:48.75%; 
    height:35vh;
    margin-bottom:2.5%;
    background:rgba(0,0,0,0.1);
    box-shadow: 0 2.5rem 2rem -2rem hsl(200 50% 20% / 40%);
    border-radius: 10px;
    a{
      height:100%;
      display: block;
      color:#404040;
      font-weight: 500;
      .habit-item__inner{
        width:90%;
        height:100%;
        padding-top:30px;
        margin:0 auto;
        p{
          font-size:2.4rem;
        }

      }
    }
  }

  @media screen and (min-width: 890px) {

    .habit-item{
      width:calc(95% / 3); 
    }
  }

</style>
