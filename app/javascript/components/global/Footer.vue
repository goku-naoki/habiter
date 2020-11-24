<template>
  <div class="footer">
    <ul class="footer__list">
      <li class="footer__list__item"> 
         <router-link to="/">
          <v-icon>mdi-calendar-check-outline</v-icon>
          <p class="footer__list__item-title">Journal</p>
        </router-link>
      </li>
      <li class="footer__list__item"> 
        <router-link :to="{ name: 'MyPage', params: { id: currentUser.id } } ">
          <v-icon>mdi-account</v-icon>
          <p class="footer__list__item-title">MyPage</p>
        </router-link>
      </li>
      <li class="footer__list__item"> 
         <router-link to="/">
          <v-icon>mdi-arrow-left-bold</v-icon>
          <p class="footer__list__item-title">Search</p>
        </router-link>
      </li>
    </ul>
  </div>
</template>

<script>




export default{
  data(){
    return{
      // currentUserId:-1
    }
  },
  computed:{
    currentUser(){
      return this.$store.getters.currentUser
    }
  },
  
  created(){
    this.$store.watch(
      (state,getters)=>getters.currentUser,
      (val)=>{
        this.currentUser=val
      }
    )
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
     
    }
  }


</style>