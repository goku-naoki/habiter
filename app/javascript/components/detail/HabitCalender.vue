<template>
  <div>
   <v-calendar
  :columns="$screens({ lg: 1 }, 1)"
  :from-date="new Date()"
  :attributes="attributes"
  />
  </div>
</template>

<script>
export default {
  name: 'calendar',
  data() {
   
    return {
      attributes: [
        // {
        //   dot: 'red',
        //   dates: [
            
        //   ],
      ],
    };
  },
  props:{
    habitUser:Object
  },
  methods: {
    getDates(arr){
     let hash={dot:"red",dates:[]}
       const dotDate=arr.map((cur)=>{
         const dateArr=cur.done_date.split('-')
         return  hash.dates.push(new Date(Number(dateArr[0]),Number(dateArr[1])-1,Number(dateArr[2])))
       })
       return hash
    }
  },
  
  watch:{
    habitUser(val){   
      //data配列に対して、pushしないと変更検知されない
      this.attributes.push(this.getDates(val.habit_dones))
    }
  },
  created(){
    
     
  }
  
}
</script>

<style scoped>
.cell-content {
  text-align:left;
  width: 70px;
  height: 50px;
  font-size: 50%;
  /* border: 1px solid #efefef; */
}
.cell-content-line {
  border-bottom: 1px solid #efefef;
}
</style>