<template>
    <div>
        <header>
            <div>
                <p>消息</p>
                <a><span class="mui-icon-extra mui-icon-extra-addpeople"></span></a>
            </div>
            <p>
                18条未读消息
            </p>
        </header>
        <section>
            <div class="msg">
                <div>
                    <div><svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-yifahuo"></use>
                          </svg></div>
                    <p>交易物流</p>
                </div>
                <div>
                   <div><svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-kefu"></use>
                      </svg></div>
                    <p>通知消息</p>
                </div>
                <div>
                    <div><svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-iconfontevaluate"></use>
                          </svg></div>
                    <p>互动消息</p>
                </div>
            </div>
            <div class="msg_info">
                <div class="top_line mui-card" >
                    <div class="mui-card-content">
                        <div class="mui-card-content-inner">
                            <div class="msg_pic"><svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-xinwen
                                "></use>
                              </svg></div>
                            <div class="msg_content">
                                <p>头条新闻</p>
                                <p>星星糖可换千元红包！快来鸭！</p>
                            </div>
                            <div class="msg_date">
                                2018/02/01
                            </div>
                        </div>
                    </div>
                </div>
                <div class="all_msg mui-card">
                    <div class="mui-card-header">
                        <h4><a><span class="mui-icon-extra mui-icon-extra-lamp"></span></a>两周内消息</h4>
                    </div>
                    <div class="get_msg mui-card-content">
                        <div class="mui-card-content-inner">
                                <div class="msg_pic"><svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-pingjia"></use>
                                  </svg></div>
                                <div class="msg_content">
                                    <p>名字</p>
                                    <p>内容</p>
                                </div>
                                <div class="msg_date">
                                    2018/02/01
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>
<script>
    export default {
        data(){
            return{

            }
        }
    }
</script>
<style scoped>
    /*头部*/
    header{
        padding:1rem;
        background-image:linear-gradient(
        0deg,rgb(224, 143, 143) 0%,rgb(231, 93, 93) 50%,rgba(248, 65, 59, 0.842) 100%);
        height:12rem
    }
header>div{
    display:flex;
    justify-content: space-between;
}
header>div>p,
header>div span,
header>p{
    font-size:20px;
    color:#fff;
    
}
header>p{
    margin-top:0.5rem;
    font-size:15px
}
/*信息通知栏*/
.msg{
    display:flex;
    width:90%;
    position: absolute;
    top:7rem;
    left:1.3rem;
    height:7rem;
     
}
.msg>div{
    background:#fff;
    width:33.3333%;
    text-align: center;
    display:flex;
    flex-direction: column;
}

.msg>div:first-child{
    border-top-left-radius:10%;
    border-bottom-left-radius:10%
}
.msg>div:last-child{
    border-bottom-right-radius:10%;
    border-top-right-radius:10%;
}
.msg>div>div{
    width:3rem;
    height:3rem;
    margin:1rem auto 0.5rem;
    border-radius:50%;
    background-image:linear-gradient(
        0deg,rgb(143, 194, 224) 0%,rgb(231, 93, 93) 50%,rgba(248, 65, 59, 0.842) 100%);}
.msg>div:nth-child(2)>div{
    background-image:linear-gradient(
        0deg,rgb(143, 194, 224) 0%,rgb(231, 93, 93) 50%,rgba(248, 65, 59, 0.842) 100%);
}
.msg>div:nth-child(3)>div{
    background-image:linear-gradient(
        0deg,rgb(143, 194, 224) 0%,rgb(231, 93, 93) 50%,rgba(248, 65, 59, 0.842) 100%);
}
.msg>div>div>svg{
    font-size:31px;
    margin:0.2rem auto;
    color:#fff
}

/*信息内容*/
.msg_info{
    display:flex;
    flex-direction: column;
    margin-top:3rem
}
.all_msg>.mui-card-header{
    text-align: left
}
.all_msg>.mui-card-header>h4>a>span{
    color:#000
}
.top_line>.mui-card-content>.mui-card-content-inner,.get_msg>.mui-card-content-inner{
    display:flex;
}
.msg_pic{
    width:25%;
    background:rgb(240, 164, 93);
    border-radius: 10%;
    text-align: center;
    padding:1rem 0rem;
    
}
.msg_pic>svg{
    width:3rem;
    height:3rem;
   color:rgb(218, 43, 43)
}
.msg_date{
    width:19%;
    font-size:10px;
    color:#444
}
.msg_content{
    width:60%;
    padding:0.5rem 0 0 1rem
}
.msg_content>p{
    font-size: 18px;
    font-weight: bold;
    color:#444
}
.msg_content>p:last-child{
    font-size: 10px
}
</style>