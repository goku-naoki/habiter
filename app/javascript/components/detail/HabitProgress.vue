<template>
  <div class="habit-progress">
    <ul class="habit-progress__list">
      <li class="habit-progress__list__item">
        <div class="habit-progress__list__item__inner">
          <div class="habit-progress__list__item__inner-left">
           <v-icon>mdi-fire</v-icon>
          </div>
          <div class="habit-progress__list__item__inner-right">
            <p class="habit-progress__list__item__inner-right__detail" >
              {{times}}
            </p>
            <p class="habit-progress__list__item__inner-right__title">
              達成
            </p>
          </div>
        </div>
      </li>
      <li class="habit-progress__list__item">
      </li>
      <li class="habit-progress__list__item">
      </li>
      <li class="habit-progress__list__item">
      </li>

    </ul>
  </div>

  
</template>

<script>
import axios from 'axios';
import moment from 'moment';

export default{
  data(){
    return{
      times:0,
      startDate:0
    }
  },
  props:{
    habitUser:{
     

    }
  },
  methods:{
    checkCont(arr){
      arr.sort((a,b)=>{
        if(a.done_date>b.done_date){
          return -1
        }else{
          1
        }
      })
      const today=new Date()
      if(arr[0].done_date==this.moment(today)){
       let result=arr.filter((cur,index)=>{
           debugger
         return Math.floor((today - new Date(cur.done_date))/86400000)==index
        
       })
       
      }
     
    },
     moment: function (date) {
      return moment(date).format('YYYY-MM-DD');
    }
  },
  watch:{
    habitUser(val){
  
      this.times=val.habit_dones.length
      this.startDate=val.start_date
      this.checkCont(val.habit_dones)
    }
  }


}
</script>

<style scoped lang="scss">
  .habit-progress{
    width:95%;
    margin:0 auto;
    border-bottom:1px solid rgba(0, 0, 0, 0.1);
   overflow:scroll;
    &__list{
      width:200vw;
      height:100px;
      display: flex;
      align-items: center;
      &__item{
        width:250px;
        height:70px;
        background:rgba(0, 0, 0, 0.1);
        border-radius: 4px;;
        margin-right:20px;
        &__inner{
          width:90%;
          height:100%;
          display: flex;
          align-items: center;
          margin:0 auto;
          &-left{
            margin-right:15px;
            i{
              font-size:4rem;
            }
          }
          &-right{
           display: flex;
           align-items: center;
            &__detail{
              margin-right:10px;
              font-size:2rem;
              font-weight:bold;
              color:black;
            }
            &__title{
              font-size:1.6rem;
            }

          }
        }
      }
    }
    
  }
</style>