<template>
  <form class="habit-add">
    <div class="habit-add__header">
      <div class="habit-add__header__inner">
        <p @click="cancel">キャンセル</p>
        <input class="habit-add__header__inner-right" @click="submit" type="submit" value="保存">
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
            <Datepicker  id="day" v-model="date"></Datepicker>
            <label v-show="date==0" for="day"><span>日付</span></label>
          </div>
        </div>
      </div>
    </div>
  </form>
</template>

<script>
import Datepicker from 'vuejs-datepicker';


export default{
  data(){
    return{
      name:"",
      date:0,
   
    }
  },
  props:{
    habitUser:{
      habit:{
        name:String,
      },
      start_date:Date
    }
  },
  methods:{
    submit:function(event){
      const habit={name:this.name,date:this.date}
      this.$emit('submit',habit)
    },
    cancel(){
      this.$emit('cancel')
    }
  },
  watch:{
    habitUser(){
     this.name=this.habitUser.habit.name
     this.date=this.habitUser.start_date
    }
  },
  // mixins:[Csrf],
  components : {
    Datepicker
  }

 
}
</script>


<style scoped lang="scss">
  .habit-add{
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
          font-size:1.6rem;
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