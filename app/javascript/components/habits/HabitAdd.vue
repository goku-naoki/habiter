<template>
  <form class="habit-add">
    <div class="habit-add__header">
      <div class="habit-add__header__inner">
        <div class="habit-add__header__inner-left">
          キャンセル
        </div>
        <input class="habit-add__header__inner-right" type="submit" value="保存">
      </div>
    </div>
    <div class="habit-add__form">
      <div class="habit-add__form__name">
        <input type="text" v-model="name"  placeholder="習慣の名前" >
      </div>
      <div class="habit-add__form__detail">
        <div class="habit-add__form__detail__item">
          <div class="habit-add__form__detail__item-left">
            <v-icon>mdi-calendar-range</v-icon>
            <p>開始日</p>
          </div>
          <div class="habit-add__form__detail__item-right">
            <input type="text"  value="2020/11/1" >
          </div>
        </div>
        <div class="habit-add__form__detail__item">
          <div class="habit-add__form__detail__item-left">
            <v-icon>mdi-calendar-range</v-icon>
            <p>開始日</p>
          </div>
          <div class="habit-add__form__detail__item-right">
            <input type="text"  value="2020/11/1" >
          </div>
        </div>
        <div class="habit-add__form__detail__item">
          <div class="habit-add__form__detail__item-left">
            <v-icon>mdi-calendar-range</v-icon>
            <p>開始日</p>
          </div>
          <div class="habit-add__form__detail__item-right">
            <input type="text"  value="2020/11/1" >
          </div>
        </div>
        <div class="habit-add__form__detail__item">
          <div class="habit-add__form__detail__item-left">
            <v-icon>mdi-calendar-range</v-icon>
            <p>開始日</p>
          </div>
          <div class="habit-add__form__detail__item-right">
            <input type="text"  value="2020/11/1" >
          </div>
        </div>
      </div>
    </div>
  </form>
</template>

<script>
import axios from 'axios';


export default{

 
}
</script>


<style scoped lang="scss">
  .habit-add{
    background:#fafafa;
    &__header{
      width:100%;
      height:50px;
      margin-bottom:20px;
      background:white;
      color:#34acbc;
      &__inner{
        width:95%;
        height:100%;
        margin:0 auto;
        margin-bottom:20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
    }
    &__form{
      &__name{
        width: 100%;
        height:60px;
        margin-bottom:20px;
        text-align:center;
        line-height:60px;
        background:white;
        input{
          height:40px;
          width:95%;
          margin:0 auto;
          padding:10px 0;
        }
      }
      &__detail{
        width:100%;
        background:white;
        &__item{
          width:95%;
          height:50px;
          margin:0 auto;
          display:flex;
          justify-content:space-between;
          align-items: center;
          border-bottom:1px solid #fafafa;
          &-left{
            display: flex;
            i{
              margin-right:15px;
            }
          }
          &-right{
            input{
              text-align:right;
            }
          }
        }
      }
    }
  }
  
</style>