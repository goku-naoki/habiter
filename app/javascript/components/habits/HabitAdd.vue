<template>
  <HabitForm :habit-user="habitUser" @submit="addHabit">
    <router-link to="/">キャンセル</router-link>
  </HabitForm>
</template>

<script>
import axios from 'axios';
import Csrf from '../..//mixins/csrf'
import HabitForm from './HabitForm'

export default{
  data(){
    return{
      habitUser:{}
    }
  },
  methods:{
    addHabit:function(val){
    
      this.setAxiosDefaults();
      return (axios.post('/api/v1/habits', {
        habit: {
          name: val.name,
          start_date: val.date.getTime()/1000
        }
      })
      .then(response => {

           this.$router.push({path: '/'});
         
        })
      )
    }
  },
  mixins:[Csrf],
  
  components:{
    HabitForm
  }

 
}
</script>


 