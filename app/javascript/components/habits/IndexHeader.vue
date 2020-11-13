<template>
  <div class="index-header">
    <div class="index-header__inner">
      <div class="index-header__inner-left">
        <p class="index-header__inner-left__data">
          <template v-if="isToday">今日</template>
          <template v-else>{{date| moment}}</template>
        </p>
      </div>
      <div class="index-header__inner-right">
        <label for="select-date" class="index-header__inner-right_calender">
          <v-icon>mdi-calendar-range</v-icon>
        </label>
       <Datepicker  id="select-date" v-model="date"></Datepicker>
        <router-link to="/habit/new">
           <v-icon>mdi-pencil-plus-outline</v-icon>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Datepicker from 'vuejs-datepicker';
import moment from 'moment';

export default{
  data(){
    const today=new Date
    return{
      date:today,
      today:today,
      isToday:false
    }
  },
  methods:{
    hoge:function(){
      console.log("hoge")
    },
    checkToday(){
      const today=this.beauty(this.today)
      const date=this.beauty(this.date)
      if(today==date){
        this.isToday=true
      }else{
        this.isToday=false
      }
    },
    beauty: function (date) {
      return moment(date).format('YYYY-MM-DD');
    }
  },
  computed:{
    selected_date(){
      return this.$store.state.selectedDate
    }
  },
  watch: {
    date:function(date){
      this.$store.commit("setDate", date)
      console.log(date,this.today)
      this.checkToday()
    }
  },
  filters:{
    moment: function (date) {
      return moment(date).format('M月D日');
    }

  },
  created(){
   
    this.checkToday()
  },

  components : {
    Datepicker
  }
 
}
</script>


<style scoped lang="scss">
.index-header{
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
    &-left{
      display:flex;
      align-items: center;
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
    .vdp-datepicker__calendar{
      left: -220px;
      top: 60px;
    }
  } 
  
}
</style>