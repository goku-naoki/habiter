<template>
  <div class="index-header">
    <div class="index-header__inner">
      <div class="index-header__inner-left">
        <p class="index-header__inner-left__date">
          <template v-if="isToday">今日</template>
          <template v-else>{{date| beautyDate}}</template>
        </p>
      </div>
      <div class="index-header__inner-right">
        <label for="select-date" class="index-header__inner-right_calender">
          <v-icon>mdi-calendar-range</v-icon>
        </label>

        <Datepicker  id="select-date" v-model="date"></Datepicker>
        <v-icon @click="toggleForm">mdi-pencil-plus-outline</v-icon>

        <template v-if="isFormTouched">
          <HabitAdd  @cancel="toggleForm" @added="added"/>
          <ModalWrapper @clickModal="toggleForm"/>
        </template>

      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Datepicker from 'vuejs-datepicker';
import moment from 'moment';
import HabitAdd from './HabitAdd'
import ModalWrapper from '../global/ModalWrapper'

export default{
  data(){
    return{
      date:0,          //computedのvuexのstateが入る
      isToday:false,   //選択日と本日の日付が一致しているか
      isFormTouched:false  //習慣追加のフォーム開いているか
    }
  },
  methods:{

    //選択日と本日が一致しているか確認
    checkToday(){
      const today=this.moment(new Date)
      const date=this.moment(this.date)

        if(today==date){
          this.isToday=true
        }else{
          this.isToday=false
        }
    },

    //日付の整形
    moment(date) {
      return moment(date).format('YYYY-MM-DD');
    },

    //習慣追加のボタン押した際の処理
    toggleForm(){
      if(!this.isFormTouched){
        this.isFormTouched=true
      }else{
        this.isFormTouched=false
      }
    },

    //新たな習慣追加のemit
    added(response){
      this.toggleForm()
      this.$emit('added',response)  //indexにemitで上げる
    }
  },
  computed:{
    selected_date(){
      return this.$store.state.selectedDate
    }
  },
  watch: {

    //computedで取得出来次第、dateに代入。
    selected_date(date){
      this.date=date
      this.checkToday()
    },

    //選択日が変更された際に、state変更
    date(val){
      this.$store.commit("setDate",val)
      this.checkToday()
    }
  },
  filters:{

     //日付の整形
    beautyDate(date) {
      return moment(date).format('M月D日');
    }
  },
  created(){

    this.date=this.selected_date
    this.checkToday()
  },

  components : {
    HabitAdd,
    Datepicker,
    ModalWrapper
  }
 
}
</script>


<style scoped lang="scss">
.index-header{
  width:100%;
  height:60px;
  position: relative;
  // top:0;  //下ボックスの重なり解除
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
      &__date{
        font-size:1.8rem;
        font-weight:500;
      }
    }
    &-right{
      display:flex;
      align-items: center;
      position:relative;
      label{
        height:40px;
        width:40px;
        display: flex;
        justify-content: center;
        align-items: center;
        background:#34acbc;
        border-radius: 50%;
        margin-right:15px;
        i{
           color:white;
        }
      }
    }
  }
}

</style>

<style lang="scss">
.index-header{
  .vdp-datepicker{
    position: static;
    input{
      width:0px;
      height:0;
      outline: none;
    }
    #day{
      height: 100%;
      width: 100%;
      display: block;
    }
    .vdp-datepicker__calendar{
      left: -220px;
      top: 60px;
    }
  } 
  
}
</style>