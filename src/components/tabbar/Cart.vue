<template>
    <div>
        <header>
                <div>
                    <p>购物车</p>
                    <p @click="changeDelete">管理</p>
                </div>
                <p>
                   共{{cart.length}}件未付款的商品
                </p>
        </header>
        <section>
            <div class="cart">
                <div class="mui-card" v-for = "(cartItem,index) of cart" :key="cartItem.day">
                        <div class=" mui-card-content">
                            <div class="mui-card-content-inner">
                                <div class="check" @click="clickItem(index)" v-model="clickBox">
                                    <input type="checkbox">
                                </div>
                                <div class="good_pic">
                                    <img :src="cartItem.pic" alt="">
                                </div>
                                <div class="good_content">
                                    <p>{{cartItem.title}}</p>
                                   <p>商品规格</p>
                                        <div class="good_price">
                                            <p>{{cartItem.taste}}</p>
                                            <p>￥{{cartItem.price*cartItem.p_num | filterMoney}}</p>
                                         </div>
                                        <div class="mui-numbox math">
                                                <button class="mui-btn mui-btn-numbox-minus" type="button" :data-cid="cartItem.cid" @click="numSub">-</button>
                                                <input class="mui-input-numbox" type="number" v-model="cartItem.p_num"/>
                                                <button class="mui-btn mui-btn-numbox-plus" type="button" :data-cid="cartItem.cid" @click="numAdd">+</button>
                                        </div>
                                    
                                </div>
                            </div>
                        </div>
                </div>
                
            </div>
           
            <div class="mui-card you-like">
				<div class="mui-card-header ">为您推荐</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<div v-for="good of list.slice(5,17)" :key="good.hot+good.buyer">
                        <router-link :to="{path:'/product_details',query:{pid:good.pid}}">
                             <img :src="good.pic">
                             <p>{{good.pname}}</p>
                             <div>
                                <p>￥{{good.price | filterMoney}}</p><span>付款人数{{good.buyer}}</span>
                            </div>
                         </router-link>
                            </div>
					</div>
				</div>
				<div class="mui-card-footer"><p>到底了哦</p></div>
			</div>
        </section>
        <footer>
            <div class="selectAll"  >
                <div class="footer_circle">
                    <input type="checkbox"  v-model="isAllClicked" @click="clickAll">
                </div>
                <p>全选</p>
            </div>
            <div class="accounts" v-show="needDelete==-1">
                <div>合计:￥{{money | filterMoney}}</div>
                <mt-button size="large">结算</mt-button>
            </div>
            <div class="accounts" v-show="needDelete==1">
                <mt-button size="large" @click="deleteIt">删除</mt-button>
            </div>
        </footer>
    </div>
