<template>
  <div class="index-header">
    <div class="index-header__inner">
      <div class="index-header__inner-left">
        <p class="index-header__inner-left__data">
          今日
        </p>
      </div>
      <div class="index-header__inner-right">
        <a class="index-header__inner-right_calender">
          <v-icon>mdi-calendar-range</v-icon>
        </a>
       
        <router-link to="/habit/new">
           <v-icon>mdi-pencil-plus-outline</v-icon>
        </router-link>
         
       
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';


export default{

 
}
</script>


<style scoped lang="scss">
.index-header{
  width:100%;
  height:60px;
  z-index: 0;
  position: relative;  //下ボックスの重なり解除
  box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
  &__inner{
    width:95%;
    height:100%;
    margin:0 auto;
    display: flex;
    justify-content: space-between;
    background:white;
    &-left{
      display:flex;
      align-items: center;
    }
    &-right{
      display:flex;
      align-items: center;
      a{
        height:40px;
        width:40px;
        display: flex;
        justify-content: center;
        align-items: center;
        background:#34acbc;
        border-radius: 50%;
        margin-right:15px;
        i{
           color:white;
        }
      }
    }
  }
}

</style>