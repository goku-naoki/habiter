<template>
  <div class="habit-progress">
    <ul class="habit-progress__list">
      <li class="habit-progress__list__item" v-for="detail in details" :key="detail.id">
        <div class="habit-progress__list__item__inner">
          <div class="habit-progress__list__item__inner-left">
           <v-icon :class="`icon-${detail.id}`">{{detail.icon}}</v-icon>
          </div>
          <div class="habit-progress__list__item__inner-right">
            <p class="habit-progress__list__item__inner-right__detail" v-if="detail.value!=-1" >
              {{detail.value}}
            </p>
            <p class="habit-progress__list__item__inner-right__title">
             {{detail.title}}
            </p>
          </div>
        </div>
      </li>
    </ul>
  </div> 
</template>

<script>
import axios from 'axios';
import moment from 'moment';

export default{
  data(){
    const today=new Date()
    return{
      icon:'mdi-dots-horizontal-circle',
      times:0,
      startDate:0,
      countiTimes:0,
      monthLate:0,
      today:today,
      details:[
        {icon:'mdi-fire',value:-1,title:"達成",id:0},
        {icon:'mdi-clock-start',value:-1,title:"開始",id:1},
        {icon:'mdi-cached',value:-1,title:"連続",id:2},
        {icon:'mdi-check-all',value:-1,title:"今月達成",id:3},
      ]
    }
  },
  props:{
    habitUser:{}
  },
  methods:{
    checkCont(arr){
      let result=[]
      this.sortDone(arr)
      if(arr[0].done_date==this.moment(this.today)){
        result=arr.filter((cur,index)=>{
         return Math.floor((this.today - new Date(cur.done_date))/86400000)==index
       })
      }
     return `${result.length}日`
    },
    getRate:function(arr){
       let resultAr=[]
       this.sortDone(arr)
       resultAr=arr.filter((cur)=>{
        //  if(this.momentMonth(new Date(cur.done_date))!=this.momentMonth(this.today)){
           
        //  }
         return this.momentMonth(new Date(cur.done_date))==this.momentMonth(this.today)
       })
      
       const lastDate=this.getLastDate(this.today)
    
       return `${Math.round((resultAr.length/lastDate*100) * 10) / 10}%`
    },
    getLastDate:function(date){
        
      const lastDate=new Date(date.getFullYear(),date.getMonth()+1,0).getDate()
      return lastDate
    },
    sortDone:function(arr){
      arr.sort((a,b)=>{
        if(a.done_date>b.done_date){
          return -1
        }else{
          1
        }
      })
    },
     moment: function (date) {
      return moment(date).format('YYYY-MM-DD');
    },
    momentMonth:function (date) {
      return moment(date).format('YYYY-MM');
    },
    beauty:function(date){
      return moment(date).format('M月D日');
    }
  },
  
  watch:{
    habitUser(val){
  
      
      this.details[1].value=this.beauty(val.start_date)

      if(val.habit_dones.length!=0){
       
        this.details[0].value=val.habit_dones.length
        this.details[2].value=this.checkCont(val.habit_dones)
        this.details[3].value=this.getRate(val.habit_dones)
      }else{
        this.details[0].value=0
        this.details[2].value=0
        this.details[3].value=0
      }
    }
  }


}
</script>

<style scoped lang="scss">
  .habit-progress{
    width:95%;
    margin:0 auto;
    margin-bottom:30px;
    overflow:scroll;
    &__list{
      height:100px;
      display: flex;
      align-items: center;
      &__item{
        width:250px;
        height:70px;
        background:rgba(0, 0, 0, 0.1);
        border-radius: 4px;;
        flex-shrink: 0;
        &:not(:last-child){
          margin-right:20px;
        }
        &__inner{
          width:90%;
          height:100%;
          display: flex;
          align-items: center;
          margin:0 auto;
          &-left{
            margin-right:10px;
            i{
              position: static;
              z-index: 0;
              color: #34acbc;
              font-size:3rem;
            }
            .icon-0{
              color:red;
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
  @media screen and (min-width: 1118px) {

    .habit-progress__list{
      width:100%;
      margin:0 auto;
      justify-content: space-between;
    }
  }
</style>