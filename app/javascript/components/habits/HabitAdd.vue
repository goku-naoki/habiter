<template>
  <HabitForm :user-habit="userHabit" @submit="addHabit" @cancel="cancel">
   
  </HabitForm>
</template>

<script>
import axios from 'axios';
import Csrf from '../..//mixins/csrf'
import HabitForm from './HabitForm'

export default{
  data(){
    return{
     userHabit:{}
    }
  },
  methods:{
    addHabit(val){
    
      this.setAxiosDefaults();
      return (axios.post('/api/v1/habits', {
        habit: {
          name: val.name,
          start_date: val.date.getTime()/1000
        }
      })
      .then(response => {
        this.$emit('added',response.data)
        })
      )
    },
    cancel(){
      this.$emit('cancel')
    }
  },
  
  mixins:[Csrf],
  
  components:{
    HabitForm
  }

 
}
</script>


 