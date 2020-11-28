<template>
  <div class="footer">
    <ul class="footer__list">
      <li class="footer__list__item"> 
         <router-link to="/">
          <v-icon>mdi-calendar-check-outline</v-icon>
          <p class="footer__list__item-title">Journal</p>
        </router-link>
      </li>
      <li class="footer__list__item" > 
        <router-link :to="{ name: 'MyPage', params: { id: currentUser.id } } " >
          <v-icon>mdi-account</v-icon>
          <p class="footer__list__item-title">MyPage</p>
        </router-link>
      </li>
      <li @click="toggleForm" class="footer__list__item search"> 
          <v-icon>mdi-arrow-left-bold</v-icon>
          <p class="footer__list__item-title">Search</p>
      </li>
      <template v-if="isFormTouched">
        <div class="search-box">
          <Search @getResult="showResult" @cancelSearch="cancelSearch"></Search>
        </div>
        <div id="search-result" v-if="isFormResult" @click="toggleForm">
          <SearchResult :users="users" ></SearchResult>
        </div>
        <div @click="toggleForm"  class="modal-wrapper"></div>
      </template>
    </ul>
  </div>
</template>

<script>


import Search from './Search.vue'
import SearchResult from './SearchResult.vue'



export default{
  data(){
    return{
      currentUser:{},
      isFormResult:false,
      isFormTouched:false,
      users:[]
     }
  },
  methods:{
    toggleForm(){
      if(!this.isFormTouched){
        this.isFormTouched=true
      }else{
        this.isFormTouched=false
        this.isFormResult=false
        this.users=[]
      }
    },
    showResult(val){
      this.isFormResult=true
      this.users=val
    },
    cancelSearch(){
      this.isFormResult=false
      this.users=[]
    }
  },
  
  beforeUpdate(){
    //検索結果に応じて結果表示のposi変更
    const resultDom=document.getElementById('search-result')
      if(this.isFormResult && resultDom!=null){
      
        let length=30
        if(this.users.length!=0){
          length=this.users.length*30 
        }
        resultDom.setAttribute(`style`,`top:-${length+4}px`)
      }
  },
  
  computed:{
     getCurrentUser(){
      return this.$store.getters.currentUser
    }
  },
  watch:{
    getCurrentUser(val){
      this.currentUser=this.getCurrentUser

    }
  },
  
  created(){
    //appのcreatedがわがまま！！！ user getする事もあるが、しない時も！！！ した際はここ、ない際はwatch
    if(this.getCurrentUser!=null){
      this.currentUser= this.getCurrentUser
    }
  },
 
  components:{
    Search,
    SearchResult
  }
}

</script>

<style scoped lang="scss">
  .footer{
    position:fixed;
    bottom:0;
    width:100vw;
    height:50px;
    border-top:1px solid rgba(0,0,0,0.1);
    &__list{
      width:95%;
      height:100%;
      margin:0 auto;
      display:flex;
      justify-content:space-between;
      align-items:center;
      position: relative;;
      &__item{
        a{
          display:flex;
          width:100%;
          height:100%;
          align-items:center;
          color:#404040;
          i{
            margin-right:5px;
          }
        }
      }
      .search{
        display:flex;
        height:100%;
        align-items:center;
        color:#404040;
        i{
          margin-right:5px;
        }
      }
      .search-box{
        position:absolute;
        right:100px;
        z-index: 2;
      }
      .modal-wrapper{
        position:fixed;
        top:0;
        left:0;
        width:100%;
        height:100%;
        z-index:1;
      }
      #search-result{
        width:200px;
        position: absolute;
        right: 70px;
        top:-34px; //該当なかったようにdefault
        z-index: 2;
        background:white;
        border:1px solid rgba(0,0,0,0.1);
        border-radius:10px;
       
      }
     
    }
  }


</style>