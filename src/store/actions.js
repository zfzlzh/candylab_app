//将Vuex对象注册Vue对象，应用mutations
export const setUser=({commit},user)=>{
    commit("userStatus",user)
  }