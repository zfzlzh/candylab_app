<template>
    <div>
        <header>
                <div>
                    <p>购物车</p>
                    <a>管理</a>
                </div>
                <p>
                   共1件未付款的商品
                </p>
        </header>
        <section>
            <div class="cart">
                <div class="mui-card">
                        <div class=" mui-card-content">
                            <div class="mui-card-content-inner">
                                <div class="circle">
                                    <i><i></i></i>
                                </div>
                                <div class="good_pic">
                                    <img src="" alt="">
                                </div>
                                <div class="good_content">
                                    <p>名字</p>
                                    <div class="numbox">
                                        <p>商品规格</p>
                                        <div class="math">
                                                <button  type="button">-</button>
                                                <input type="number"/>
                                                <button type="button">+</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                
            </div>
            <div class="you-like">
                    <div class="mui-card">
                            <div class="mui-card-header ">您可能还喜欢</div>
                            <div class="mui-card-content">
                                <div class="mui-card-content-inner">
                                    <div v-for="good of list.slice(5,17)" :key="good.hot+good.buyer">
                                    <router-link :to="{path:'/product_details',query:{pid:pro.pid}}">
                                         <img :src="good.pic" >
                                         <p>{{good.pname}}</p>
                                         <div>
                                            <p>￥{{good.price}}</p><span>付款人数{{good.buyer}}</span>
                                        </div>
                                     </router-link>
                                        </div>
                                </div>
                            </div>
                            <div class="mui-card-footer"><p>到底了哦</p></div>
                        </div>
            </div>
        </section>
    </div>
</template>
<script>
   
    export default {
        data(){
            return{ 
                list:[],
            }
        },
       
        methods:{
            getList(){
                this.axios.get("http://127.0.0.1:3000/maybeLike").then(result=>{
                    this.list=result.data;
                    
                })
            },
            created(){
                this.getList();
            }
    }}
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
/*商品框*/

.cart{
    position: relative;;
    top:-5rem;
    width:100%
}
.mui-card{
    box-shadow:4px 4px 4px rgba(0, 0, 0, .3)
}
.cart .mui-card{
    height:9rem;
    border-radius:10px;
    

}
.cart .mui-card .mui-card-content{
    height:100%
}
.cart .mui-card .mui-card-content-inner{
    display:flex;
    height:100%
   
}
.circle{
    width:10%;
   padding-top:2.5rem;
   border-top-left-radius: 10%;
   border-bottom-left-radius: 10%
}
.circle i{
    display:inline-block;
    width:2rem;
    height:2rem;
    border-radius: 50%
}
.circle>i{
    border:1px solid #444
}
.circle>i>i{
    width:1rem;
    height:1rem;
   margin:0.45rem 0.45rem
}
.good_pic{
    width:35%
}
.good_content{
    width:55%;
    display:flex;
    justify-content: space-between;
    flex-direction: column;
    border-top-right-radius: 10%;
   border-bottom-right-radius: 10%
}
.numbox{
    display:flex;
}
.numbox>.math{
    width:5rem;
    display:flex;
    margin-left:2rem
}
.numbox>.math>button,.numbox>.math>input{
    height:2rem
}
/*你可能喜欢*/
.you-like{
    position: relative;
    top:-3rem
}
.you-like>.mui-card>.mui-card-footer>p{
    margin:0 auto
}
</style>