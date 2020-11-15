<template>
  <div @click="hoge">
    dddd
  </div>
</template>

<script>
import axios from 'axios';
// import moment from 'moment';
// import Csrf from '../..//mixins/csrf'
export default{
  data(){
    console.log('hoge')
    return{
      habitUser:{}
    }
  },
  props:{
      id:Number
    },
  created(){
    axios
      .get(`/api/v1/habits/${this.id}`)
      .then(response => {
        this.habitUser=response.data
      })
  }
}

</script>

<style scoped lang="scss">

</style>