<template>
  <li class="followed-user">
    <router-link :to="{ name: 'MyPage', params: { id: followed.id } } ">
      <div class="followed-user__icon">
        <v-icon >mdi-account</v-icon>
      </div>
      <div class="followed-user__name">
        {{followed.nickname}}
      </div>
    </router-link>
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
  .followed-user{
    width:20%;
    position: relative;
    text-align: center;
    border-radius:50%;
    background: #34acbd;
    cursor:pointer !important;
    &:not(:nth-child(4n)){
      margin-right:calc(20% / 3);
    }
    &:before{
      content: "";
      display: block;
      padding-top: 100%;
    }
    a{
      height:100%;
      display: flex;
      flex-direction: column;
      justify-content: center;
      color:#404040;
      position: absolute;
      top: 0;
      left: 0;
      bottom: 0;
      right: 0;
      
      .followed-user__icon{
        margin-bottom:10px;
        i{
        font-size:4rem;
        color:white;
       }
      }
    }
  }

  @media screen and (max-width: 627px) {

    .followed-user{
      width:30%;
      &:not(:nth-child(4n)){
        margin-right:calc(10% / 3);
      }
    }
   
  
     

  }
</style>
