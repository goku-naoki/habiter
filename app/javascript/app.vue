<template>
    <div class="signup-form">
        <div class="signup-form-box">
          <h2 class="signup-form-box-title">Habiter</h2>
          <p class="signup-form-box-desc">
            登録してMGKの写真や動画をチェックしよう
          </p>
          <div class="signup-form-box-form">
            <form >
              <div class="signup-form-box-form-facebook">
                <a href="#">Facebookでログイン</a>
              </div> 
              <div class="signup-form-box-form-another">
                <div></div>
                <p>または</p>
                <div></div>
              </div>  
              <div class="form-error" v-if="errors.length != 0">
                <ul v-for="e in errors" :key="e">
                  <li><font color="red">{{ e }}</font></li>
                </ul>
              </div>
              <div class="signup-form-box-form-email">
                <input type="email" v-model="email" placeholder="携帯電話番号またはメールアドレス" >
              </div>
              <div class="signup-form-box-form-fullname">
                <input type="text" v-model="nickname" placeholder="ニックネーム" >
              </div>
              <div class="signup-form-box-form-password">
                <input type="password" v-model="password" placeholder="パスワード" >
              </div>
              <div class="signup-form-box-form-submit">
                <button @click="signUp" type="submit">登録する</button>
              </div>
            </form>
          </div>
        </div>
      </div>
</template>

<script>
import axios from 'axios';
export default{
  data(){
    return{
        email:"",
        nickname:"",
        password:"",
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
    updateCsrfToken: function(csrf_token){
      axios.defaults.headers.common['X-CSRF-Token'] = csrf_token;
    },
    logIn:function(){
      return (axios.post('/users/sign_in', {
        user: {
          email: this.email,
          password: this.password,
        }
      })
        .then(response => {
          console.log('success');
          this.updateCsrfToken(response.data.csrf_token);
          return (response)
        })

      )
    },
    signUp: function(event){
      event.preventDefault()
      this.setAxiosDefaults();
      return (axios.post('/users', {
        user: {
          name: this.name,
          email: this.email,
          nickname:this.nickname,
          password: this.password,
        }
      })
      .then(response => {
          console.log(response.data.result.user);
          this.updateCsrfToken(response.data.csrf_token);
          this.logIn()
          // return (response)
        })
      )
    }
  }
}
</script>

