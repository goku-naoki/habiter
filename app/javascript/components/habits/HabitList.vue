<template>
  <div class="habit-list">
    <ul class="habit-list__box">
      <li class="habit-list__box__item">
        <div class="habit-list__box__item-left">
          <v-icon>mdi-checkbox-blank-circle-outline</v-icon>
        </div>
        <div class="habit-list__box__item-rigth">
          <p>ランニング</p>
        </div>
      </li>
      <li class="habit-list__box__item">
        <div class="habit-list__box__item-left">
          <v-icon>mdi-checkbox-blank-circle-outline</v-icon>
        </div>
        <div class="habit-list__box__item-rigth">
          <p>瞑想</p>
        </div>
      </li>
      <li class="habit-list__box__item">
        <div class="habit-list__box__item-left">
          <v-icon>mdi-checkbox-blank-circle-outline</v-icon>
        </div>
        <div class="habit-list__box__item-rigth">
          <p>読書</p>
        </div>
      </li>
      <li class="habit-list__box__item">
        <div class="habit-list__box__item-left">
          <v-icon>mdi-checkbox-blank-circle-outline</v-icon>
        </div>
        <div class="habit-list__box__item-rigth">
          <p>Gym</p>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';


export default{

 
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