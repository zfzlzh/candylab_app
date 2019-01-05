<template>
    <div class="reg">
            <h3 class="welcome text-center">欢迎注册</h3>
            <div><input type="text" name="uname" v-model="uname" placeholder="请输入用户名" @blur="selectUname">
            </div>
            <div><input type="password" name="upwd" v-model="upwd" placeholder="请输入密码" >
                 
            </div>
            <div><input type="password" name="reupwd" v-model="reupwd" placeholder="请再次输入密码" >
                 
            </div>
            <div><input type="text" name="birth" v-model="birth" placeholder="请输入生日">
                    </div>
            <div><input type="email" name="email" v-model="email" placeholder="请输入您的邮箱" >
                
            </div>
            <div><input type="text" name="phone" v-model="phone" placeholder="请输入您的电话号码" >
                
            </div>
            <input type="radio" id="male"  v-model="gender" value="1" ><label for="male">男</label>
            <input type="radio" id="female"  v-model="gender" value="0"><label for="female">女</label>
            <input type="radio" id="secrect"  v-model="gender" value="2"><label for="secrect">不详</label>
            <button @click="sendMsg">提交</button>
</div>
</template>
<script>
import {Toast} from "mint-ui";
import qs from 'qs';
    export default {
        data(){
            return{
               uname:"",
               upwd:"",
               reupwd:"",
                birth:"",
                email:"",
                phone:"",
                gender:""
            }
        },
        methods:{
            selectUname(){
                let uname = this.uname;
                let url = "http://127.0.0.1:3000/findUser?uname="+uname;
                this.axios.get(url).then(result=>{
                    if(result.data.code == 1){
                        Toast("ok")
                    }else if(result.data.code == 0){
                        Toast(result.data.msg)
                    }else if(result.data.code == 2){
                        Toast(result.data.msg)
                    }
                })
            },
            sendMsg(){
                let uname = this.uname;
                let upwd = this.upwd;
                let birth = this.birth;
                let email = this.email;
                let phone = this.phone;
                let gender = this.gender;
               
                console.log(uname)
                var url ="http://127.0.0.1:3000/reg";
                this.axios.post(url,qs.stringify({uname,upwd,birth,email,phone,gender},{ indices: false }), {headers:{"Content-Type": "application/x-www-form-urlencoded;charset=utf-8"}}).then(result=>{
                    console.log(result)
                    if(result.data.code == "non"){
                        Toast(result.data.msg)
                    }else if(result.data.code == "nop"){
                        Toast(result.data.msg)
                    }else if(result.data.code == "noe"){
                        Toast(result.data.msg)
                    }else if(result.data.code == 1){
                        Toast(result.data.msg)
                        this.$router.push("/login");
                    }else if(result.data.code == 0){
                        Toast(result.data.msg)
                    }
                })
            }
        },
        created(){
            this.selectUname();
            this.sendMsg()
        },
    }
</script>
<style scoped>
    
.reg{
  width:20rem;
    line-height: 1rem;
    margin:3rem auto 0;

}

.reg button{
    background:transparent;
    border:1px solid #12dec9;
    color:#0b4e89;
     width:100%;
     margin-top:1rem;
       animation:reqPlus 5s linear infinite;
}
.reg>div>input{
    margin:0.8rem 1.5rem;
    width:80%;
    border-color: #00aeef;
}
.reg .footer{
    height:11rem;

}
.reg .welcome,label{
    color: #f55550;
}
.reg div span{
    margin-left:2rem;
    font-size:0.1rem;

}

/*动画*/
@keyframes reqPlus {
   from { background-color: transparent; box-shadow: 0 0 25px #12dec9; opacity:1}
    25% {background-color: transparent; box-shadow: 0 0 15px #12dec9; opacity:0.8}
    50% { background-color: transparent; box-shadow: 0 0 5px #12dec9;  opacity:0.5}
    75% {background-color: transparent; box-shadow: 0 0 15px #12dec9; opacity:0.8}
    to { background-color:  transparent; box-shadow: 0 0 25px #12dec9; opacity:1 }
}
</style>