import Vue from 'vue'
import Vuex from 'vuex'
import * as getters from './getters'
import * as mutations from './mutations'
import * as actions from './actions'

Vue.use(Vuex)
//创建Vuex实例对象
const store = new Vuex.Store({
    //定义状态
    state:{
      cartCount:0,   //购物车中商品的数量
      isLogin:false,
      uname:"",
      currentUser:null,//当前用户
      
    },
    getters,
    mutations,
    actions
})
export default store