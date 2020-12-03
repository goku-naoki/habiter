import axios from 'axios';
export default {
  data(){
    return{
      errors:[]
    }
  },
  methods:{
    logIn:function(event){
      event.preventDefault()
      this.setAxiosDefaults();
      return (axios.post('/users/sign_in', {
        user: {
          email: this.email,
          password: this.password,
        }
      })
        .then(response => {
       
          this.updateCsrfToken(response.data.csrf_token);
          this.$store.commit("setCurrentUser",response.data.result)
          this.$router.push({path: '/'});
        })
        .catch(error=>{
          
          this.errors.push('emailまたはpasswordが不正です');
        })
      )
    },
  }
}