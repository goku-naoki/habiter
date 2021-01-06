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
      today:today,
      details:[
        {icon:'mdi-fire',value:-1,title:"総達成",id:0},
        {icon:'mdi-clock-start',value:-1,title:"開始日",id:1},
        {icon:'mdi-cached',value:-1,title:"連続日数",id:2},
        {icon:'mdi-check-all',value:-1,title:"今月達成度",id:3},
      ]
    }
  },
  props:{
    userHabit:{}
  },
  methods:{
    //連続達成をcheck
    checkCont(arr){
      let result=[]
      this.sortDone(arr)

      //todayを含んでいれば
      if(arr.some(cur=>cur.done_date==this.moment(this.today))){
    
        //まず、本日以降のdoneは除外
        result=arr.filter((cur,index)=>{
            return this.today>=new Date(cur.done_date)   //todayもしくは、以前の日付のみにフィルター
        })
        .filter((cur,index)=>{
          return Math.floor((this.today - new Date(cur.done_date))/86400000)==index  //1日は86400000ミリ秒 (date2 - date1) / 8640000で差分確認
        })
      }
     return `${result.length}日`
    },

    //今月の達成割合
    getRate:function(arr){
       let resultAr=[]
       this.sortDone(arr)

       //今月checkした物のみ抽出
       resultAr=arr.filter((cur)=>{
         return this.momentMonth(new Date(cur.done_date))==this.momentMonth(this.today)
       })
      
       const lastDate=this.getLastDate(this.today)
    
       return `${Math.round((resultAr.length/lastDate*100) * 10) / 10}%`  //少数第一まで出すために、aroundで*10して/10
    },

    //当月の日数を取得,最終日==日数
    getLastDate:function(date){
        
      const lastDate=new Date(date.getFullYear(),date.getMonth()+1,0).getDate()  //当月+1で0指定することで、当月の最終日
      return lastDate
    },

    //日付が新しい順にソートする
    sortDone:function(arr){
      arr.sort((a,b)=>{
        if(a.done_date>b.done_date){
          return -1   //返り値が負の際に、左に動く
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
    userHabit(val){
  
      this.details[1].value=this.beauty(val.start_date)

      if(val.done_habits.length!=0){
       
        this.details[0].value=val.done_habits.length
        this.details[2].value=this.checkCont(val.done_habits)
        this.details[3].value=this.getRate(val.done_habits)
      }else{
        this.details[0].value=0
        this.details[2].value=0
        this.details[3].value="0%"
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
              // position: static;
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