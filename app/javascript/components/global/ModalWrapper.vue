<template>
  <div @click="clickModal" class="modal-wrapper"></div>
</template>

<script>

export default{
  data(){
    return{
      keyword:""
    }
    
  },
  methods:{
    clickModal(){
      this.$emit("clickModal")
    }    
  }
 
 
}
</script>

<style scoped lang="scss">
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