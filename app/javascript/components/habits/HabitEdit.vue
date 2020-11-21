<template>
  <HabitForm :habitUser="habitUser" @submit="editHabit"/>
</template>

<script>
import axios from 'axios';
import Csrf from '../..//mixins/csrf'
import HabitForm from './HabitForm'

export default{
  data(){
    return{
      habit:{},
      habitUser:{}
    }
  },
  props:{
      id:Number
    },
  methods:{
    editHabit:function(val){
      this.setAxiosDefaults();
      return (axios.patch(`/api/v1/habits/${this.id}`, {
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
  created(){
     axios
      .get(`/api/v1/habits/${this.id}`)
      .then(response => {
        this.habitUser=response.data
      })
  },

  components:{
    HabitForm
  },
   mixins:[Csrf],

 
}
</script>


 