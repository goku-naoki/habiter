<template>
  <div id="app">

    <!-- <Header></Header> -->
    <router-view></router-view>
    <!-- <Footer></Footer> -->

  </div>
</template>

<script>
import axios from 'axios';
// import Header from './components/globals/Header' 
// import Footer from './components/globals/Footer' 


export default{
  data(){
    return{
   
    }
  },
  created(){
    
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