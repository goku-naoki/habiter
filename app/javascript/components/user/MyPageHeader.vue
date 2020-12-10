<template>
  <div class="mypage-header">
    <div class="mypage-header__inner">
      <div class="mypage-header__inner__left">
        <v-icon v-if="user.id!=null && user.photo==null">mdi-account-circle</v-icon>
        <div v-else-if="user.photo"  class="my-page-header__image">
          <img :src="user.photo">
        </div>   
        <p class="mypage-header__inner__left-name">{{user.nickname}}</p>
      </div>

      <template v-if="isUserForm">
        <UserEdit :user="user" @userUpdated="userUpdated" @cancel="cancel"/>
        <div @click="toggleForm"  class="modal-wrapper"></div>
      </template>
      
      <div class="mypage-header__inner__right">
        
        <template v-if="currentUser.id==user.id">
          <div class="mypage-header__inner-current">
            <v-icon  @click="toggleForm"> mdi-account-edit</v-icon>
            <v-icon  @click="logout">mdi-home-export-outline</v-icon>
          </div>
        </template>

        <template v-else>
          <v-icon  v-if="isFollow" @click="unFollow">mdi-account-multiple-minus-outline</v-icon>
          <v-icon  v-else @click="follow">mdi-account-plus</v-icon>
        </template>
        
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Csrf from '../..//mixins/csrf'
import UserEdit from './UserEdit'

export default{
  data(){
  
    return{
      currentUser:{},
      isFollow:false,
      isUserForm:false
    }
  },
  props:{
    user:Object,
  },
  methods:{
    logout(event){
      event.preventDefault()
      this.setAxiosDefaults();
       axios.delete(
        '/users/sign_out'
      )
      .then(response => {
        this.updateCsrfToken(response.data.csrf_token);
        this.$router.push({path: '/user/signin'});
      })
    },
    follow(){ 
      this.setAxiosDefaults();
      axios.post(
        '/api/v1/follows',{user_id:this.user.id}
      )
      .then(response => {
        this.isFollow=true; //ここで条件変えても見た目変わらない？
        this.user.followers=response.data  //userのfollowerを最新に
        this.followedCheck()
        //userの配列にぶち込む
      })
      

    },
    unFollow(){
      
      this.setAxiosDefaults();
      axios.delete(
        `/api/v1/follows/${this.user.id}`,{data:{user_id:this.user.id}}
      )
      .then(response => {
        this.isFollow=false; //ここで条件変えても見た目変わらない？
        this.user.followers=response.data  //userのfollowerを最新に
        this.followedCheck()
        //userの配列にぶち込む
      })

     
    },

    followedCheck(){
      if(this.user.followers.some((cur)=>cur.id==this.currentUser.id)){
        this.isFollow=true
      }else{
        this.isFollow=false
      }
    },
    toggleForm(){
      (!this.isUserForm) ? this.isUserForm=true: this.isUserForm=false
    },
    userUpdated(val){
      this.$emit("userUpdated",val)
      this.toggleForm()
    },
    cancel(){
      this.toggleForm()
    }
  },
  computed:{
    getCurrentUser(){
      return this.$store.getters.currentUser
    },
  
  },
  watch:{
    getCurrentUser(val){
      this.currentUser=val
      if(this.user.id>0){  //currentUsetと該当ユーザーの２つを得てから、followをcheck
    
          this.followedCheck()
      }
    },
    user(val){
    
      this.isCurrentAndSelectedUser=false
      this.user=val
      if(this.currentUser.id>0){
          this.followedCheck()
      }

    },
   
  },
  created(){
      debugger
    if(this.getCurrentUser!=null){
      this.currentUser= this.getCurrentUser
    }
  },

  mixins:[
    Csrf],
  components:{
    UserEdit
  }

  



  

}

</script>

<style scoped lang="scss">
  .mypage-header{
    width:100%;
    height:60px;
    z-index: 0;
    // position: fixed;
    top:0;   //下ボックスの重なり解除
    box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
    &__inner{
      width:95%;
      height:100%;
      margin:0 auto;
      display: flex;
      justify-content: space-between;
      background:white;
      &__left{
        display:flex;
        align-items: center;
        .my-page-header__image{
          width:40px;
          height:40px;
          margin-right: 10px;
          img{
            width:100%;
            height:100%;
            border-radius:50%;

          }
        }
        i{
          position:relative;
          top:2px;
          margin-right:15px;
          font-size:30px;
        }
        &-name{
          font-size:2rem;
        }
       
      }
      &__right{
        display: flex;
        align-items: center;
        .mypage-header__inner-current{
          display:block;
          button{
          font-size:30px;
          &:first-child{
            margin-right:10px;
            }
          }
        }     
      }
    }
  }

  .modal-wrapper{
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          z-index:1;
          background:rgba(0,0,0,0.6)
      }

</style>
