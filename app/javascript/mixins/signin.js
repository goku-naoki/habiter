import axios from 'axios';
export default {
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
          this.$router.push({path: '/'});
        })

      )
    },
  }
}