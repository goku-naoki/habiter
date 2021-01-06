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
    //全習慣をサーバーから取得する
    axios
      .get('/api/v1/habits')
      .then(response => {
        this.allHabits=response.data  //ユーザーに属する全ての習慣
        this.habits = this.checkHabits(this.allHabits,this.$store.state.selectedDate)  //該当ページの日付に対応した習慣
      })
  },
  
  methods:{
    //該当ページの日付以前に開始している習慣を抽出
    checkHabits(habits,date){
      let result=habits.filter((cur)=>{
       return new Date(cur.start_date)<=date  //習慣の開始日と該当ページの日付を比較
      })
     return result
    },
    //新たな習慣追加された際のemit
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
    //該当ページの日付が変更されたら、checkHabitsを起こす
    selected_date(date){
     this.habits=this.checkHabits(this.allHabits,date)
    },
    //新たな習慣が追加されたら、、checkHabitsを起こす
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
