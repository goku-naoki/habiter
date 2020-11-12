<template>
  <div class='habit-index'>
    <IndexHeader/>
    <HabitList v-if="habits!=null" :habits="habits" />
  </div>
</template>

<script>
import axios from 'axios';
import IndexHeader from './IndexHeader'
import HabitList from './HabitList'

export default{

  data(){
    return{
      allHabits:[],
      habits:[]
    }
  },
  created(){

    axios
      .get('/api/v1/habits')
      .then(response => {
        this.allHabits=response.data
        this.habits = this.checkHabits(this.allHabits,this.$store.state.selectedDate)
        console.log(this.habits)
      })
  },
  components:{
    IndexHeader,
    HabitList,
  
  },
  methods:{
    checkHabits(habits,date){
      let result=habits.filter((cur)=>{
       return new Date(cur.habit_users[0].start_date)<=date
      })
     return result
    }
  },
  computed:{
    selected_date(){
      return this.$store.state.selectedDate
    }
  },
  watch: {
    selected_date(date){
     this.habits=this.checkHabits(this.allHabits,date)
     console.log(this.habits)
    }
  }
 
  
  // created(){
  //   console.log(this.habits)
  //   this.checkHabits()
  // }
  
 
}
</script>
