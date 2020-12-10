<template>
  <form class="user-edit"> 
    <div class="user-edit__header">
      <div class="user-edit__header__inner">
        <p @click="cancel">キャンセル</p>
        <input class="user-edit__header__inner-right" @click="checkForm" type="submit" value="更新">
      </div>
    </div>
    <ul v-if="errors.lenght!=0" class="errors">
      <li class="error" v-for="error in errors" :key="error">
        {{error}}
      </li>
    </ul>
    <div class="user-edit__main">
      <div class="user-edit__main__inner">
        <label class="user-edit__photo" @click="editImage" for="image-input">
          <v-icon v-if="photo==null">mdi-account-circle</v-icon>
          <img v-else :src="photo">
         
        </label>
        <input type="file" id="image-input" accept="image/*" ref="file" @change="onFileChange">

        <div class="user-edit__input">
          <input v-if="nickname!=null" v-model="nickname" type="text" placeholder="nickname" >
        </div>
        <div class="user-edit__input">
          <input v-if="email!=null" v-model="email" type="text"   placeholder="email" >
        </div>
      </div>
    </div>
  </form>
</template>

<script>
import axios from 'axios';
import Csrf from '../..//mixins/csrf'

export default{
  data(){
    return{
      errors:[],
      nickname:null,
      email:null,
      photo:null

    }
  },
  props:{
    user:Object,
  },
  methods:{
    cancel(){

    },
    checkForm(event){
      event.preventDefault()
      this.setAxiosDefaults();
      return (axios.put("/users", {
        user: {
          nickname:this.nickname,
          email:this.email
        }
      })
      .then(response => {
        debugger
        })
      )

    },
    editImage(){

    },
    onFileChange(event) {
     this.photo=URL.createObjectURL(event.target.files[0]);
    // let file = event.target.files[0] || event.dataTransfer.files
    // let reader = new FileReader()
    //   reader.onload = () => {
    //       this.uploadedImage = event.target.result
    //       this.photo = this.uploadedImage
    //     }
    //   reader.readAsDataURL(file)
      },
   
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
    //   debugger
    //   this.nickname=val.nickname
    //   this.email=val.email

    // },
   
  },
  created(){
   debugger
      this.nickname=this.user.nickname
      this.email=this.user.email
  },

  mixins:[
    Csrf],

}

</script>

<style scoped lang="scss">
  .user-edit{
    width:50vw;
    height:calc(100vh - 50px - 60px);
    position:fixed;
    top: 60px;
    left: 50%;
    transform:translateX(-50%);
    z-index:100;
    background:#fafafa;
    border-radius: 5px; //なぜか上だけ効かないのでheaderの上に
    &__header{
      width:100%;
      height:50px;
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
    &__main{
      width:100%;
      padding-top:40px;
      text-align:center;
      &__inner{
        width:90%;
        margin:0 auto;
      }
    }
    &__photo{
      display:block;
      height: 100px;
      width: 100px;
      margin: 0 auto;
      margin-bottom:30px;
      img{
        width:100%;
        height:100%;
        object-fit: cover;
        border-radius: 50%;
      }

      i{
        font-size:10rem;
      }
    }
    input[type="file"]{
      display:none
      
    }
    &__input{
      margin-bottom:20px;
      input{
        width:100%;
        height:36px;
        border: 1px solid rgba(0,0,0,0.1);
        border-radius: 5px;
        font-size: 1.2rem;
      }
    }
  }

</style>
