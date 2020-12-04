<template>
  <div class="detail-header">
    <div class="detail-header__inner">
      <div class="detail-header__inner-left">
        <router-link to="/">
          <v-icon>mdi-arrow-left-bold</v-icon>
        </router-link>
        <p class="detail-header__inner-left__name">
          {{name}}
        </p>
      </div>
      <div class="detail-header__inner-right">
        <template v-if="currentUser.id== userHabit.user_id">
          <v-icon @click="toggleModal()">mdi-dots-horizontal-circle</v-icon>
          <div class="detail-header__modal" v-if="isModalTouched">
            <ul class="detail-header__modal__list">
              <li class="detail-header__modal__list__item" @click="toggleForm" >
                  <p class="detail-header__modal__list__item-left">
                    編集
                  </p>
                  <div class="detail-header__modal__list__item-right">
                    <v-icon> mdi-grease-pencil</v-icon>
                  </div>
              </li>
            </ul>
          </div>
          <div @click="toggleModal()" v-if="isModalTouched" class="modal-wrapper"></div>
        </template>
      </div>
    </div>

    <HabitEdit :id="userHabit.id" v-if="isFormTouched" @cancel="toggleForm" @updated="updated"/>
    <div @click="toggleForm" v-if="isFormTouched" class="modal-edit-wrapper"></div>
  </div>
</template>

<script>
import axios from 'axios';
import HabitEdit from '../habits/HabitEdit'


export default{
  data(){
    return{
      name:"",
      isModalTouched:false,
      isFormTouched:false,
      currentUser:{}
      
    }
  },
  props:{
      userHabit:Object
    },
  methods:{
    toggleModal(){
      if(!this.isModalTouched){
        this.isModalTouched=true
      }else{
        this.isModalTouched=false
      }
    },
    toggleForm(){
      if(!this.isFormTouched){
        this. toggleModal()
        this.isFormTouched=true
        document.getElementsByClassName("vc-container")[0].setAttribute("style","z-index: -1;")  //強引にz-index調整
      }else{
        this.isFormTouched=false
         document.getElementsByClassName("vc-container")[0].removeAttribute("style","z-index: -1;")
      }
    },
    updated(response){
      this.toggleForm()
      this.$emit('updated',response)
    }
  },
  computed:{
    habitName(){
      return this.habit.name
    },
    getCurrentUser(){
      return this.$store.getters.currentUser
    }
  },
  watch:{
   userHabit(val){
     debugger
      this.name=val.habit.name  //propsの取得に時間がかかる？？？？
    },
    getCurrentUser(val){
      
      this.currentUser=val
    }
  },
  created(){
    if(this.getCurrentUser!=null){
      this.currentUser= this.getCurrentUser
    }
  },
  components : {
    HabitEdit,
   
    
  }
  
}

</script>

<style scoped lang="scss">
  .detail-header{
    width:100%;
    height:60px;
    z-index: 0;
    position: fixed;
    top:0; 
    box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
    &__inner{
      width:95%;
      height:100%;
      margin:0 auto;
      display: flex;
      justify-content: space-between;
      background:white;
      &-left{
        display:flex;
        align-items: center;
        a{
          margin-right:15px;
          i{
            color:#34acbc;
          }
        }
        &__name{
          font-size:2rem;
        }
      }
      &-right{
        display:flex;
        align-items: center;
        position:relative;
        button{
          color:#34acbc;
        }
        .detail-header__modal{
          width:200px;
          position:absolute;
          right:0;
          top:50px;
          z-index:2;
          background:white;
          box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
          border-radius:5px;
          &__list{
            width:90%;
            margin:0 auto;
            &__item{
              height:36px;
              height:100%;
              display: flex;
              justify-content: space-between;
              align-items: center;
              color:#404040;
               &:not(:last-child){
                border-bottom:rgba(0, 0, 0, 0.1) solid 1px;
                }
              // a{
                // height:100%;
                // display: flex;
                // justify-content: space-between;
                // align-items: center;
                // color:#404040;
                .detail-header__modal__list__item-left{
                  font-size:1.2rem;
                }
                i{
                  color:#404040;
                }

              // }
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
        }
      }
    }
    .modal-edit-wrapper{
      position:fixed;
      top:0;
      left:0;
      width:100%;
      height:100%;
      z-index:1;
      background:rgba(0,0,0,0.6)
    }
  }

</style>
