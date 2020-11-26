<template>
  <input @keyup="UserSearch"  v-model="keyword" placeholder="ユーザーを検索">
</template>

<script>
import axios from 'axios';

import Csrf from '../..//mixins/csrf'
export default{
  data(){
    return{
      keyword:""
    }
  },
  methods:{
    UserSearch(){
      
    }
  }
 
}
</script>

<style scoped lang="scss">
  input{
    height: 25px;
    width: 150px;
    border-radius: 10px;
    border: 1px solid rgba(0,0,0,0.1);
    outline: none;
  }
</style>