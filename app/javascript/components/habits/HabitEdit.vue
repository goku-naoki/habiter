<template>
  <HabitForm :habit-user="habitUser" @submit="editHabit" @cancel="cancel">
    <HabitDelete :id="id"/>
  </HabitForm>
</template>

<script>
import axios from 'axios';
import Csrf from '../..//mixins/csrf'
import HabitForm from './HabitForm'
import HabitDelete from './HabitDelete'

export default{
  data(){
    return{
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
          start_date: new Date(val.date).getTime()/1000
        }
      })
      .then(response => {
       
        this.$emit('updated',response.data)
          //  this.$router.push({path: '/'});
         
        })
      )
    },
    cancel(){
      this.$emit('cancel')
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
    HabitForm,
     HabitDelete
  },
   mixins:[Csrf],

 
}
</script>


 