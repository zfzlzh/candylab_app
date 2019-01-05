<template>
    <div>
        <header>
            <div>
                <a><span class="mui-icon mui-icon-back"></span></a>
                <p>注册</p>
            </div>
        </header>
        <section class="login_wd">
             <div>
                <h4>请登陆</h4>
                <a href="register.html" class="">新用户注册</a>
            </div>
            <div class="info">
                <div>
                    <input type="text" placeholder="请输入用户名" v-model="uname">
                    <span class=""></span>
                </div>
                <div>
                    <input type="password" placeholder="请输入密码" v-model="upwd">
                    <span></span>
                </div>
            </div>
            <div>
                <div>
                    <input type="checkbox" id="rembemer">
                    <label for="rembemer">记住密码</label>
                </div>
                <a href="#">忘记密码</a>
            </div>
            <div>
                <button  @click="singin">登陆</button>
            </div>
        </section>
    </div>
</template>
<script>
import {Toast} from "mint-ui";
    export default {
        data(){
            return{
                uname:"",
                upwd:""
            }
        },
        methods:{
            singin(){
                let uname = this.uname;
                let upwd = this.upwd;
                let url = "http://127.0.0.1:3000/login?uname="+uname+"&upwd="+upwd;
                this.axios.get(url).then(result=>{
                    if(result.data.length>0){
                       
                        let user = result.data[0].uname;
                        console.log(user)
                        sessionStorage.setItem('uname',user)
                       
                        this.$store.dispatch("setUser",user);
                        
                       this.$router.push("/User");
                    }else{
                        Toast(result.msg)
                    }
                })
            }
        }

    }
</script>
<style scoped>
  header{
       padding:1rem 0 0 0 ;
       background:#f55550
    }
    header>div{
        display: flex;
       justify-content: space-between;
        width:90%;
        margin: 0.1rem  1rem ;
    }
    header>div>p,header>div>a>span{
        font-size:18px;
        color:#fff
    }
.login_wd{
    width:20rem;
    line-height: 2.5rem;
    margin:7rem auto 14rem;

    }
    .login_wd div:first-child,.login_wd div:nth-child(3){
        display:flex;
        justify-content: space-between;
    }
    .login_wd div:nth-child(3) div input{
        margin-top:0.9rem;
    }
.login_wd .info input{
    width:100%;
    margin-top:1rem;
    border:3px dotted #b9eeb2;
    }
.login_wd div button{
    width:100%;
        margin-top: 1rem;
    }
.login_wd div a{
    font-size:0.5rem;
    }
.footer{
    height:14rem;
    margin-top:10rem;

    }
div button{
    text-shadow:2px 2px 20px rgba(66, 66, 66, 0.88);
    animation:loginPlus 5s linear infinite;
    }
div button:hover{
    text-shadow:none;
    }
.login_wd div h4,.login_wd div label{
    color: #f55550;
    }
.login_wd div a{
    color: rgba(50, 56, 62, 0.59);
    }
/*动画*/
@keyframes loginPlus {
  from { background-color: transparent; box-shadow: 0 0 25px #fff; opacity:1}
    25% {background-color: transparent; box-shadow: 0 0 15px #fff; opacity:0.8}
    50% { background-color: transparent; box-shadow: 0 0 5px #fff;  opacity:0.5}
    75% {background-color: transparent; box-shadow: 0 0 15px #fff; opacity:0.8}
    to { background-color:  transparent; box-shadow: 0 0 25px #fff; opacity:1 }
    }
</style>