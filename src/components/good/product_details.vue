<template>
    <section>
        <header class="header"> 
                <a @click="back"><span class="mui-icon mui-icon-back"></span></a>
                <a><span class="mui-icon mui-icon-star"></span></a>
        </header>
        <div class="mask" v-show = "tasteShow" @click="choiceTaste"></div>
        <div class="details-pic ">
               <mt-swipe :auto="0" :continuous="false">
                   <mt-swipe-item v-for = "img of pic" :key = "img.did" class="mui-slider-item"><img :src="img.pic" alt=""></mt-swipe-item>
               </mt-swipe>
        </div>
        <div class="all-info">
        <div class="details-title">
            <div class="t-price">价格:￥{{title[0].price | filterMoney}}</div>
            <div class="t-name">{{title[0].title}}</div>
            <div class="t-info">
                <p>快递:{{title[0].free}}</p>
                <p>月销:{{title[0].sale}}</p>
                <p>{{title[0].place}}</p>
            </div>
        </div>
        <div class="details-server">
            <div><p>优惠</p><span>{{title[0].favour}}</span><p>领券&gt;&gt;</p></div>
            <div><p>服务</p><span>{{title[0].serve}}</span></div>
        </div>
        <div class="details-para">
            <div @click="choiceTaste"><p>规格</p><span>选择口味</span></div>
                <div class="choice_taste" v-show="tasteShow">
                    <div><img :src="taste[dex].small_pic" alt="">
                        <div>
                            <p>￥{{taste[dex].price*selectNum | filterMoney}}</p>
                            <p>{{taste[dex].taste}}</p>
                            <p>库存:300</p>
                        </div>
                    </div>
                    <div>
                        <p  v-for = "(tas,index) of taste" :key="tas.ttid" @click="getTaste(index)">{{tas.taste}}</p>
                    </div>
                    <div class="mui-numbox">
                            <button class="mui-btn mui-btn-numbox-minus" type="button">-</button>
                            <input class="mui-input-numbox" type="number" v-model="selectNum"/>
                            <button class="mui-btn mui-btn-numbox-plus" type="button">+</button>
                    </div>
                    <div>
                        <button type ="button">立即购买</button>
                        <button type ="button" @click="insertCart">加入购物车</button>
                    </div>
                </div>
                
                        <div @click="getPara"><p>参数</p><span>生产日期产品编号...</span></div>
                        
                                <div class="pa_info" v-show="paraShow">
                                    <div v-for="pa of para" :key = "pa.aid">{{pa.info}}</div>
                                </div>
                        
        </div>
        <div class="details-comment">
            <div><p>宝贝评价</p><p>查看更多&gt;</p></div>
            <div class="content">
                <div>
                    <img :src="comment[0].avatar" alt="">
                    <p>{{comment[0].who}}</p>
                </div>
                <div>
                    {{comment[0].content}}
                </div>
            </div>
        </div>
        <div class="star">
            <p>商品评分:</p>
                <svg class="icon" aria-hidden="true">
                        <use xlink:href="#icon-xingxing"></use>
                      </svg>
                      <p>4.5
                      </p>
        </div>
        <div class="details-info">
                <div class="info-pic" v-for = "ipic of info" :key="ipic.iid">
                        <img :src="ipic.pic" alt="">
                    </div>
        </div>
    </div>
    </section>
</template>
<script>
    export default {
        data(){
            return{
                pic:[{items:"加载中...",text:"加载中..."}],
                title:[{items:"加载中...",text:"加载中..."}],
                info:[{items:"加载中...",text:"加载中..."}],
                para:[{items:"加载中...",text:"加载中..."}],
                comment:[{items:"加载中...",text:"加载中..."}],
                taste:[{items:"加载中...",text:"加载中..."}],
                tasteShow:false,
                dex:[0],
                selectNum:1,
                showIndex: 0,
                paraShow:false
            }
        },
      
        methods:{
            getMsg(){
                let pid =this.$route.query.pid;
                this.axios.get("http://127.0.0.1:3000/details?pid="+pid).then(result=>{
                   let {pic,title,info,para,comment,taste} = result.data;
                   this.pic=pic;
                   this.title= title;
                   this.info = info;
                   this.para = para,
                   this.comment = comment;
                   this.taste = taste;
                   console.log(para)
                })
            },
            choiceTaste(){
              this.tasteShow=!this.tasteShow
            },
            getTaste(index){
               this.dex = index;
            },
            getPara(){
                this.paraShow=!this.paraShow
            },
            back(){
                this.$router.go(-1);
            },
            insertCart(){

            }
        },
        created() {
            this.getMsg();
            // this.slider();
        },
       
    }
