<template>
  <div class="mypage-header">
   efef
  </div>
</template>

<script>
import axios from 'axios';
import Csrf from '../..//mixins/csrf'

export default{
  data(){
    
  },
  props:{
    user:Object,
  },
  methods:{
   
  },
  computed:{
    // getCurrentUser(){
    //   return this.$store.getters.currentUser
    // },
  
  },
  watch:{
    // getCurrentUser(val){
    //   this.currentUser=val
    //   if(this.user.id>0){  //currentUsetと該当ユーザーの２つを得てから、followをcheck
    
    //       this.followedCheck()
    //   }
    // },
    // user(val){
    //   this.isCurrentAndSelectedUser=false
    //   this.user=val
    //   if(this.currentUser.id>0){
    //       this.followedCheck()
    //   }

    // },
   
  },
  created(){
    if(this.getCurrentUser!=null){
      this.currentUser= this.getCurrentUser
    }
  },

  mixins:[
    Csrf],

}

</script>

<style scoped lang="scss">


</style>
