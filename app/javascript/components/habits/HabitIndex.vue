<template>
  <div class='habit-index'>
    <IndexHeader @added="added"/>
    <HabitList v-if="habits!=null" :habits="habits" />
    <Footer></Footer>
  </div>
</template>

<script>
import axios from 'axios';
import IndexHeader from './IndexHeader'
import HabitList from './HabitList'
import Footer from '../global/Footer' 

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
  
  methods:{
    checkHabits(habits,date){
      let result=habits.filter((cur)=>{
       return new Date(cur.start_date)<=date
      })
     return result
    },
    added(response){
      this.allHabits.push(response)
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
    },
    allHabits(val){
      this.habits=this.checkHabits(this.allHabits,this.selected_date)
    }
  },
  components:{
    IndexHeader,
    HabitList,
    Footer
  
  },
  
}
</script>
