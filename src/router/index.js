import Vue from 'vue'
import Router from 'vue-router'
import login from '../components/user/login.vue'
import Home from '../components/tabbar/Home.vue'
import User from '../components/tabbar/User.vue'
import reg from '../components/user/reg.vue'
import products from '../components/good/products.vue'
import product_details from '../components/good/product_details.vue'
import comment from '../components/sub/comment.vue'
import Message from '../components/tabbar/Message.vue'
import Cart from '../components/tabbar/Cart.vue'
import userInfo from '../components/user/userInfo.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/',redirect:'/Home'},
    {path:'/Home',component:Home},
    {path:'/products',component:products},
    {path:'/login',component:login},
    {path:'/User',component:User},
    {path:'/reg',component:reg},
    {path:'/product_details',component:product_details},
    {path:'/comment',component:comment,meta:{needLogin:true}},
    {path:'/Message',component:Message,meta:{needLogin:true}},
    {path:'/Cart',component:Cart,meta:{needLogin:true}},
    {path:'/userInfo',component:userInfo,meta:{needLogin:true}}
  ],
  
})
