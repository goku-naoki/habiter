<template>
  <div class="index-header">
    <div class="index-header__inner">
      <div class="index-header__inner-left">
        <p class="index-header__inner-left__data">
          今日
        </p>
      </div>
      <div class="index-header__inner-right">
        <div class="index-header__inner-right_calender">
          %%
        </div>
        <div class="index-header__inner-right_create">
          +
        </div>
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
  background:#34acbc;
  box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
  &__inner{
    width:95%;
    height:100%;
    margin:0 auto;
    display: flex;
    justify-content: space-between;
    background:white;
    &-left{

    }
    &-right{
      display:flex
    }
  }
}

</style>