</template>
<script>
   import {Toast} from "mint-ui"
    export default {
        data(){
            return{ 
                list:[],
                cart:[],
                money:0,
                isAllClicked:false,
                clickBox:[],
                needDelete:-1
            }
        },
       
        methods:{
            //获取推荐
            getList(){
                this.axios.get("http://127.0.0.1:3000/maybeLike").then(result=>{
                    this.list=result.data; 
                })
            },
            //获取购物车
           getCart(){
               let info =JSON.parse(sessionStorage.getItem("uname")) ;
               let uid = info.uid;
               this.axios.get("http://127.0.0.1:3000/cart?uid="+uid).then(result=>{
                   this.cart = result.data;
               })
           },
           //点击
           clickItem(index){
               let cartList = this.cart;
               cartList[index].selected = !cartList[index].selected;
               this.getAccounts();
               console.log(cartList[index].selected)
           },
           //加减
           numAdd(e){
               let cid = e.target.dataset.cid;
               for(let c of this.cart){
                   if(c.cid ==cid && c.p_num<999){
                       c.p_num++;
                       this.updateCart(cid,c.p_num);
                       break;
                   }
               }
           },
           numSub(e){
            let cid = e.target.dataset.cid;
               for(let c of this.cart){
                   if(c.cid ==cid && c.p_num>1){
                       c.p_num--;
                       this.updateCart(cid,c.p_num);
                       break;
                   }
               }
           },
           //更新数据库
           updateCart(cid,p_num){
               let url = "http://127.0.0.1:3000/updateCart?cid="+cid+"&p_num="+p_num;
               this.axios.get(url).then((result)=>{
                   if(result.data.code==1){
                   }else{
                       Toast ("系统繁忙,请稍后再试")
                   }
               })
           },
           //计算总和
           getAccounts:function(){
                    let sum = 0
                    for(let item of this.cart){
                        if(item.selected)
                        sum+=item.price*item.p_num;
                    }
                    this.money = sum
                },
                //全选
            clickAll(){
                console.log(this.isAllClicked)
    console.log(this.cart)
                if(this.clickBox.length !== 0 ){
                    this.clickBox = []
                }
                if(this.isAllClicked){
                    this.cart.forEach(singleCart => {
                        console.log(singleCart)
                        this.clickBox.push(singleCart)
                    });
                }
            },
            //删除按钮出现
            changeDelete(){
                this.needDelete = -this.needDelete
            },
            //删除
            deleteIt(){
                
            }  
            
    },
    created(){
                this.getList();
               this.getCart();
            }, 
    // watch:{
    //     singleClick(){
    //        if(this.cart.length == this.clickBox.length){
    //            console.log(this.cart)
    //        }
    //         deep:true
    //     }
    // },
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
/*商品框*/

.cart{
    position: relative;;
    top:-5rem;
    width:100%
}

.cart .mui-card{
    height:13.2rem;
    border-radius:10px;
    

}
.cart .mui-card .mui-card-content{
    height:100%
}
.cart .mui-card .mui-card-content-inner{
    display:flex;
    height:100%;
   padding:8px
}

.check>input{
    width:2rem;
    height:2rem;
    margin-top:3.5rem;
}


.good_pic
{
    width:35%;
    padding:0.5rem
}
.good_pic>img{
    width:100%
}
.good_content{
    width:55%;
    display:flex;
    justify-content: space-between;
    flex-direction: column;
    border-top-right-radius: 10%;
   border-bottom-right-radius: 10%
}
.good_content>p{
    overflow: hidden;
        text-overflow: ellipsis;
        display:-webkit-box; 
        -webkit-box-orient:vertical; 
        -webkit-line-clamp:2; 
}
.good_content>.good_price{
    display: flex;
   
}
.good_content>.good_price>p{
    margin-right:1rem
}

/*你可能喜欢*/
.you-like{
    position: relative;
    top:-4rem;
    border-radius:1%;
}
.you-like .mui-card-content .mui-card-content-inner{
    display:flex;
    flex-wrap: wrap;
    padding:1rem 0 0 0 
}
.you-like>.mui-card-footer>p{
    margin:0 auto
}
.you-like .mui-card-content .mui-card-content-inner div{
    width:13rem;
   
}

.you-like .mui-card-content .mui-card-content-inner div a img{
   margin-left:1rem
}
.you-like .mui-card-content .mui-card-content-inner div a p{
    height:33px;
    overflow:hidden;
    	font-weight: bold;
        white-space:nowrap;
        text-overflow: ellipsis;
        margin-left:1rem
}
.you-like .mui-card-content .mui-card-content-inner div a div p{
    font-size:18px;
   
}
.you-like .mui-card-content .mui-card-content-inner div a div span{
    margin: -0.5rem -0.4rem 0 0 ;
    flex-wrap:wrap;
    width:6rem
}
.you-like .mui-card-content .mui-card-content-inner div:nth-child(2n){
    margin-left:2rem;
}
.you-like .mui-card-content .mui-card-content-inner div a div{
   display:flex;
   justify-content:space-between;
}
/*结算*/
footer,footer .selectAll,footer .accounts{
    display:flex;
    
}
footer{
    justify-content: space-between;
    width:100%;
    position:fixed;
    top:46.6rem;
    left:0rem;
    background:#fff;
    padding:0.5rem 0.6rem 0;
    height:4rem
}

footer .selectAll{
width:30%;

}
footer .selectAll,.accounts div{
    margin-top:0.5rem
}
footer .accounts{
    width:70%
}

.footer_circle input{
    width:1rem;
    height:1rem;
    margin-top:0.3rem
}
footer .selectAll p,.accounts div{
    line-height: 1.5rem
}
footer .selectAll p{
    font-size:15px;
    margin-left:1.3rem
}
.active{
    border-color:rgba(248, 65, 59, 0.842);
}
.active1{
    background:rgba(248, 65, 59, 0.842)
}

.accounts div{
    font-size:15px;
    width:100%;
}
.accounts button{
    background-image:linear-gradient(
        0deg,rgb(224, 143, 143) 0%,rgb(231, 93, 93) 50%,rgba(248, 65, 59, 0.842) 100%);
        color:#fff

}
</style>