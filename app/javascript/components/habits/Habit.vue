<template>
  <li class="habit-list__box__item">
    <div class="habit-list__box__item-left">
      <v-icon v-if=" isDone" @click="undoHabit(userHabit)">mdi-checkbox-marked-circle</v-icon>
      <v-icon v-else @click="doneHabit(userHabit)"> mdi-checkbox-blank-circle-outline</v-icon>
    </div>
    <div class="habit-list__box__item-right">
      <router-link :to="{ name: 'HabitDetail', params: { id: userHabit.id } } ">
        <p>{{userHabit.habit.name}}</p>
      </router-link>
    </div>
  </li>
</template>

<script>
import axios from 'axios';
import moment from 'moment';
import Csrf from '../..//mixins/csrf'
export default{

  data(){
    return{
      done_date:this.selected_date,   //ヘッダーの選択日
      isDone:false,   //習慣にcheckついているか
    }
  },
 
  props:{
    userHabit:Object    //該当習慣1つ
  },
  methods:{

    //習慣にcheckをつける
    doneHabit(habit){
    
      this.setAxiosDefaults();
     
      return (axios.post("/api/v1/habits/done_habit", { 
        done_habit: {
          user_habit_id: this.userHabit.id,
          done_date:this.$store.state.selectedDate.getTime()/1000  //railsの時間に変換
        }
      })
      .then(response => {
        this.isDone=true 
        this.userHabit.done_habits.push(response.data) //該当習慣の終了リストにpush
        })
      )
    },

    //習慣check取り消し
    undoHabit(habit){
      
      const that=this
      const done_habit= {
          user_habit_id: this.userHabit.id,
          done_date:this.$store.state.selectedDate.getTime()/1000
        }
    
      this.setAxiosDefaults();
      return (axios.delete("/api/v1/habits/undo_habit", {
        data: {done_habit: done_habit}
      })
      .then(response => {
        this.isDone=false

        //該当習慣の終了リストから除外
        that.userHabit.done_habits=that.userHabit.done_habits.filter((cur)=>{
          return cur.done_date!=response.data.done_date  //削除したデータの日付と一致しない要素のみで配列をフィルタリング
        })

        })
      )
    },

    //該当習慣が選択日でcheckされているか確認
    checkDone(date){
   
      const done_habits=this.userHabit.done_habits
      const that=this

      if(done_habits.lenght!=0){
        this.isDone=done_habits.some((done)=>{
          let selected_date=that.moment(date)
          return done.done_date==selected_date   //該当習慣の終了日と選択日が同じであればtrueに
        })
      }
    },

     moment(date) {
      return moment(date).format('YYYY-MM-DD');
    }
  },
  computed:{
    selected_date(){
      return this.$store.state.selectedDate
    },
  },
  watch: {
    selected_date(date) {
    this.checkDone(date)
    }
  }
  ,created(){
    const date=this.selected_date;
    this.checkDone(date)
  },

  mixins:[Csrf],
}
</script>

<style scoped lang="scss">
  .habit-list__box__item{
    width:100%;
    height:70px;
    display:flex;
    align-items: center;
    border-bottom:1px solid rgba(0, 0, 0, 0.1);
    &-left{
      margin-right:2%;
      button{
        color:#34acbc;
      }
    }
    &-right{
      height: 100%;
      line-height: 70px;
      width: 100%;
      a{
        color: #404040;
        font-size:1.4rem;
      }
    }
  }
</style>