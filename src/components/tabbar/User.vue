<template>
    <div>
        <header>
         <div class="user" v-show="!isLogin">
             <router-link to="/login"><button>登陆</button></router-link>
             <router-link to="/reg"><button>注册</button></router-link>
         </div>       
        <div class="user_info" v-show="isLogin">
                <div class="u-name">
                    <div class="avatar" v-show="!hasPic">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-morentouxiang"></use>
                          </svg>
                    </div>
                    <div class="avatar" v-show="hasPic">
                        <img :src="list[0].avatar" alt="">
                    </div>
                    <div class="nickname">{{list[0].nickname}}</div>
                    <div class="other">
                        
                            <router-link to="/userInfo"><span class="mui-icon mui-icon-gear"></span></router-link> 
                            <span class="mui-icon mui-icon-help"></span>

                    </div>
                </div>
                <div class="collect">
                    <div>
                        <p>40</p>
                        <p>收藏夹</p>
                    </div>
                    <div>
                        <p>40</p>
                        <p>足迹</p>
                    </div>
                    <div>
                        <p>0</p>
                        <p>红包</p>
                    </div>
                </div>
        </div>
        </header>
        <section>
            <div class="vip">
                <div>
                    <img src="" alt="">
                    <p>星星糖 529</p>
                </div>
                <div>
                    <p>花小积分 兑大权益</p>
                    <p>进入我的会员中心</p>
                </div>
                <div>
                    <img src="" alt="">
                </div>
            </div>
            <div class="mui-card buy">
				<div class="mui-card-header"><p>我的订单</p><p>查看全部订单&gt;&gt;</p></div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<div class="mui-content">
		                     <ul>
		                        <li class=" mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-daifukuan01"></use>
                                      </svg>
                                    <div class="mui-media-body">待付款</div></a></li>
                                <li class=" mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-daifahuo"></use>
                                      </svg>
                                        <div class="mui-media-body">待发货</div></a></li>
                                <li class=" mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-yifahuo"></use>
                                      </svg>
                                        <div class="mui-media-body">待收货</div></a></li>
                                <li class=" mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-pingjia"></use>
                                      </svg>
                                        <div class="mui-media-body">评价</div></a></li>
                                <li class=" mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                                    <svg class="icon" aria-hidden="true">
                                        <use xlink:href="#icon-shouhou"></use>
                                      </svg>
                                        <div class="mui-media-body">退款/售后</div></a></li>
		                    </ul> 
		                </div>
					</div>
				</div>
				<div class="mui-card-footer">物流信息</div>
            </div>
            <div class="mui-card tool">
                    <div class="mui-card-header"><p>必备工具</p><p>查看全部工具&gt;&gt;</p></div>
                    <div class="mui-card-content">
                        <div class="mui-card-content-inner">
                            <div>
                                    <svg class="icon" aria-hidden="true">
                                            <use xlink:href="#icon-qian"></use>
                                          </svg>
                                <p>领券中心</p></div>
                            <div>
                                    <svg class="icon" aria-hidden="true">
                                            <use xlink:href="#icon-kefu"></use>
                                          </svg>
                                <p>在线客服</p></div>
                            <div>
                                    <svg class="icon" aria-hidden="true">
                                            <use xlink:href="#icon-iconfontevaluate"></use>
                                          </svg>
                                <p>我的评价</p></div>
                            <div>
                                    <svg class="icon" aria-hidden="true">
                                            <use xlink:href="#icon-tiaoseban"></use>
                                          </svg>
                                <p>主题换肤</p></div>
                        </div>
                    </div>
                </div>
        </section>
    </div>
</template>
<script>
    import {Toast} from 'mint-ui'
    export default {
        data(){
            return{
                list:[{items:"加载中...",text:"加载中..."}],
                hasPic:"false"
            }
        },
        methods: {
            getUname(){
                if(sessionStorage.getItem('uname')){
                    let uname = sessionStorage.getItem('uname');
                let u_url = "http://127.0.0.1:3000/getMsg?uname="+uname;
                this.axios.get(u_url).then(res=>{
                    console.log(res.data.length)
                    if(res.data.length>0){
                        this.list = res.data;
                        if(res.data.avatar == ""){
                            this.hasPic = false
                        }else{
                            this.hasPic = true
                        }
                        console.log(res.data)
                    }else{
                        Toast(res.msg)
                    }
                })
            }
                }
                
        },
        computed: {
            isLogin(){
               if(sessionStorage.getItem('uname')){
                   this.$store.commit("userStatus",sessionStorage.getItem('uname')); 
               }else{
                   this.$store.commit("userStatus",null);
               }
               return this.$store.getters.isLogin;
            },
           
        },
          created() {
            this.getUname()  
          }, 
       
            
        
    }
            
    
