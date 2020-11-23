<template>
  <div class="calender">
   <v-calendar
  :columns="$screens({ lg: 1 }, 1)"
  :masks="{ title: 'YYYY年M月' }"
  :from-date="new Date()"
  :attributes="attributes"
  :is-expanded="layout.isExpanded"
  />
  </div>
</template>

<script>
export default {
  name: 'calendar',
  data() {
   
    return {
      attributes: [
      {
        highlight: {
          color: 'gray',
          fillMode: 'light',
        },
        dates: new Date(),
      },
      // {
      //   dot: 'red',
      //   dates: []
      //   }
      ],
      
        
    };
  },
  props:{
    habitUser:Object
  },
  methods: {
    getDates(arr){
    //  let hash={dot:"teal",dates:[],}
       const dotDate=arr.map((cur)=>{
         const dateArr=cur.done_date.split('-')
         return  new Date(Number(dateArr[0]),Number(dateArr[1])-1,Number(dateArr[2]))
       })
       return dotDate
    }
  },
  computed:{
    layout() {
      return this.$screens(
        {
          // Default layout for mobile
          default: {
            columns: 1,
            rows: 1,
            isExpanded: true,
          },
          // Override for large screens
          lg: {
            columns: 2,
            rows: 2,
            isExpanded: true,
          },
        },
      );
    }
  },
  watch:{
    habitUser(val){   
      if(this.attributes.length==1){  //分岐させないと、habitUser更新されてた際にドットが重複
        const dates=this.getDates(val.habit_dones)
        this.attributes.push({dot:"teal",dates:dates})
      }
    }
  },
  created(){
    
     
  }
  
}
</script>

<style scoped>
  .calender{
    width:95%;
   
    margin:0 auto;
  }

  .vc-container{
    margin:0 auto;
    --day-content-height : 60px;
    --day-content-bg-color-hover: rgba(204,214,224,0); 
    --day-content-dark-bg-color-hover: rgba(114,129,151,0); 
    --day-content-bg-color-focus: rgba(204,214,224,0);
    --day-content-dark-bg-color-focus: rgba(114,129,151,0);
    z-index: -1;
    position: relative;
  }
  .vc-cursor-pointer{
    cursor:auto;
  }
</style>