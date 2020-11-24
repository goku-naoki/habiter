<template>
  <div class="mypage-header">
    <div class="mypage-header__inner">
      <div class="mypage-header__inner__left">
        <v-icon>mdi-account-circle</v-icon>
        <p class="mypage-header__inner__left-name">{{user.nickname}}</p>
      </div>
      <div class="mypage-header__inner__right">
        <v-icon @click="logout">mdi-home-export-outline</v-icon>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Csrf from '../..//mixins/csrf'

export default{
  props:{
    user:Object
  },
  methods:{
    logout(event){
      event.preventDefault()
      this.setAxiosDefaults();

       axios.delete(
        '/users/sign_out'
      )
      .then(response => {
        this.updateCsrfToken(response.data.csrf_token);
        this.$router.push({path: '/user/signin'});
      })
    }
  },
  mixins:[
    Csrf,
    ],


  

}

</script>

<style scoped lang="scss">
  .mypage-header{
    width:100%;
    height:60px;
    z-index: 0;
    position: relative;  //下ボックスの重なり解除
    box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
    &__inner{
      width:95%;
      height:100%;
      margin:0 auto;
      display: flex;
      justify-content: space-between;
      background:white;
      &__left{
        display:flex;
        align-items: center;
        i{
          position:relative;
          top:2px;
          margin-right:15px;
          font-size:30px;
        }
        &-name{
          font-size:2rem;
        }
       
      }
      &__right{
        display: flex;
        align-items: center;
        i{
          font-size:30px;
        }
      }
    }
  }

</style>
