<template>
  <ul class="user-list">
    <template v-if="users.length!=0">
      <li class="user-list__item" v-for="user in users" :key="user.id" >
        <router-link :to="{ name: 'MyPage', params: { id: user.id } } ">
          <div class="user-list__item__left">
            <v-icon>mdi-account</v-icon>
          </div>
          <div class="user-list__item__right">
            {{user.nickname}}
          </div>
        </router-link>
      </li>
    </template>
    <template v-else>
      <li class="user-list__item-no">
        <p>該当ユーザー無し</p>
      </li>
    </template>
  </ul>
</template>

<script>
import axios from 'axios';

import Csrf from '../..//mixins/csrf'
export default{
  data(){
    return{
     
    }
  },
  props:{
    users:Array
  },
  methods:{
   
  }
 
}
</script>

<style scoped lang="scss">
  .user-list{
    &__item{
      height:30px;
      width:95%;
      margin:0 auto;
     
      &:not(:last-child){
        border-bottom:1px rgba(0,0,0,0.1) solid;
      }
      a{
        width:100%;
        height:100%;
        display: flex;
        align-items:center;
        color:#404040;
        .user-list__item__left{
          margin-right:15px;
        }
        .user-list__item__right{

        }
      }
    }
    &__item-no{
      height:30px;
      width:95%;
      margin:0 auto;
      display: flex;
      align-items: center;
      justify-content: center;
    }
  }
</style>