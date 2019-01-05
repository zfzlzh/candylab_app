<template>
    <div>
         <!--发表评论区域-->
    <textarea placeholder='最多吐槽120个字' maxlength="120" v-model="msg"></textarea>
    <mt-button size="large" @click="postComment">发表评论</mt-button>
    <!--显示评论区域-->
    <div class='cmt-list'>
      <div class='cmt-item'  v-for="item of list" :key="item.id">
        <div class='cmt-info'>
          第{{item.id}}楼：用户名：{{item.user_name}}
          发表时间：{{item.ctime | datatimeFilter}}
          <div class="cmt-body">
            {{item.content}}
          </div>
        </div>
      </div>
    </div>
    <mt-button size="large" @click="getMore">加载更多</mt-button>
    </div>
</template>
<script>
import {Toast} from "mint-ui"
  export default{
    data(){
      return {
        list:[],
        pno:0,
        pageSize:7, //页大小
        pageCount:3, //总页数
        msg:""   //评论内容双向绑定
      }
    },
    methods:{
      postComment(){
        //获取用户输入内容，新闻编号，用户名
        var msg=this.msg;  //评论内容
        var nid=this.id;  //父元素传递新闻编号
        //判断如果评论内容为空
        var size = msg.trim().length;
        if (size==0){
           //提示评论内容不能为空
            Toast("评论内容不能为空");
            return;
        }


        var url = "http://127.0.0.1:3000/addComment";
        var param = `nid=${nid}&content=${msg}`
        this.axios.post(url,param).then(result=>{
          if(result.data.code == 1){
       Toast("评论成功");
       this.pno = 0;
       this.list = [];
       this.getMore();
     }else{
       Toast("评论发表失败")
     }
        })
    },
      getMore(){
        //发送请求获取评论列表
var nid = this.id; //新闻id
this.pno++;   //页码自曾
var pno = this.pno; //当前页码
var pageSize = this.pageSize; //页大小
var url = "getcomment?pno="+pno+"&nid="+nid+"&pageSize="+pageSize;
this.$http.get(url).then(
  result=>{
    console.log(result.body.list)
    var rows = this.list.concat(result.body.data);
    console.log(rows)
    this.list = rows;
  }
); },
    },
    created() {
      this.getMore();
    },
    props:["id"]
  }
</script>
<style scoped>

</style>