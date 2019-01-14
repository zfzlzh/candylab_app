<template>
    <div>
    <header-box></header-box>
<section>
        <div data-am-widget="tabs" class="am-tabs am-tabs-d2">
       <ul class="am-tabs-nav am-cf">
           <li class="am-active"><a >全部</a></li>
           <li class=""><a >本周热卖</a></li>
       </ul>
       <nav data-am-widget="menu" class="am-menu  am-menu-default"> 
            <a href="javascript: void(0)" class="am-menu-toggle">
                    <i class="am-menu-toggle-icon am-icon-bars"></i>
              </a>
              <ul class="am-menu-nav am-avg-sm-3">
                  <li class="am-parent">
                    <a  class="" >综合</a>
                      <ul class="am-menu-sub am-collapse  am-avg-sm-2 ">
                        <li class="">
                            <a  class="" >综合</a>
                        </li>
                          <li class="">
                            <a  class="" >好评</a>
                          </li>
                          <li class="">
                            <a  class="" >购买人数</a>
                          </li>
                          <li class="">
                            <a  class="" >质量优先</a>
                          </li>
                      </ul>
                  </li>
                  <li class="am-parent">
                    <a  class="" >销量</a>
                      <ul class="am-menu-sub am-collapse  am-avg-sm-3 ">
                          <li class="">
                            <a  class="" >按销量从高到低</a>
                          </li>
                          <li class="">
                            <a  class="" >按销量从低到高</a>
                          </li>
                      </ul>
                  </li>
                  <li class="am-parent">
                    <a href="#c3" class="" >价格</a>
                      <ul class="am-menu-sub am-collapse  am-avg-sm-4 ">
                          <li class="">
                            <a  class="" >按价格从高到低</a>
                          </li>
                          <li class="">
                            <a  class="" >按价格从低到高</a>
                          </li>
                      </ul>
                  </li>
              </ul>
          </nav>
       <div class="am-tabs-bd product">
           <div data-tab-panel-0 class="am-tab-panel am-active pro-content">
                <div class="pro-card" v-for="pro of list" :key="pro.buyer+pro.hot">
                        <a>
                            <div class="pic_frame">
                                <img :src="pro.pic"/>
                            </div>
                            <div class="info_frame">
                                <p>{{pro.pname}}</p>
                                <div>
                                    <p>￥{{pro.price | filterMoney}}</p> 
                                    <span>付款人数：{{pro.buyer}}</span> 
                                </div>
                            </div>
                        </a>
                  
                    </div>
                </div>

           <div data-tab-panel-1 class="am-tab-panel pro-content">
                <div class="pro-card" v-for="pro of list" :key="pro.price">
                        <a>
                            <div class="pic_frame">
                                <img :src="pro.pic"/>
                            </div>
                            <div class="info_frame">
                                <p>{{pro.pname}}</p>
                                <div>
                                    <p>￥{{pro.price | filterMoney}}</p> 
                                    <span>付款人数：{{pro.buyer}}</span> 
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
           </div>
        </div>
</section>
</div>
</template>
<script>
    import header from '../sub/header2.vue'
    export default {
        data(){
            return{
                list:[]
            }
        },
        methods:{
             getList(){
                this.axios.get("http://127.0.0.1:3000/maybeLike").then(result=>{
                    this.list=result.data;
                })
            }
        },
        created(){
            this.getList();
        },
        components:{
            "header-box":header
        }
        }
    
</script>
<style scoped>
    section{
        margin-top:1rem;
        padding-bottom:1.5rem
    }
    .am-menu-nav>li>ul>li{
    width:14rem
    }
    /*内容*/
    .product{
        box-shadow:5px 6px 3px rgba(0, 0, 0, .3)
    }
    .pro-content{
        display:flex;
        justify-content:space-evenly;
        margin-top:1rem;
        flex-direction: column;
        padding-left:0.6rem
    }
    .pro-content>.pro-card>a{
        height:150px;
        display: flex;
        margin-top:1rem
    }
    .pro-content>.pro-card>a>.pic_frame>img{
        border-radius: 5%
    }
    .pro-content>.pro-card>a>.info_frame{
        margin-left:1rem;
        display: flex;
        justify-content: space-around;
        flex-direction: column;
        height:100%;
    }
    .pro-content>.pro-card>a>.info_frame>p{
        font-size: 15px;
        height:3.5rem;
        flex-wrap: wrap;
    
    	font-weight: bold;
        overflow: hidden;
        text-overflow: ellipsis;
        display:-webkit-box; 
        -webkit-box-orient:vertical; 
        -webkit-line-clamp:2; 
        width:13rem;
    }
    .pro-content>.pro-card>a>.info_frame>div>p{
        font-size:17px;
        font-weight :bold;
        color:rgb(221, 62, 62)
    }
    .pro-content>.pro-card>a>.info_frame>div>span{
        font-size:12px;

    }
    </style>