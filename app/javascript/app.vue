<template>
  <div id="app">

    <router-view></router-view>

  </div>
</template>

<script>
import axios from 'axios';
import 'normalize.css'
// import Header from './components/globals/Header' 



export default{
  data(){
    return{
   
    }
  },
  beforeCreate(){
    
  },

   watch: {
     //前回のpathをstoreに
    '$route'(to, from) {
      this.$store.commit("setFromPath", from.path)
    }
},
  created(){
   
   const that=this
    axios
    .get("/api/v1/users/get_user")
    .then(response => { 
       that.$store.commit("setCurrentUser", response.data)
    })
  },
  components:{
   
  }

}

</script>

<style>

*{
  box-sizing:border-box;
  margin:0;
  padding:0;
}
html{
  font-size:62.5% !important;
}
body{
  font-family: "Montserrat","游ゴシック",YuGothic,"ヒラギノ角ゴ ProN W3","Hiragino Kaku Gothic ProN","メイリオ",Meiryo,sans-serif;
  color:#404040;
}

a{
  text-decoration: none;
}
ul{
  list-style: none;
}

img{
  vertical-align: bottom;
}




</style>