//修改共享数据的方法
//登陆
export const  userStatus=(state,user)=>{
    if(user){
      state.currentUser=user;
      state.isLogin = true;
     
    }else if(user==null){
        //登出的时候清除sessionstorage里的数据
      sessionStorage.setItem("uname","");
      state.currentUser = null;
      state.isLogin = false;
      
    }
  }
//购物车
export const increment=(state,count)=>{state.cartCount+=count}

export const substract=state=>{state.cartCount--}

export const clear=state=>{state.cartCount = 0}