</script>
<style scoped>
    section>div{
        box-shadow:4px 4px 4px rgba(0, 0, 0, .3)
    }
/*登陆与注册*/
header{
    height:12.2rem;
    background-image:linear-gradient(
        0deg,rgb(224, 143, 143) 0%,rgb(231, 93, 93) 50%,rgba(248, 65, 59, 0.842) 100%);
}
.user{
    width:100%;
    height:100%;
    display:flex;
    justify-content: space-evenly;
    margin:0rem auto;
    padding:5rem 0
}
.user button{
    background:transparent;
    border:1px solid #fff;
    color:#fff;
    animation:loginPlus 3s linear infinite
}
.app-container .input_bg{
    display:none;
}
/*用户信息*/
.u-name,.collect{
    display:flex;
    justify-content: space-evenly;
}
.collect{
    margin-top:2rem;
}
.u-name{
    font-size:20px;
    height:3rem
}
.collect>div>p{
    font-size:18px;
    text-align: center;
}
.avatar{
width:30%;
margin-left:2rem
}
.avatar>svg
{
    width:4rem;
    height:4rem
}
.avatar>img{
    border-radius: 50%
}
.u-name,.collect>div>p{
    color:#fff;
}
.user_info{
    padding:2rem 0
}
.nickname{
    width:40%
}
.other{
    margin-left:1rem;
    width:20%;
    display:flex;
    justify-content: space-evenly
}
.other span{
    color:#fff
}
/*会员卡片*/
.vip{
    display:flex;
    position: absolute;
    top:10.9rem;
    left:1.2rem;
    width:90%;
}
.vip>div{
    display: flex;
    flex-direction: column;
    background:#fff;
    text-align: center;
    padding:0.3rem 0 
}
.vip>div:nth-child(1),.vip>div:nth-child(3){
    width:25%
}
.vip>div:nth-child(1){
    border-top-left-radius:15%;
    border-bottom-left-radius:15%;
}
.vip>div:nth-child(2){
    width:50%;
    
}
.vip>div:nth-child(2)>p:last-child{
    font-size:10px
}
.vip>div:nth-child(3){
    border-top-right-radius:15%;
    border-bottom-right-radius:15%;
}
/*购买信息卡片*/
.buy{
    margin-top:4rem
}
.buy>.mui-card-header{
    display: flex;
    justify-content: space-between
}
.buy>.mui-card-header>p{
    font-size:15px
}
.buy .mui-content ul li {
        width:6rem;
        height:4rem;
        
    }
.buy .mui-content ul li a,
.tool>.mui-card-content>.mui-card-content-inner>div>p,
.tool>.mui-card-content>.mui-card-content-inner>div
{
        text-align: center;
        color:rgb(231, 73, 73)
    }
.buy .mui-content ul li a svg,
.tool>.mui-card-content>.mui-card-content-inner>div>svg
{
        width:1.5rem;
        height:1.5rem;
        margin:0.6rem 1.3rem 0
    }
.buy .mui-content ul li a div{
font-size:10px;
    }
.buy .mui-card-content .mui-card-content-inner .mui-content ul{
        display:flex;
        justify-content:spacing-between;
        list-style:none;
        padding:0
    }
    /*工具卡片*/
.tool>.mui-card-header{
    display:flex;
    justify-content: space-between;
}
.tool>.mui-card-content>.mui-card-content-inner{
    display:flex;
    justify-content: space-evenly
}
    /*动画*/
@keyframes loginPlus {
    from { background-color: transparent; box-shadow: 0 0 25px #fff; opacity:1}
    25% {background-color: transparent; box-shadow: 0 0 15px #fff; opacity:0.8}
    50% { background-color: transparent; box-shadow: 0 0 10px #fff;  opacity:0.5}
    75% {background-color: transparent; box-shadow: 0 0 15px #fff; opacity:0.8}
    to { background-color:  transparent; box-shadow: 0 0 25px #fff; opacity:1 }
    }
</style>