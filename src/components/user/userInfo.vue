<template>
    <div>
        <header class="header">
                <div @click="back">
                    <a><span class="mui-icon mui-icon-undo"></span></a>
                    <p>设置</p>
                </div>
        </header>
        <section>
            <ul class="mui-table-view ul-first">
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							<div class="user-info">
                                    <div class="avatar" v-show="!hasPic">
                                            <svg class="icon" aria-hidden="true">
                                                <use xlink:href="#icon-morentouxiang"></use>
                                            </svg>
                                    </div>
                                <div v-show="hasPic" class="avatar"><img :src="list[0].avatar" alt=""></div>
                                <div>
                                    <p>{{list[0].nickname}}</p>
                                    <p>账号名：{{list[0].uname}}</p>
                                </div>
                            </div>
						</a>
					</li>
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							我的收货地址
						</a>
					</li>
                </ul>
                <div class="mui-table-view">
                        <div class="mui-table-view-cell">
                            <a class="mui-navigate-right">
                                账户与安全
                            </a>
                        </div>
                    </div>
            <ul class="mui-table-view">
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							音效与通知
						</a>
					</li>
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							隐私
						</a>
					</li>
					<li class="mui-table-view-cell">
						<a class="mui-navigate-right">
							通用
						</a>
					</li>
                </ul>
                <ul class="mui-table-view">
                        <li class="mui-table-view-cell">
                            <a class="mui-navigate-right">
                                问题反馈
                            </a>
                        </li>
                        <li class="mui-table-view-cell">
                            <a class="mui-navigate-right">
                                关于app
                            </a>
                        </li>
                    </ul>
                </section>
                <footer @click="signout">
                    <mt-button size="large">退出当前账户</mt-button>
                </footer>
    </div>
</template>
<script>
    import {Toast} from "mint-ui"
    export default {
        data(){
            return{
                list:[{items:"加载中...",text:"加载中..."}],
                hasPic:"false"
            }
        },
        methods:{
            back(){
                this.$router.go(-1)
            },
            signout(){
                sessionStorage.removeItem("uname");
                Toast("注销成功");
                this.$router.go(-1)
            },
            getUname(){
                if(sessionStorage.getItem('uname')){
                    let uname = sessionStorage.getItem('uname');
                    console.log(uname)
                let u_url = "http://127.0.0.1:3000/getMsg?uname="+uname;
                this.axios.get(u_url).then(res=>{
                    if(res.data.length>0){
                        this.list = res.data;
                        if(res.data.avatar == ""){
                            this.hasPic = false
                        }else{
                            this.hasPic = true
                        }
                    }else{
                        Toast(res.msg)
                    }
                })
            }
                }
                
        },
        created() {
            this.getUname()
        },
    }
</script>
<style scoped>
    header>div{
        display: flex;
        padding-top:0.5rem;
        background: #fff
    }
    header>div>p,header>div>a>span{
        font-size:18px;
        color:#aaa;
        margin-left:0.2rem
    }
.user-info{
    height:5rem;
    display:flex;

}
.avatar{
    width:35%
}
.avatar>svg
{
    width:4rem;
    height:4rem
}
.avatar>img{
    border-radius: 50%
}
.user-info>div:last-child>p:first-child{
    font-size:18px;
    margin-bottom:1rem
}
ul:not(.ul-first),section>div{
    margin-top:2rem
}
section .ul-first:before{
    background:#fff
}
footer{
    width:100%;
   
    position:absolute;
    top:37rem;
    z-index:990

}
footer>button{
    height:4.5rem;
    background-image:linear-gradient(
        90deg,rgb(224, 159, 143) 0%,rgb(231, 93, 93) 50%,rgba(248, 65, 59, 0.842) 100%);
        color:#fff
}
</style>