<template>
    <div>
    <header-box></header-box>
<section>
    
    <div class="pro-top">
        <div ><a>全部</a></div>
        <div ><a>本周热卖</a></div>
    </div>
    <div class="product">
     <div class="select">
        <div>综合<i></i></div>
        <div>销量<i></i></div>
        <div>筛选<i></i></div>
    </div>
    <div class="pro-content">
        <div class="pro-card" v-for="pro of list" :key="pro.buyer+pro.hot">
            <a>
                <div class="pic_frame">
                    <img :src="pro.pic"/>
                </div>
                <div class="info_frame">
                    <p>{{pro.pname}}</p>
                    <div>
                        <p>￥{{pro.price}}</p> 
                        <span>付款人数：{{pro.buyer}}</span> 
                    </div>
                </div>
            </a>
      
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
    .pro-top{
        display:flex;
        justify-content:space-around;

    }
    .pro-top>div{
        padding:0.2rem;
        width:5rem;
        height:2.5rem;
         text-align:center;
         font-weight:bold;
    }
    .pro-top>div>a{
       color:rgb(223, 70, 95);
    }
    .product{
        background:rgba(255, 255, 255, 0.55);
    }
    /*选项框*/
    .select{
        display:flex;
        justify-content:space-evenly;
        padding-top:0.6rem;
    }
    .select>div{
        width:28%;
       
        font-size:18px;
        text-align:center;
    }
    .select>div>i{
        display:inline-block;
        border-top:1px solid #000;
        border-right:1px solid #000;
        width:0.5rem;
        height:0.5rem;
        transform:rotate(135deg);
        margin:0.3rem 1.1rem
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
        height:2.8rem;
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