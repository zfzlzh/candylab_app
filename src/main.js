import Vue from 'vue'
import App from './App.vue'
import router from './router'
import icons from './assets/icon/iconfont.js'
import icons_user from './assets/icon/user_iconfont.js'
import icons_info from './assets/icon/info_iconfont.js'
import star from './assets/icon/star.js'
import rightOrWrong from './assets/icon/rightOrWrong.js'
import camera from './assets/icon/camera.js'
import tab from './assets/icon/tabbar.js'
import store from './store/store.js'
import {Toast} from "mint-ui";
import filterMoney from './components/commentJs/filterMoney.js';
import filterDate from './components/commentJs/filterDate.js';
import Mui from 'vue-awesome-mui'
import 'vue-awesome-mui/mui/dist/css/mui.css'
import "vue-awesome-mui/mui/examples/hello-mui/css/icons-extra.css"

Vue.use(Mui)
Vue.config.productionTip = false
Vue.filter("filterMoney",filterMoney)
Vue.filter("filterDate",filterDate)




// //引入Vuex
// import Vuex from "vuex"
// //注册Vuex组件
// Vue.use(Vuex)
// //创建Vuex实例对象
// var store = new Vuex.Store({
//   state:{
//     cartCount:0,   //购物车中商品的数量
//     isLogin:false,
//     uname:"",
//     currentUser:null,//当前用户
    
//   },
//   mutations:{//修改共享数据的方法
//     increment(state,count){state.cartCount+=count},
//     substract(state){state.cartCount--},
//     clear(state){state.cartCount = 0},
//     userStatus(state,user){
//       if(user){
//         state.currentUser=user;
//         state.isLogin = true;
       
//       }else if(user==null){
//         sessionStorage.setItem("uname","");
//         state.currentUser = null;
//         state.isLogin = false;
        
//       }
//     }
//   },
//   getters:{//获取共享数据方法
//     optCartCount:function(state){
//     return state.cartCount;
//   },
//   isLogin:function(state){
//    return state.isLogin
//   },
//   currentUser:function(state){
//   return  state.currentUser
//   }
// },
// //将Vuex对象注册Vue对象
//  actions:{
//    setUser({commit},user){
//      commit("userStatus",user)
//    }
//  }

// })

//sessionstorage
router.beforeEach((to,from,next)=>{
 if(to.meta.needLogin){
   if(sessionStorage.getItem('uname')){
    next()
  }else{
Toast("您未登录，请先登陆")
setTimeout(function(){
  next('/login')
},1000)
    
  }
 }else{
   next();
 }
 
})




//1、引入mint-ui Header组件
import {Header,Swipe,SwipeItem,Button,} from "mint-ui"
//2、注册Header组件
Vue.component(Header.name,Header);
//3、注册Swipe,SwipeItem组件
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
Vue.component(Button.name,Button);


//3.1引入axios库（VueResource）
import axios from "axios"
//3.2跨域保存session值
axios.defaults.withCredentials=true
//3.3注册组件
Vue.prototype.axios=axios

//4.引入vueresource库
import VueResourse from 'vue-resource';
//5.注册vueresource库
Vue.use(VueResourse);


// //7.创建日期类型过滤器
// //val原先日期对象
// Vue.filter('datatimeFilter',function(val){
//   //7.1创建日期对象
//   var data=new Date(val)
//   //7.2获取年月日分秒
//   var y=data.getFullYear();
//   var m=data.getMonth()+1;
//   var d=data.getDate();
//   var h=data.getHours();
//   var mi=data.getMinutes();
//   var s=data.getSeconds();
//   //7.3月日格式判断07 08 09 10
//   if(m<10){m='0'+m;}
//   if(d<10){d='0'+d;}
//   //7.4拼接字符串返回
//   return `${y}-${m}-${d} ${h}:${mi}:${s}`;
// })


new Vue({
  router,
  render: h => h(App),
  store
}).$mount('#app')

