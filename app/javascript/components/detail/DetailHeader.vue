<template>
  <div class="detail-header">
    <div class="detail-header__inner">
      <div class="detail-header__inner-left">
        <router-link to="/">
          <v-icon>mdi-arrow-left-bold</v-icon>
        </router-link>
        <p class="detail-header__inner-left__name">
          {{habit.name}}
        </p>
      </div>
      <div class="detail-header__inner-right">
        <v-icon>mdi-dots-horizontal-circle</v-icon>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

// import moment from 'moment';
// import Csrf from '../..//mixins/csrf'
export default{
  props:{
      habit:Object
    },
  
}

</script>

<style scoped lang="scss">
  .detail-header{
    width:100%;
    height:60px;
    margin-bottom:20px;
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
      &-left{
        display:flex;
        align-items: center;
        a{
          margin-right:15px;
          i{
            color:#34acbc;
          }
        }
        &__name{
          font-size:2rem;
        }
      }
      &-right{
        display:flex;
        align-items: center;
        position:relative;
        i{
          color:#34acbc;
        }
      }
    }
  }

</style>
