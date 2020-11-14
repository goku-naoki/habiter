<template>
  <li class="habit-list__box__item">
    <div class="habit-list__box__item-left">
      <v-icon v-if=" isDone" @click="undoHabit(habit, $event)">mdi-checkbox-marked-circle</v-icon>
      <v-icon v-else @click="doneHabit(habit,$event)"> mdi-checkbox-blank-circle-outline</v-icon>
    </div>
    <div class="habit-list__box__item-rigth">
      <p>{{habit.name}}</p>
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
      done_date:this.selected_date,
      isDone:false,
      habitUser:{}
    }
  },
  props:{
    habit:Object
  },
  methods:{
    doneHabit:function(habit,event){
   
      event.preventDefault()
      this.setAxiosDefaults();
      return (axios.post("/api/v1/habits/habit_done", {
        habit_done: {
          habit_user_id: this.habitUser.id,
          done_date:this.$store.state.selectedDate
        }
      })
      .then(response => {
        this.isDone=true
        this.habitUser.habit_dones.push(response.data) //配列の値も更新しないと、chackできやん
        })
      )
    },
    undoHabit(habit,event){
      
      
      const habit_done= {
          habit_user_id: this.habitUser.id,
          done_date:this.$store.state.selectedDate
        }
      event.preventDefault()
      this.setAxiosDefaults();
      return (axios.delete("/api/v1/habits/habit_undo", {
        data: {habit_done: habit_done}
      })
      .then(response => {
        this.isDone=false
        // let result=this.habit.habit_dones.filter(cur=> cur!=response.data)
        // this.habit.habit_dones=result
        const undo_index=this.habitUser.habit_dones.indexOf(response.data)
        this.habitUser.habit_dones.splice(undo_index,1)  //配列の値も更新しないと、chackできやん
        })
      )
    },
    checkDone:function(date){
     
      const habit_dones=this.habitUser.habit_dones
      
      if(habit_dones.lenght!=0){
        habit_dones.forEach((done)=>{
        const selected_date=this.moment(date)
          if(done.done_date==selected_date){
            this.isDone=true
          }else{
            this.isDone=false
          }
        })
      }
    },
     moment: function (date) {
      return moment(date).format('YYYY-MM-DD');
    }
  },
  computed:{
    selected_date(){
      return this.$store.state.selectedDate
    },
    current_user(){
      return this.$store.state.currentUser
    },
    get_habit_user(){
         const habitUser=this.habit.habit_users.find(cur=>cur.user_id==this.current_user.user.id)//仮置き！！！！！！！１
         this.habitUser=habitUser
    }
  },
  watch: {
    selected_date(date) {
    this.checkDone(date)
    }
  }
  ,created(){
    const date=this.selected_date;
    this.get_habit_user
    debugger
    // this.checkDone(date)
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
    }
  }
</style>