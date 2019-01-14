<template>
    <div>
        <header class="header">
            <div>
              <div @click="back">
                  <a><span class="mui-icon mui-icon-undo"></span></a>
                  <p>待评论</p>
              </div>
            </div>
            <p>
                共{{buy_list.length}}个商品未评价
            </p>
          </header>
          <section>
            <div class="mui-card not_say" v-for="item of buy_list" :key="item.bid">
                <router-link :to="{path:'/comment',query:{pid:item.pid}}">
				<div class="mui-card-header">{{item.buy_time | filterDate}}</div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<div><img :src="item.pic" alt=""></div>
                        <div>
                            <p>{{item.pname}}</p>
                            <p>{{item.taste}}</p>
                            <p>￥{{item.price | filterMoney}}</p>
                        </div>
					</div>
                </div>
            </router-link>
			</div>
          </section>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                buy_list:[]
            }
        },
        methods:{
            back(){
                this.$router.go(-1)
            },
            getBuy(){
                let uid =JSON.parse(sessionStorage.getItem("uname")).uid;
                let b_url = "http://127.0.0.1:3000/not_say?uid="+uid;
                this.axios.get(b_url).then(
                    result=>{
                        this.buy_list = result.data
                    }
                )

            },
        },
        created() {
                this.getBuy();
            },
    }
</script>
<style scoped>
/* 头 */
header{
    background-image:linear-gradient(
        0deg,rgb(224, 143, 143) 0%,rgb(231, 93, 93) 50%,rgba(248, 65, 59, 0.842) 100%);
    padding:0.5rem;
    height:15.2rem
  }
  header>div{
    display:flex;
    justify-content: space-between;
  }
 header>div>div{
        display: flex;
        padding-top:0.5rem;
       color:#fff
    }
    header>div>div>p,header>div>div>a>span{
        font-size:18px;
        color:#fff;
        margin-left:0.2rem
    }
    header>p{
        font-size:17px;
        margin-top:2rem;
        color:#fff
    }
    /* 商品 */
    .not_say{
    position: relative;;
    top:-5rem;
    height:14.2rem;
    border-radius:10px;
}
.not_say .mui-card-content-inner{
    display:flex;
    height:100%;
   padding:8px
}

.not_say .mui-card-content-inner>div:first-child
{
    width:35%;
    padding:0.5rem
}
.not_say .mui-card-content-inner>div:first-child img{
    width:100%;
   
}
.not_say .mui-card-content-inner>div:nth-child(2){
    width:55%;
    display:flex;
    justify-content: space-between;
    flex-direction: column;
    border-top-right-radius: 10%;
   border-bottom-right-radius: 10%
}
.not_say .mui-card-content-inner>div:nth-child(2)>p{
    overflow: hidden;
        text-overflow: ellipsis;
        display:-webkit-box; 
        -webkit-box-orient:vertical; 
        -webkit-line-clamp:2; 
}
</style>