<template>
  <div class="habit-list">
    <ul class="habit-list__box">
      <li class="habit-list__box__item" v-for="habit in habits" :key="habit.id">
        <div class="habit-list__box__item-left">
          <v-icon @click="doneHabit(habit.id, $event)">mdi-checkbox-blank-circle-outline</v-icon>
        </div>
        <div class="habit-list__box__item-rigth">
          <p>{{habit.name}}</p>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';


export default{

  data(){
    return{
      done_date:this.selected_date,
      habit_id:0
    }
  },
  props:{
    habits:Array
  },
  methods:{
     getCsrfToken: function(){
      if (!(axios.defaults.headers.common['X-CSRF-Token'])) {
        return (
          document.getElementsByName('csrf-token')[0].getAttribute('content')
        )
        } 
      else {
        return (  
          axios.defaults.headers.common['X-CSRF-Token']
        )
      }
    },
    setAxiosDefaults: function(){
      axios.defaults.headers.common['X-CSRF-Token'] = this.getCsrfToken();
      axios.defaults.headers.common['Accept'] = 'application/json';
      console.log(axios.defaults.headers.common['X-CSRF-Token']);
    },
    doneHabit:function(id,event){
      console.log(this.done_date)
      this.habit_id=id
      event.preventDefault()
      this.setAxiosDefaults();
      return (axios.post("/api/v1/habits/habit_done", {
        habit_done: {
          habit_id: this.habit_id,
          done_date:this.$store.state.selectedDate
        }
      })
      .then(response => {
          debugger

           this.$router.push({path: '/'});
          // return (response)
        })
      )
    }
  },
  computed:{
    selected_date(){
      this.$store.state.selectedDate
    }
  }

 
}
</script>


<style scoped lang="scss">
  .habit-list{
    width:100%;
    &__box{
      width:95%;
      margin:0 auto;
      background: white;
      &__item{
        width:100%;
        height:70px;
        display:flex;
        align-items: center;
        border-bottom:1px solid rgba(0, 0, 0, 0.1);
        &-left{
          margin-right:2%;
          i{
            color:#34acbc;
          }
        }
      }
    }
  }
</style>