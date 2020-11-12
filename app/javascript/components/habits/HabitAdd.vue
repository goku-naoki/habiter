<template>
  <form class="habit-add">
    <div class="habit-add__header">
      <div class="habit-add__header__inner">
        <router-link to="/">
            キャンセル
        </router-link>
        <input class="habit-add__header__inner-right" @click="addHabit" type="submit" value="保存">
      </div>
    </div>
    <div class="habit-add__form">
      <div class="habit-add__form__name">
        <input type="text" v-model="name"  placeholder="習慣の名前" >
      </div>
      <div class="habit-add__form__detail">
        <div class="habit-add__form__detail__item">
          <div class="habit-add__form__detail__item-left">
            <v-icon>mdi-calendar-range</v-icon>
            <p>開始日</p>
          </div>
          <div class="habit-add__form__detail__item-right">
            <!-- <input type="text"  value="2020/11/1" > -->
           
            <Datepicker  id="day" v-model="date"  ></Datepicker>
            <label v-show="date==0" for="day"><span>日付</span></label>
            
          </div>
        </div>
      </div>
    </div>
  </form>
</template>

<script>
import axios from 'axios';
import Datepicker from 'vuejs-datepicker';


export default{
  data(){
    return{
      name:"",
      date:0,
      errors:[],
    }
  },
  methods:{
     getCsrfToken: function(){
      if (!(axios.defaults.headers.common['X-CSRF-Token'])) {
        return (
          document.getElementsByName('csrf-token')[0].getAttribute('content')
        )
        } 
      else {
        return (  
          axios.defaults.headers.common['X-CSRF-Token']
        )
      }
    },
    setAxiosDefaults: function(){
      axios.defaults.headers.common['X-CSRF-Token'] = this.getCsrfToken();
      axios.defaults.headers.common['Accept'] = 'application/json';
      console.log(axios.defaults.headers.common['X-CSRF-Token']);
    },
    addHabit:function(event){
      event.preventDefault()
      this.setAxiosDefaults();
      return (axios.post('/api/v1/habits', {
        habit: {
          name: this.name,
          start_date: this.date
        }
      })
      .then(response => {
          debugger

           this.$router.push({path: '/'});
          // return (response)
        })
      )
    }
  },
  components : {
    Datepicker
  }

 
}
</script>


<style scoped lang="scss">
  .habit-add{
    background:#fafafa;
    &__header{
      width:100%;
      height:50px;
      margin-bottom:20px;
      background:white;
      color:#34acbc;
      &__inner{
        width:95%;
        height:100%;
        margin:0 auto;
        margin-bottom:20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        a{
          color:#34acbc;
        }
      }
    }
    &__form{
      &__name{
        width: 100%;
        height:60px;
        margin-bottom:20px;
        text-align:center;
        line-height:60px;
        background:white;
        input{
          height:40px;
          width:95%;
          margin:0 auto;
          padding:10px 0;
        }
      }
      &__detail{
        width:100%;
        background:white;
        &__item{
          width:95%;
          height:50px;
          margin:0 auto;
          display:flex;
          justify-content:space-between;
          align-items: center;
          border-bottom:1px solid #fafafa;
          &-left{
            display: flex;
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

<style lang="scss">
.habit-add{
  .vdp-datepicker input{
    width:110px;
    color: #404040;
    outline: none;
  }
  .vdp-datepicker__calendar{
    left:-200px;
    top:38px;
  }
}
</style>