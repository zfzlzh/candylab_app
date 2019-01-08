<template>
    <div class="home">
       <header-home></header-home>
       <section>
           
        <mt-swipe :auto="3000">
            <mt-swipe-item v-for="item of imgs" :key="item.cid">
                <router-link :to="item.href">
                    <img :src="item.img" alt="图片丢失">
                </router-link>    
            </mt-swipe-item>
        </mt-swipe>   
        <div class="mui-content">
            <ul class="mui-table-view mui-grid-view mui-grid-9">
                <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"> 
                <router-link to="/products">
                    <img src='static/small/c1.png'/>
                        <div class="mui-media-body">新品上市</div></router-link></li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
                    <router-link to="/GoodsList"> 
                    <img src='static/small/c2.png'/>
                        <div class="mui-media-body">进口好货</div></router-link></li>
                <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img src='static/small/c4.png'/>
                        <div class="mui-media-body">童年回忆</div></a></li>
                <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img src='static/small/chocolate1.png'/>
                        <div class="mui-media-body">巧克力</div></a></li>
                <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img src='static/small/c5.png'/>
                        <div class="mui-media-body">人气热卖</div></a></li>
                <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img src='static/small/c6.png'/>
                        <div class="mui-media-body">商品推荐</div></a></li>
            </ul> 
        </div>
         
        <div class="mui-card">
				<div class="mui-card-header">限时特购</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
                            <div class="low_font">
                                <p>限时半价！</p>
                            </div>  
                            <div class="time_low">
                                <div  v-for="low of list.slice(5,9)" :key="low.hot" ><img :src="low.pic"></div>
                            </div>    
					</div>
				</div>
				<div class="mui-card-footer">查看更多</div>
			</div>
        
        <div class="mui-card maybe">
				<div class="mui-card-header ">猜你喜欢</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<div v-for="pro of list.slice(0,16)" :key="pro.hot">
                        <router-link :to="{path:'/product_details',query:{pid:pro.pid}}">
                             <img :src="pro.pic">
                             <p>{{pro.pname}}</p>
                             <div>
                                <p>￥{{pro.price}}</p><span>付款人数{{pro.buyer}}</span>
                            </div>
                         </router-link>
                            </div>
					</div>
				</div>
				<div class="mui-card-footer"><p>暂无更多</p></div>
			</div>
        </section>
    </div>
</template>
<script>
    import header from '../sub/header1.vue'
    export default {
        data(){
            return{
                imgs:[],
                list:[],
            }
        },
        mounted() {
            window.addEventListener("scroll",this.handleScroll,true)
        },
        methods:{
            getImgs(){
                this.axios.get("http://127.0.0.1:3000/carousel").then(result=>{
                    this.imgs=result.data;
                })
            },
            getList(){
                this.axios.get("http://127.0.0.1:3000/maybeLike").then(result=>{
                    this.list=result.data;
                })
            },
          handleScroll(){
            let scroll = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
            let fixed = document.querySelector(".header");
           if(scroll>=200){
               fixed.style.position = "fixed"
           }else if(scroll<200){
               fixed.style.position = ""
           }
            
          }
        },
        created(){
            this.getImgs();
            this.getList();
            
        },
        components:{
            "header-home":header
        },
        destroyed(){//销毁页面时移除滚动事件,要与addEventListener里写的一摸一样
          window.removeEventListener("scroll",this.handleScroll,true);
    },
    }
</script>
<style scoped>
    
   section{
       margin-top:1rem;
   }
.home .mint-swipe,.home .mui-content ul{
    box-shadow:5px 6px 3px rgba(0, 0, 0, .3)
}

/*轮播*/
.home .mint-swipe{
    height: 150px;
    border-radius:5%;
    width:95%;
    left:0.6rem;
  }
  .home .mint-swipe img{
    width:100%
  }
  /*九宫格*/
  .home .mui-content ul li img{
    border-radius:15%
  }
  .home .mui-content{
      background-color:transparent;
  }
  .home .mui-content .mui-grid-view.mui-grid-9{
    background-color:rgba(255, 255, 255, 0.55);
    margin:1rem auto;
    border-radius:10%;
  }
  .home .mui-content .mui-grid-view.mui-grid-9 li{
    border:0;
  }
  .home .mui-icon{
    font-family:Muiicons;
    font-size:24px;
  }
  .home .mui-table-view.mui-grid-view{
      width:96%
  }
  .home .mui-grid-view.mui-grid-9 .mui-table-view-cell{
      padding:0 15px;
  }
  .home .mui-content ul li .mui-media-body{
     
      color:#f44336b8;
      font-weight:bold;
  }
 /*详情*/
.mui-card{
      background:rgba(255, 255, 255, 0.55);
      border-radius:5%;
      
  }

 .mui-card-content-inner{
    display:flex;
    justify-content:flex-start;
    flex-wrap:wrap;
    padding-left:0.25rem;
    
}
.mui-card-content-inner>.low_font{
    width:100%;
    height:3rem;
  
}
.mui-card-content-inner>div{
 width:10rem;
    height:15rem;
}
.mui-card-content-inner div p{
   line-height:3rem;
   color:#dd524d;
   font-size:18px;
  
}
.mui-card-content>.mui-card-content-inner>.time_low{
    display:flex;
    justify-content:space-around;
    flex-wrap:wrap;
   margin-left:-0.6rem;
   width:100%;
    height:18rem;
}
.mui-card-content>.mui-card-content-inner>.time_low>div{
    width:8rem;
    height:5rem;
}
.time_low>div>img{
    width:9rem;
    height:8rem;
}
.maybe{
    border-radius:1%;
}
.maybe div div div a img{
   margin-left:1rem
}
.maybe div div div a p{
    height:33px;
    overflow:hidden;
    	font-weight: bold;
        white-space:nowrap;
        text-overflow: ellipsis;
        margin-left:1rem
}
.maybe div div div a div p{
    font-size:18px;
   
}
.maybe div div div a div span{
    margin-top:0.8rem;
}
.maybe div div div:nth-child(2n){
    margin-left:1rem;
}
.maybe div div div a div{
   display:flex;
   justify-content:space-between;
   
}
.mui-card-footer>p{
   width:100%;
   text-align:center;
  
}

</style>