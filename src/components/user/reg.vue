<template>
    <div class="reg">
            <h3 class="welcome text-center">欢迎注册</h3>
            <div><input type="text" name="uname" v-model="uname" placeholder="请输入用户名" @blur = "selectUname">
                <div class="rOw">
                    <div v-if="hasUname==1"><svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-dui"></use>
                    </svg></div>
                    <div v-else-if="hasUname==0" class="wrong"><svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-cuo"></use>
                    </svg></div>
                
               </div>
            </div>
            <div><input type="password" name="upwd" v-model="upwd" placeholder="请输入6-18位数字加字母密码" @blur="passWord">
                <div class="rOw">
                        <div v-if="pass==1"><svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-dui"></use>
                        </svg></div>
                        <div class="wrong" v-else-if="pass==0"><svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-cuo"></use>
                        </svg></div>
                        
                   </div>
            </div>
            <div><input type="password" name="reupwd" v-model="reupwd" placeholder="请再次输入密码" @blur = "rePass">
                <div class="rOw">
                        <div v-if = "repass==1"><svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-dui"></use>
                        </svg></div>
                        <div class="wrong" v-else-if="repass==0"><svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-cuo"></use>
                        </svg></div>
                       
                   </div>
            </div>
            <div><input type="date" name="birth" v-model="birth" placeholder="请输入生日">
            </div>
            <div><input type="email" name="email" v-model="email" placeholder="请输入您的邮箱" @blur = "Email">
                <div class="rOw">
                        <div v-if="mail==1"><svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-dui"></use>
                        </svg></div>
                        <div  class="wrong" v-else-if="mail==0"><svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-cuo"></use>
                        </svg></div>
                       
                   </div>
            </div>
            <div><input type="text" name="phone" v-model="phone" placeholder="请输入您的电话号码" @blur="tel_num">
                <div class="rOw">
                        <div v-if="tel ==1"><svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-dui"></use>
                        </svg></div>
                        <div  class="wrong" v-else-if="tel ==0"><svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-cuo"></use>
                        </svg></div>
                        
                   </div>
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
                gender:"",
                hasUname:2,
                pass:2,
                repass:2,
                mail:2,
                tel:2
            }
        },
        methods:{
            //名字检测
            selectUname(){
                let uname = this.uname;
                let url = "http://127.0.0.1:3000/findUser?uname="+uname;
                this.axios.get(url).then(result=>{
                    if(result.data.code == 1){
                        this.hasUname = 1
                    }else if(result.data.code == 0){
                        this.hasUname = 0
                       Toast(result.data.msg)
                    }else{
                        this.hasUname = 2
                        Toast(result.data.msg)
                    }
                })
            },
            //密码检测位数
            passWord(){
                let patt = /^(?![a-zA-Z]+$)(?![0-9]+$)[a-zA-Z0-9]{6,17}$/;//判断位数并且不能为纯数字纯字母，？！匹配不符合后面规则的文本，+匹配一个或多个，$从行末匹配
               
                if(patt.test(this.upwd)){
                    this.pass=1
                }else if(!patt.test(this.upwd) && this.upwd!=""){
                   this.pass = 0;
                   Toast(
                       `位数错误或不能为纯数字与纯字母`
                )
                }else if(this.upwd ==""){
                    this.pass=2
                }
            },
            //重复密码检测是否一致
            rePass(){
                let rpwd = this.reupwd;
                let pwd = document.querySelector(".reg>div:nth-child(3)>input").value;
                if(rpwd == pwd && pwd!=""){
                    this.repass = 1
                }else if(rpwd != pwd && rpwd!= ""){
                    this.repass = 0
                }else{
                    this.repass = 2
                }
            },
            //邮箱检验格式
            Email(){
                let e_patt = /^[a-zA-Z0-9]+([-_.][a-zA-Z0-9]+)*@([a-zA-Z0-9]+[-.])+[a-zA-Z0-9]{2,4}$/;
                if(e_patt.test(this.email)){
                    this.mail = 1
                }else if(!e_patt.test(this.email) && this.email != ""){
                    this.mail =0
                }else{
                   this. mail = 2
                }
            },
            //号码检验位数
            tel_num(){
                let p_patt=/^[1][3,4,5,7,8][0-9]{9}$/;
                if(p_patt.test(this.phone)){
                    this.tel = 1
                }else if(!p_patt.test(this.phone) && this.phone != ""){
                    this.tel = 0
                }else{
                    this.tel = 2
                }
            },
            //发送数据
            sendMsg(){
                let uname = this.uname;
                let upwd = this.upwd;
                let birth = this.birth;
                let email = this.email;
                let phone = this.phone;
                let gender = this.gender;
                var url ="http://127.0.0.1:3000/reg";
                this.axios.post(url,qs.stringify({uname,upwd,birth,email,phone,gender},{ indices: false }), {headers:{"Content-Type": "application/x-www-form-urlencoded;charset=utf-8"}}).then(result=>{
                   if(result.data.code == 1){
                        Toast(result.data.msg);
                           this.$router.push("/login");  
                    }else {
                        Toast('信息有误')
                    }
                })
            }
        },
        created(){
           
          
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
/*对错小框*/
.reg>div{
    position: relative;
}
.rOw{
    position:absolute;
    width:2rem;
    height:2rem;
    top:1rem;
    left:18rem;
}
.rOw .wrong svg{
    fill:#f55550
}
.rOw div svg{
    width:2rem;
    height:2rem;
    fill:#12dec9;
    position: absolute;
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