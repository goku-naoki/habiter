<template>
  <input @keypress="UserSearch"  v-model="keyword" placeholder="ユーザーを検索">
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
      axios
      .get("/api/v1/users/search",{
        params:{keyword:this.keyword}
      })
      .then(response => {
    
        let users=response.data
        if(response.data.length==0){
          users=[]
        }
        this.$emit("getResult",users)
    })
    }
  },
  watch:{
    keyword(val){
      if(val.length==0){
        this.$emit('cancelSearch',val)
      }
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