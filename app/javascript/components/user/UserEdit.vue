<template>
  <div class="user-edit"> 
    <div class="user-edit__header">
      <div class="user-edit__header__inner">
        
      </div>
    </div>
  
  </div>
</template>

<script>
import axios from 'axios';
import Csrf from '../..//mixins/csrf'

export default{
  data(){
    return{

    }
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
  // created(){
  //   if(this.getCurrentUser!=null){
  //     this.currentUser= this.getCurrentUser
  //   }
  // },

  mixins:[
    Csrf],

}

</script>

<style scoped lang="scss">
  .user-edit{
    width:50vw;
    height:50vh;
    position:fixed;
    top: 40%;
    left: 50%;
    transform: translateY(-50%) translateX(-50%);
    z-index:100;
    background:#fafafa;
    border-radius: 5px; //なぜか上だけ効かないのでheaderの上に
    &__header{
      width:100%;
      height:50px;
      margin-bottom:20px;
      font-size:1.4rem;
      background:white;
      color:#34acbc;
      box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
      border-radius: 5px 5px 0 0;
      &__inner{
        width:95%;
        height:100%;
        margin:0 auto;
        margin-bottom:20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        p{
          color:#34acbc;
        }
      }
    }
    &__form{
      &__name{
        width: 100%;
        // height:60px;
        margin-bottom:20px;
        text-align:center;
        line-height:60px;
        background:white;
        input{
          height:40px;
          width:95%;
          margin:0 auto;
          padding:10px 0;
          font-size:1.6rem;
        }
      }
      &__detail{
        width:100%;
        background:white;
        margin-bottom:40px;
        &__item{
          width:95%;
          height:50px;
          margin:0 auto;
          display:flex;
          justify-content:space-between;
          align-items: center;
          font-size: 1.4rem;
          border-bottom:1px solid #fafafa;
          &-left{
            display: flex;
            align-items: center;
            i{
              margin-right:15px;
            }
          }
          &-right{
            width:110px;
            position: relative;
            span{
              position: absolute;
              top:0;
              right:0;
              opacity:0.6;
            }
          }
        }
      }
    }
  }

</style>
