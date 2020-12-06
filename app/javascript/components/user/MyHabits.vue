<template>
  <div class="my-habits">
    <div class="my-habits__inner">
      <div class="my-habits__inner-titles">
        <p class="my-habits__inner-title" @click="touchHabit()" :class="{active: isHabitActive}">
          Habits
        </p>
        <p class="my-habits__inner-title" @click="touchFollow()" :class="{active: !isHabitActive}">
          Following
        </p>
      </div>
      
      <template v-if="isHabitActive">   <!-- 2つ条件入れて置かないと、habit_user取れていないときにエラー -->
        <p v-if="!user.user_habits||user.user_habits.length==0" class="my-habits__inner-no">習慣が登録されていません</p>
        <ul v-else class="my-habits__inner__list">
          <MyHabit :habit-user="userHabit" v-for="userHabit in user.user_habits" :key="userHabit.id"/>
        </ul>
      </template>

      <template v-else>
        <p v-if="!user.user_habits ||user.following==0" class="my-habits__inner-no">フォローしているユーザーはいません</p>
        <ul v-else class="my-habits__inner__list">
          <MyFollowed :followed="followed" v-for="followed in user.following" :key="followed.id"/>
        </ul>
      </template>
      
    </div>
  </div>
</template>


<script>
import axios from 'axios';
import MyHabit from './MyHabit'
import MyFollowed from './MyFollowed'

export default{
  
   data(){
     return{
       isHabitActive:true,
     }
   },
   props:{
    user:{
      user_habits:Array
    }
  },
  methods:{
    touchHabit(){
     this.isHabitActive==false ? this.isHabitActive=true  :{}
    },
    touchFollow(){
     this.isHabitActive==true ? this.isHabitActive=false  :{}
    }
  },
  
  watch:{
    user(val){
      this.user=val;
      this.isHabitActive==false? this.isHabitActive=true :{}  //他ページに移る際にreset
    }
  },
  created(){
  },

components:{
  MyHabit,
  MyFollowed

}

  

}

</script>

<style scoped lang="scss">
  .my-habits{
    width:100%;
    height:100vh;
    padding-top:60px;
    margin-bottom: 50px;
    overflow: scroll;
    &__inner{
      width:95%;
      height: 100%;;
      margin:0 auto;
     
      padding-top:40px;
      &-titles{
        margin-bottom:20px;
        display:flex;
        p{
          border: 1px rgba(0,0,0,0.1)solid;
          padding: 5px 10px;
          border-radius: 5px;
          font-size:1.8rem;
          cursor:pointer !important;
          &:first-child{
            margin-right:30px;
          }
        }
        .active{
          box-shadow: 0 0 8px grey;
        }
      }
      &__list{
        display: flex;
        flex-wrap:wrap;
      }
      &-no{
        margin-top:50px;
        font-size:1.4rem;
      }
    }
  }

</style>