</script>
<style scoped>
    section{
        margin-top:0;
        background:#fff
    }
    section>.header{
       display: flex;
       justify-content: space-between;
       width:90%;
       margin-left:1rem;
       padding:1rem 0 0 0 
    }
   /* 顶部图片 */
   .details-pic{
       height:22rem;
       width:100%;
       position: relative
   }
 .details-pic>.mt-swipe{
     float:left;
     list-style: none;
     padding:0
 }
   /* all-info */
   .all-info{
       width:90%;
       margin:0 auto
   }
   .details-title,
   .details-para,
   .details-server,
   .details-comment,
   .details-info{
       margin-top:1.6rem;
   }
   .details-title>div,
   .details-server>div,
   .details-para>div{
       margin-top:0.9rem
   }
   /* 标题 */
   .details-title>.t-price{
       font-size:22px;
       color:rgb(230, 101, 42)
   }
   .details-title>.t-info{
       display: flex;
       justify-content: space-between
   }
   .details-server>div:first-child>p:last-child,
   .details-comment>div:first-child>p:last-child{
       color:rgb(230, 101, 42)
   }
   /* 服务信息 */
   .details-server>div{
    display: flex;
   }
   .details-server>div>span{
       margin-left:2rem
   }
   /* 参数信息 */
   .details-para{
       position: relative;
   }
   .details-para>div{
       display:flex;
   }
   .details-para>div>span{
       font-size: 14px;
       margin-left:2rem;
   }
    /* 选择口味框 */
    .mask{
        width: 100%;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    background: #000;
    opacity: 0.3;
    }
    .details-para>.choice_taste{
        width:100%;
        position: absolute;
        flex-direction: column;
        justify-content: space-evenly;
        background:#fff;
        padding:1rem;
        z-index:2
    }
    .details-para>.choice_taste>:not(div:first-child){
        border-top:1px solid rgba(0, 0, 0, 0.253)
    }
    .details-para>.choice_taste>div:first-child{
        display: flex;
    }
    .details-para>.choice_taste>div:first-child>img{
        display: inline-block;
        width:5rem;
        height:5rem
    }
    .details-para>.choice_taste>div:first-child>div>p{
        width:100%;
        margin-left:2rem;
        font-size: 15px;
    }
    .details-para>.choice_taste>div:nth-child(2){
        display: flex;
        justify-content: space-evenly;
        flex-direction: row;
        flex-wrap: wrap;
        margin-top:1rem;
       
    }
    .details-para>.choice_taste>div:nth-child(2)>p{
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        width:6rem;
        border:1px solid rgba(245, 82, 82, 0.829);
        text-align: center;
        height:2rem;
        line-height: 1.9rem;
        border-radius:10%;
    }
    .details-para>.choice_taste>div:nth-child(4){
        margin-top:1rem;
        text-align: right
    }
    .details-para>.choice_taste>div:nth-child(4)>button{
        text-align: center;
        width:9.5rem;
        height:3rem;
        background:rgba(216, 79, 74, 0.849);
        color:#fff;
        border-radius: 10%
    }
    .details-para>.choice_taste>div:nth-child(4)>button:first-child{
        background:rgba(236, 70, 48, 0.849);
    }
    /* 参数详细 */
    .pa_info{
        display:flex;
        justify-content: space-evenly;
        flex-wrap: wrap;
        font-size:14px;
    transition: all 1s linear
    }
    .pa_info>div{
       color:rgb(223, 41, 41);
    margin:1rem 0.3rem 0
    }
    
   /* 评论 */
   .details-comment>div:first-child,
   .details-server>div:first-child{
       display: flex;
       justify-content: space-between
   }
 
   .content>div:first-child{
       display: flex
   }
   .content>div:first-child>p{
       margin-left: 1rem
   }
   .content>div:last-child{
       padding:1rem
   }
   /* 详情图片 */
   .details-info>.info-pic{
       width:100%;
       height:37rem;
       margin-left:-1.2rem;
       margin-top:1rem
   }
   /* 评分 */
   .star{
       display:flex;
       margin:2rem 0
   }
   .star>svg{
       color:rgb(226, 183, 40);
       width:2rem;
       height:2rem;
       margin-top:-0.2rem
   }
   .star>p{
       font-size:18px
   }
</style>