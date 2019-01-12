<template>
    <div>
      <header class="header">
        <div>
          <div @click="back">
              <a><span class="mui-icon mui-icon-undo"></span></a>
              <p>发表评论</p>
          </div>
          <div>
            发布
          </div>
        </div>
      </header>
      <section>
          <div class="mui-card send">
              <div class="mui-card-header title">
                  <div><img src="" alt=""></div>
                  <div><svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-xingxing"></use>
                  </svg></div>
              </div>
              <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <textarea placeholder='最多吐槽120个字' maxlength="120" v-model="msg"></textarea>
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
                <div><a><span class="mui-icon mui-icon-checkmarkempty"></span></a><p>匿名</p></div>
                <div>你的评价能帮到其他的小伙伴哦</div>
              </div>
            </div>
            <div class="mui-card score">
                <div class="mui-card-header">评价</div>
                <div class="mui-card-content">
                  <div class="mui-card-content-inner">
                    <div><p>服务评价</p><p><svg class="icon" aria-hidden="true">
                      <use xlink:href="#icon-xingxing"></use>
                    </svg></p></div>
                    <div><p>物流评价</p><p><svg class="icon" aria-hidden="true">
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
  export default{
    data(){
      return {
        list:[],
        msg:""   //评论内容双向绑定
      }
    },
    methods:{
      back(){
                this.$router.go(-1)
            },
    },
    created() {
     
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
     height:4rem
   }
   .title>div:first-child{
     width:30%
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