<template>
  <div class="detail-header">
    <div class="detail-header__inner">
      <div class="detail-header__inner-left">
        <router-link to="/">
          <v-icon>mdi-arrow-left-bold</v-icon>
        </router-link>
        <p class="detail-header__inner-left__name">
          {{name}}
        </p>
      </div>
      <div class="detail-header__inner-right">
        <v-icon>mdi-dots-horizontal-circle</v-icon>
        <div class="detail-header__modal">
          <ul class="detail-header__modal__list">
            <li class="detail-header__modal__list__item">
              <router-link to="/">
                <p class="detail-header__modal__list__item-left">
                  編集
                </p>
                <div class="detail-header__modal__list__item-right">
                  <v-icon> mdi-grease-pencil</v-icon>
                </div>
              </router-link>
            </li>
            <li class="detail-header__modal__list__item">
              <router-link to="/">
                <p class="detail-header__modal__list__item-left">
                  履歴
                </p>
                <div class="detail-header__modal__list__item-right">
                  <v-icon> mdi-view-split-vertical</v-icon>
                </div>
              </router-link>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default{
  data(){
    return{
      name:""
    }
  },
  props:{
      habit:Object
    },
  computed:{
    habitName(){
      return this.habit.name
    }
  },
  watch:{
    habit(val){
      this.name=val.name  //propsの取得に時間がかかる？？？？
    }
  },
  created(){
    
  }
  
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
        .detail-header__modal{
          width:200px;
          position:absolute;
          right:0;
          top:50px;
          background:white;
          box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
          border-radius:5px;
          &__list{
            width:90%;
            margin:0 auto;
            &__item{
              height:36px;
               &:not(:last-child){
                border-bottom:rgba(0, 0, 0, 0.1) solid 1px;
                }
              a{
                height:100%;
                display: flex;
                justify-content: space-between;
                align-items: center;
                color:#404040;
                .detail-header__modal__list__item-left{
                  font-size:1.2rem;
                }
                i{
                  color:#404040;
                }

              }
            }
          }
        }
      }
    }
  }

</style>
