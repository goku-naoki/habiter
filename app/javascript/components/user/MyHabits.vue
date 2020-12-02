<template>
  <div class="my-habits">
    <div class="my-habits__inner">
      <div class="my-habits__inner-titles">
        <p class="my-habits__inner-title" @click="touchHabit()">
          Habits
        </p>
        <p class="my-habits__inner-title" @click="touchFollow()">
          Following
        </p>
      </div>
      
      <template v-if="isHabitActive">
        <!-- 2つ条件入れて置かないと、habit_user取れていないときにエラー -->
        <p v-if="!user.habit_users ||user.habit_users.length==0" class="my-habits__inner-no">習慣が登録されていません</p>
        <ul v-else class="my-habits__inner__list">
          <MyHabit :habit-user="habitUser" v-for="habitUser in user.habit_users" :key="habitUser.id"/>
        </ul>
      </template>

      <template v-else>
        <p v-if="!user.habit_users ||user.following==0" class="my-habits__inner-no">no following</p>
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
       isFollowActive:false
     }
   },
   props:{
    user:{
      habit_users:Array
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
      this.user=val
    }
  },
  created(){
    debugger
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
          font-size:1.8rem;
          &:first-child{
            margin-right:30px;
          }
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
