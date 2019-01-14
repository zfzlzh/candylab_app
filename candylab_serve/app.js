//1:加载模块 express pool
const express = require("express");
const pool = require("./pool");
const bodyParser=require("body-parser")

//2:创建express对象
let app = express();
//2.1:加载跨域访问组件
const cors = require("cors");
//2.2:配置允许脚手架访问程序
app.use(cors({
    origin:["http://127.0.0.1:3001",
    "http://localhost:3001"],
    credentials:true
}));
app.use(bodyParser.urlencoded({
  extended:false
}))
//加载第三方模块express session
const session=require("express-session")
//配置模块
app.use(session({
  secret:"128位随机字符",  //安全字符串
  resave:false,     //请求保存
  saveUninitialized:true, //初始化保存
  cookie:{
    maxAge:1000 * 60 * 60 * 24
  }
}))
//3:指定监听端口3000
app.listen(3000);
//4:指定静态目录 public
// __dirname 当前程序所属目录绝对路径 
//app.js vue_app_server
app.use(express.static(__dirname+"/public"))


//查询获取首页轮播图
app.get('/carousel',(req,res)=>{
  let sql="SELECT cid,img,href FROM candy_lunbo";
  pool.query(sql,[],(err,result)=>{
    if (err) throw err;
    res.send(result)
  })
})
//查询获取首页猜您喜欢
app.get('/maybeLike',(req,res)=>{
  let sql=`SELECT pid,pname,price,pic,hot,buyer FROM candy_phone_index WHERE hot!=0 ORDER BY hot DESC`;
pool.query(sql,(err,result)=>{
    if (err) console.log (err);
res.send(result);
})
})
//登陆
app.get('/login',(req,res)=>{
  let uname =req.query.uname;
  let upwd = req.query.upwd;
  let sql="SELECT uid,uname,upwd,avatar,nickname FROM user_info WHERE uname = ? AND upwd = ?";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if (err) throw err;
    if(result.length>0){
      req.session.uname = uname;
      res.send(result)
    }else{
      res.send({code:0,msg:"密码或用户名错误"})
    }
  })
})

//获取注册信息
//对比用户名
app.get('/findUser',(req,res)=>{
  let uname = req.query.uname;
  if(!uname){
    res.send({code:2,msg:"用户名不能为空"});
    return;
  }
  let sql = "SELECT uname FROM user_info WHERE uname = ?";
  pool.query(sql,[uname],(err,result)=>{
    if (err) throw err;
    if(result.length>0){
      res.send({code:0,msg:"用户名已存在"})
    }else{
      res.send({code:1})
    }
  })
})
//注册
app.post('/reg',(req,res)=>{
  let obj=req.body;
  let $uname=obj.uname;
  let $upwd=obj.upwd;
  let $birth=obj.birth;
  let $email=obj.email;
  let $gender=obj.gender;
  let $phone=obj.phone;
  if (!$uname){
      res.send({code:"non",msg:"用户名不能为空"});
      return;
  }
  if (!$upwd){
    res.send({code:"nop",msg:"密码不能为空"});
    return;
}
  if(!$email){
      res.send({code:"noe",msg:"邮箱不能为空"});
      return;
  };
  let sql = "INSERT INTO `user_info`(`uid`,`uname`,`upwd`, `birth`, `email`, `gender`, `phone`) VALUES (NULL,?,?,?,?,?,?)"
  pool.query(sql,[$uname,$upwd,$birth,$email,$gender,$phone],(err,result)=>{
      if (err) throw err;
      if (result.affectedRows>0){
          res.send({code:1,msg:"注册成功"})
      }else{
        res.send({code:0,msg:"信息内容或格式有误"})
      }
  })
})
//产品详情页获取信息
app.get("/details",(req,res)=>{
  let output={
    pic:[],
    title:[],
    info:[],
    para:[],
    comment:[],
    taste:[]
  }
  let $pid=req.query.pid;
  // pic
  let d_sql="SELECT did,pic FROM details_pic WHERE pid=?";
  pool.query(d_sql,[$pid],(err,pic)=>{
    if(err) throw err;
    output.pic=pic;
    //title
    let t_sql = "SELECT tid,title,price,sale,free,place,favour,serve FROM details_title WHERE pid=?";
    pool.query(t_sql,[$pid],(err,title)=>{
      output.title=title;

      //info
      let i_sql = "SELECT iid,pic FROM details_info WHERE pid=?";
      pool.query(i_sql,[$pid],(err,info)=>{
      output.info=info;
      //para
          
      let p_sql = "SELECT aid,info FROM details_para WHERE pid=?";
    pool.query(p_sql,[$pid],(err,para)=>{
      output.para=para;

      //comment
      let c_sql = "SELECT cid,content,avatar,who FROM details_comment WHERE pid=?";
      pool.query(c_sql,[$pid],(err,comment)=>{
      output.comment=comment;
     //taste
     let tt_sql = "SELECT ttid,taste,small_pic,price FROM details_taste WHERE pid=?";
      pool.query(tt_sql,[$pid],(err,taste)=>{
      output.taste=taste;
      res.send(output);
      })
    })
    })
  })})
  })
})
//购物车
app.get("/cart",(req,res)=>{
  let uid = req.query.uid;
  let c_sql="SELECT cid,title,price,p_num,pic,taste,day FROM candy_cart WHERE uid=?";
  pool.query(c_sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})
//购物车数量更新
app.get("/updateCart",(req,res)=>{
  let cid= req.query.cid;
  let p_num = req.query.p_num;
  let u_sql="UPDATE candy_cart SET p_num = ? WHERE cid=?"
  pool.query(u_sql,[p_num,cid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows > 0){
      res.send({code:1});
     }else{
      res.send({code:-1});
     }
  })
})
//未评论
app.get("/not_say",(req,res)=>{
  let uid=req.query.uid;
  console.log(uid)
  let b_sql="SELECT bid,pid,pname,price,taste,pic,buy_time FROM candy_buy WHERE uid=? ORDER BY buy_time";
  pool.query(b_sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})
app.get("/comment",(req,res)=>{
  let pid=req.query.pid;
  let co_sql="SELECT bid,uid,pname,pic FROM candy_buy WHERE pid=?";
  pool.query(co_sql,[pid],(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})