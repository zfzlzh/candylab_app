<template>
  <div class="app-container">
     <!--头部-->
    
     <!--主体-->
     <router-view></router-view>
     <!--尾部-->
     <nav class="mui-bar mui-bar-tab">
       <router-link class="mui-tab-item mui-active" href="#tabbar" to="/Home" >
         <span class="mui-icon mui-icon-home"></span>
         <span class="mui-tab-label">首页</span>
       </router-link>
       <router-link class="mui-tab-item" href="#tabbar-with-chat" to="/message">
         <span class="mui-icon mui-icon-person"></span>
         <span class="mui-tab-label">消息</span>
       </router-link>
       <router-link class="mui-tab-item" href="#tabbar-with-contact" to="/Cart" >
         <span class="mui-icon mui-icon-extra mui-icon-extra-cart">
                 <span class="mui-badge"></span></span>
         <span class="mui-tab-label">购物车</span>
       </router-link>
       <router-link class="mui-tab-item" href="#tabbar-with-contact" to="/User" >
         <span class="mui-icon mui-icon-search"></span>
         <span class="mui-tab-label">用户中心</span>
       </router-link>
     </nav>
  </div>
 </template>
 <script>
     
     export default {
         data(){
             return{
 
             }
         },
         methods:{
            
         },
         created() {
           
         },
     }
 </script>
 <style>
 .icon {
    width: 1em; height: 1em;
    vertical-align: -0.15em;
    fill: currentColor;
    overflow: hidden;
 }
    .app-container{
      
      padding-bottom:27px;
      overflow-x:hidden;
       /* background-color:#e9561e8f; */
       background:rgba(247, 226, 226, 0.1)
    }
 .app-container .input_bg input{
     width:75%;
     margin-left: 2.5rem;
     margin-top: -1rem;
   
 }
 nav.mui-bar{
     position: fixed
 }
  .mui-bar-tab .mui-tab-item-tao.mui-active {
     color: #007aff;
  }
 .mui-bar-tab .mui-tab-item-tao {
     display: table-cell;
     overflow: hidden;
     width: 1%;
     height: 50px;
     text-align: center;
     vertical-align: middle;
     white-space: nowrap;
     text-overflow: ellipsis;
     color: #929292;
 }
 .mui-bar-tab .mui-tab-item-tao .mui-icon {
     top: 3px;
     width: 24px;
     height: 24px;
     padding-top: 0;
     padding-bottom: 0;
     color:#e12341
 }
 
 .mui-bar-tab .mui-tab-item-tao .mui-icon~.mui-tab-label {
    font-size:11px;
    display:block;
    overflow:hidden;
    text-overflow:ellipsis;
 
 }
 .mui-card,.msg{
    box-shadow:6px 6px 11px rgba(0, 0, 0, .3)
 }
 .mui-card-header{
     color:rgba(0, 0, 0, 0.781);
     font-weight: bold
 }
 </style>
 