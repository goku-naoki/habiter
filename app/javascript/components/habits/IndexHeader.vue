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
        <!-- <router-link to="#"> -->
        <v-icon @click="toggleForm">mdi-pencil-plus-outline</v-icon>
        <HabitAdd v-if="isFormTouched" @cancel="toggleForm" @added="added"/>
        <div @click="toggleForm" v-if="isFormTouched" class="modal-wrapper"></div>
        <!-- </router-link> -->
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Datepicker from 'vuejs-datepicker';
import moment from 'moment';
import HabitAdd from './HabitAdd'

export default{
  data(){
    return{
      // date:this.selected_date,
      date:0,
      isToday:false,
      isFormTouched:false
    }
  },
  methods:{

    checkToday(){
      const today=this.moment(new Date)
      const date=this.moment(this.date)

        if(today==date){
          this.isToday=true
        }else{
          this.isToday=false
        }
    },
    moment: function (date) {
      return moment(date).format('YYYY-MM-DD');
    },
    toggleForm(){
      if(!this.isFormTouched){
        this.isFormTouched=true
      }else{
        this.isFormTouched=false
      }
    },
    added(response){
      this.toggleForm()
      this.$emit('added',response)
    }
  },
  computed:{

    selected_date(){
      return this.$store.state.selectedDate
    }
  },
  watch: {

    selected_date:function(date){
      this.date=date
      this.checkToday()
    },
    date(val){
      this.$store.commit("setDate",val)
      this.checkToday()
    }
  },
  filters:{

    beautyDate: function (date) {
      return moment(date).format('M月D日');
    }
  },
  created(){
    this.date=this.selected_date
    this.checkToday()
  },

  components : {
    HabitAdd,
    Datepicker
  }
 
}
</script>


<style scoped lang="scss">
.index-header{
  width:100%;
  height:60px;
  z-index: 0;
  position: fixed;
  top:0;  //下ボックスの重なり解除
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
      .modal-wrapper{
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          z-index:1;
          background:rgba(0,0,0,0.6)
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