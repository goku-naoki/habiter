<template>
  <li class="followed_list">
    {{followed.nickname}}
  </li>
</template>


<script>
import axios from 'axios';

export default{

  props:{
    followed:Object
  }
 
  

}

</script>

<style scoped lang="scss">
  

</style>
