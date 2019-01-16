<template>
    <div>
      <header class="header">
        <div>
          <div @click="back">
              <a><span class="mui-icon mui-icon-undo"></span></a>
              <p>发表评论</p>
          </div>
          <div @click="sendComment">
            发布
          </div>
        </div>
      </header>
      <section>
          <div class="mui-card send">
              <div class="mui-card-header title">
                  <div><img :src="list[0].pic" alt=""></div>
                  <div>{{list[0].pname}}</div>
                  <!-- :class=" { ' on ' : cur >= n } " 含义是当cur >= n成立的时候把 on 赋给元素的 class 属性 -->
                  <div><p><svg class="icon" aria-hidden="true" v-for="n of 5" :class="{'on':cur1 >= n}" @click="selectStar1(n)">
                    <use xlink:href="#icon-xingxing"></use>
                  </svg></p></div>
              </div>
              <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <textarea placeholder='最多吐槽120个字' maxlength="120" v-model="content"></textarea>
                    <div class="camera">
                        <div><svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-shexiangji
                            "></use>
                          </svg><p>添加视频</p></div>
                        <div><svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-zhaoxiangji"></use>
                          </svg><p>添加图片</p></div>
                    </div>
                </div>
              </div>
              <div class="mui-card-footer no-name">
                <div><i></i><p>匿名</p></div>
                <div>你的评价能帮到其他的小伙伴哦</div>
              </div>
            </div>
            <div class="mui-card score">
                <div class="mui-card-header">评价</div>
                <div class="mui-card-content">
                  <div class="mui-card-content-inner">
                    <div><p>服务评价</p><p><svg class="icon" aria-hidden="true" v-for="n of 5" :class="{'in':cur2 >= n}" @click="selectStar2(n)">
                      <use xlink:href="#icon-xingxing"></use>
                    </svg></p></div>
                    <div><p>物流评价</p><p><svg class="icon" aria-hidden="true" v-for="n of 5" :class="{'up':cur3 >= n}" @click="selectStar3(n)">
                      <use xlink:href="#icon-xingxing"></use>
                    </svg></p></div>
                  </div>
                </div>
              </div>
      </section>
    </div>
</template>
<script>
import {Toast} from "mint-ui"
import qs from 'qs'
  export default {
    data(){
      return {
        list:[{items:"加载中...",text:"加载中..."}],
       content:"",   //评论内容双向绑定
       cur1:-1,
       cur2:-1,
       cur3:-1
       
      }
    },
    methods:{
      back(){
            this.$router.go(-1)
            },
      getInfo(){
          let pid=this.$route.query.pid;
          this.axios.get("http://127.0.0.1:3000/comment?pid="+pid).then(
            result=>{
              this.list = result.data;
                }
              )
            },
      sendComment(){
          let user =JSON.parse(sessionStorage.getItem("uname")) ;
          let uid= user.uid;
          let uname = user.uname;
          let avatar = user.avatar;
          let pid=this.$route.query.pid;
          let content = this.content
          this.axios.post("http://127.0.0.1:3000/sendCom",qs.stringify({uname,uid,avatar,pid,content},{headers:{"Content-Type": "application/x-www-form-urlencoded;charset=utf-8"}})).then(result=>{
                if(result.data.code == 1){
                  let isSend = 1;
                  this.axios.get("http://127.0.0.1:3000/ready_say?isSend="+isSend+'&pid='+pid+'&uid='+uid).then(result=>{
                    if(result.data.code ==1){
                      Toast(result.data.msg)
                    this.$router.go(-1)
                    }
                   
                  })
                }else{
                  Toast("评论失败")
                }
          })
      },
      selectStar1(n){
        this.cur1 = n
      },
      selectStar2(n){
        this.cur2 = n
      },
      selectStar3(n){
        this.cur3 = n
      }
    },
    created() {
    this.getInfo();
    },
  }
</script>
<style scoped>
 
  /* 头 */
  header{
    background:#f55550
  }
  header>div{
    display:flex;
    justify-content: space-between;
    width:85%
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
    /* 商品信息 */
    .send{
      margin:0rem;
    }
    .mui-card-content-inner{
      padding:0rem 0 1rem
    }
   .title{
     height:5rem
   }
   .title>div:first-child{
     width:27%;
     height:100%
   }
   .title div img{
     padding-left:1rem;
     width:70%;
     height:100%;
   }
   .title>div:nth-child(2){
    overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        width:9rem;
        margin-left:-2rem
   }
   .title>div:nth-child(3){
     width:44%
   }
   .title>div:nth-child(3)>p>svg{
     margin: 0.2rem 0 0 0.5rem
   }
   svg.on{
     fill:#f55550
   }
   svg.in{
     fill:#f55550
   }
   svg.up{
     fill:#f55550
   }
    /* 输入框 */
    textarea{
      height:9rem;
      border:1px solid rgba(68, 68, 68, 0.13)
    }
    /* 图片视屏 */
    .camera{
      display:flex;
    }
    .camera>div{
  width:6rem;
  height:6rem;
  margin-left:1rem;
  text-align: center;
  border:1px dotted #f5555040;
  padding:0.5rem
 
      }
    .camera>div>svg{
      width:3rem;
      height:3rem;
      color:#f55550
    }
    /* 匿名 */
    .no-name{
      display:flex;
    }
    .no-name>div:first-child{
      display:flex;
      width:49%
    }
    .no-name>div{
      margin-top:0.5rem
    }
    .no-name>div>i{
      display:inline-block;
      border:1px solid #000;
      border-radius:50%;
      width:1.5rem;
      height:1.5rem
    }
    .no-name>div:first-child>a{
      border:1px solid rgb(231, 61, 61);
      border-radius: 50%;
      height:1.8rem;
      width:1.8rem;
      text-align: center
    }
    .no-name>div:first-child>a>span{
      color:#f55550;
    }
    .no-name>div:first-child>p{
      margin-left:1rem;
      font-size:22px;
      line-height: 1.8rem
    }
    .no-name>div:last-child{
      font-size:10px
    }
    /* 评分 */
    .score{
      margin:1rem 0 0
    }
    .score .mui-card-header{
      font-weight: bold;
      color:rgba(0, 0, 0, 0.719)
    }
    .score .mui-card-content-inner{
    padding:1rem 0 0.4rem
    }
    .score .mui-card-content-inner>div{
      display:flex
    }
.score .mui-card-content-inner>div>p{
  font-size:17px
}
.score .mui-card-content-inner>div>p>svg,.title div svg{
  width:2rem;
  height:2rem;
  margin:-0.5rem 0 0 1rem
}
</style>