<template>
  <li class="habit-list__box__item">
    <div class="habit-list__box__item-left">
      <v-icon v-if=" isDone" @click="undoHabit(userHabit, $event)">mdi-checkbox-marked-circle</v-icon>
      <v-icon v-else @click="doneHabit(userHabit,$event)"> mdi-checkbox-blank-circle-outline</v-icon>
    </div>
    <div class="habit-list__box__item-right">
      <router-link :to="{ name: 'HabitDetail', params: { id: userHabitr.id } } ">
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
      done_date:this.selected_date,
      isDone:false,
      // habitUser:{
     

      // }
    }
  },
  props:{
    userHabit:Object
  },
  methods:{
    doneHabit:function(habit,event){
    
      event.preventDefault()
      this.setAxiosDefaults();
     
      return (axios.post("/api/v1/habits/done_habit", {
        done_habit: {
          habit_user_id: this.userHabit.id,
          done_date:this.$store.state.selectedDate.getTime()/1000
        }
      })
      .then(response => {
        this.isDone=true
        this.userHabit.done_habits.push(response.data) //配列の値も更新しないと、chackできやん
        })
      )
    },
    undoHabit(habit,event){
      
      const that=this
      const done_habit= {
          habit_user_id: this.userHabit.id,
          done_date:this.$store.state.selectedDate.getTime()/1000
        }
      event.preventDefault()
      this.setAxiosDefaults();
      return (axios.delete("/api/v1/habits/undo_habit", {
        data: {done_habit: done_habit}
      })
      .then(response => {
        this.isDone=false

        that.userHabit.done_habits=that.userHabit.done_habits.filter((cur)=>{
          cur.done_date!=response.data.done_date
        })
        })
      )
    },
    checkDone:function(date){
   
      const done_habits=this.userHabit.done_habits
      const that=this
      if(done_habits.lenght!=0){
        this.isDone=done_habits.some((done)=>{
          let selected_date=that.moment(date)
          return done.done_date==selected_date
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
    // get_habit_user(){
    //     const habitUser=this.habit.habit_users.find(cur=>cur.user_id==this.current_user.id)
    //     this.habitUser=habitUser
    // }
  },
  watch: {
    selected_date(date) {
    this.checkDone(date)
    }
  }
  ,created(){
    const date=this.selected_date;
    // this.get_habit_user
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