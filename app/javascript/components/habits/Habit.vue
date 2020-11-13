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
      habit_id:0,
      isDone:false
    }
  },
  props:{
    habit:Object
  },
  methods:{
    doneHabit:function(habit,event){
      this.habit_id=habit.id
      event.preventDefault()
      this.setAxiosDefaults();
      return (axios.post("/api/v1/habits/habit_done", {
        habit_done: {
          habit_id: this.habit_id,
          done_date:this.$store.state.selectedDate
        }
      })
      .then(response => {
        this.isDone=true
        this.habit.habit_dones.push(response.data)  //配列の値も更新しないと、chackできやん
        })
      )
    },
    undoHabit(habit,event){
      this.habit_id=habit.id
      const habit_done= {
          habit_id: this.habit_id,
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
        const undo_index=this.habit.habit_dones.indexOf(response.data)
        this.habit.habit_dones.splice(undo_index,1)  //配列の値も更新しないと、chackできやん
        })
      )
    },
    checkDone:function(date){
      const habit_dones=this.habit.habit_dones
      
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
    }
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
  }
</style>