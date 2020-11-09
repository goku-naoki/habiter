<template>
  <div class="habit-list">
    <ul class="habit-list__box">
      <li class="habit-list__box__item" v-for="habit in habits" :key="habit.id">
        <div class="habit-list__box__item-left">
          <v-icon>mdi-checkbox-blank-circle-outline</v-icon>
        </div>
        <div class="habit-list__box__item-rigth">
          <p>{{habit.name}}</p>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';


export default{
  props:{
    habits:Array
  }

 
}
</script>


<style scoped lang="scss">
  .habit-list{
    width:100%;
    &__box{
      width:95%;
      margin:0 auto;
      background: white;
      &__item{
        width:100%;
        height:70px;
        display:flex;
        align-items: center;
        border-bottom:1px solid rgba(0, 0, 0, 0.1);
        &-left{
          margin-right:2%;
          i{
            color:#34acbc;
          }
        }
      }
    }
  }
</style>