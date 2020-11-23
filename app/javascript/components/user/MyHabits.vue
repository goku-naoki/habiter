<template>
  <div class="my-habits">
    <div class="my-habits__inner">
      <p class="my-habits__inner-title">
        習慣
      </p>
      <div class="my-habits__inner__list">
       
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default{

   props:{
    user:Object
  },
  


  

}

</script>

<style scoped lang="scss">
  .my-habits{
    width:100%;
    height:600px;
    padding-top:40px;
    &__inner{
      width:95%;
      height: 100%;;
      margin:0 auto;
      background:pink;
    }
  }

</style>
