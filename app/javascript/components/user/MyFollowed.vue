<template>
  <li class="followed-user">
    <router-link :to="{ name: 'MyPage', params: { id: followed.id } } ">
      <div class="followed-user__icon">
        <v-icon v-if="followed.id!=null && followed.photo==null">mdi-account</v-icon>
        <div v-else-if="followed.photo" class="followed-user__photo">
          <img  :src="followed.photo">
        </div>
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
    background: rgba(0,0,0,0.1);
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
        display: flex;
        justify-content: center;
        margin-bottom:10px;
        .followed-user__photo{
          width:40px;
          height:40px;
          img{
            height:100%;
            width: 100%;
            border-radius:50%;
          }
        }
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
