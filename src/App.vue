<template>
  <div class="app-container">
     <!--头部-->
    
     <!--主体-->
     <router-view></router-view>
     <!--尾部-->
     <div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default "
      id="">
      <ul class="am-navbar-nav am-cf am-avg-sm-4">
          <li :data-id=0 @click="changeColor" >
            <router-link to="/Home" >
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-geren1"></use>
                  </svg>
                <span class="am-navbar-label">首页</span>
            </router-link>
          </li>
          <li :data-id=1 @click="changeColor">
            <router-link to="/message"   >
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-xiaoxi"></use>
                  </svg>
                <span class="am-navbar-label">消息</span>
            </router-link>
          </li>
          <li :data-id=2   @click="changeColor">
            <router-link to="/Cart"  >
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-gouwuche"></use>
                  </svg>
                <span class="am-navbar-label">购物车</span>
            </router-link>
          </li>
          <li >
            <router-link to="/User">
                <svg class="icon" aria-hidden="true" >
                    <use xlink:href="#icon-morentouxiang"></use>
                  </svg>
                <span class="am-navbar-label">用户</span>
            </router-link>
          </li>
      </ul>
  </div>
    
  </div>
 </template>
 <script>
     
     export default {
         data(){
             return{
                hasActive:-1
             }
         },
         methods:{
            changeColor(){
                this.hasActive =-this.hasActive;
                console.log(1)
            }
         },
         created() {
           
         },
       mounted() {
 
       },
        
     }
 </script>
 <style>
       * { touch-action: none; } 
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
 .am-navbar{
     height:5rem;
 }
 .am-navbar>.am-navbar-nav{
    background:#fff;
    
 }
 .am-navbar>.am-navbar-nav>li>a>span{
     font-size:15px
 }
 .am-navbar>.am-navbar-nav>li>a>svg{
     width:2rem;
     height:2rem;
 }
 .am-navbar>.am-navbar-nav>li>a{
     padding:0.5rem;
   color:rgb(209, 40, 40);
   
 }

 </style>
 