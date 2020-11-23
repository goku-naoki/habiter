<template>
  <div class="habit-delete" @click="destroy">
    削除する
  </div>
</template>

<script>
import axios from 'axios';
import Csrf from '../..//mixins/csrf'
export default{
  props:{
    id:Number
  },
  methods:{
    destroy(){
      this.setAxiosDefaults();
      return (axios.delete(`/api/v1/habits/${this.id}`)
      .then(response => {
          this.$router.push({path: '/'});
        })
      )
    }
  },
  mixins:[Csrf],
 
}
</script>

<style scoped lang="scss">
  .habit-delete{
    width:50%;
    height:50px;
    margin:0 auto;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.4rem;
    color:white;
    background: tomato;
    border-bottom: 1px solid #fafafa;
    border-radius: 5px;
  }
</style>