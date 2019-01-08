
SET NAMES UTF8;
DROP DATABASE IF EXISTS candy_app;
CREATE DATABASE candy_app CHARSET=UTF8;
USE candy_app;

CREATE TABLE user_info(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32) UNIQUE,
    upwd VARCHAR(32) NOT NULL,
    birth VARCHAR(32),
    email VARCHAR(64),
    gender INT,
    phone VARCHAR(16),
    avatar VARCHAR(125) DEFAULT '',
    nickname VARCHAR(12) DEFAULT '设置昵称'
);

INSERT INTO user_info VALUES(NULL,'leo','z12345678','1998-02-08','zzz@163.com','1','15625354781','http://127.0.0.1:3000/img/avatar/1da.jpg','糖糖糖');


CREATE TABLE candy_lunbo(
    cid INT PRIMARY KEY AUTO_INCREMENT,
       title VARCHAR(32),
      img  VARCHAR(128),
      href VARCHAR(128)
);

INSERT INTO candy_lunbo VALUES(NULL,'轮播1','http://127.0.0.1:3000/img/lunbo/0.jpg','/Home'),
                                (NULL,'轮播2','http://127.0.0.1:3000/img/lunbo/1.jpg','/Home'),
                                (NULL,'轮播3','http://127.0.0.1:3000/img/lunbo/2.jpg','/Home'),
                                (NULL,'轮播4','http://127.0.0.1:3000/img/lunbo/3.jpg','/Home');

CREATE TABLE candy_phone_index(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    pname VARCHAR(40),
    price  DECIMAL(5,2),
    pic  VARCHAR(128),
    hot  INT,
    buyer  SMALLINT
);

INSERT INTO candy_phone_index VALUES
(NULL,'JoyLiving恬乐园新西兰进口麦卢卡儿童棒棒糖','23','http://127.0.0.1:3000/img/index/JoyLiving恬乐园新西兰进口麦卢卡儿童棒棒糖天然润喉.jpg','1000',1040),
(NULL,'Oishi上好佳八宝果糖500g','56','http://127.0.0.1:3000/img/index/Oishi上好佳八宝果糖500g.jpg','700',2220),
(NULL,'UHA悠哈味觉水果汁软糖52g4袋酷露露爆浆零食品橡皮糖果','23','http://127.0.0.1:3000/img/index/UHA悠哈味觉水果汁软糖52g4袋酷露露爆浆零食品橡皮糖果.jpg','6000',5150),
(NULL,'UHA悠哈特浓奶糖牛奶味觉糖500g','28','http://127.0.0.1:3000/img/index/UHA悠哈特浓奶糖牛奶味觉糖500g.jpg','7000',6500),
(NULL,'青旺草莓味西瓜味糖果奶糖水果味儿时怀旧','63','http://127.0.0.1:3000/img/index/watermelon.jpg','150',8400),
(NULL,'一邦迷你款水果切片千纸鹤 手工创意混合切片糖果','23','http://127.0.0.1:3000/img/index/一邦迷你款水果切片千纸鹤 手工创意混合切片糖果.jpg','7500',5346),
(NULL,'上好佳混合口味硬糖500g儿时怀旧','56','http://127.0.0.1:3000/img/index/上好佳混合口味硬糖500g.jpg','3000',2550),
(NULL,'上好佳薄荷糖500g儿时怀旧','18','http://127.0.0.1:3000/img/index/上好佳薄荷糖500g.jpg','1100',1260),
(NULL,'优果奶酥杏仁味奶糖扁桃仁糖奶脆牛奶糖','23','http://127.0.0.1:3000/img/index/优果奶酥杏仁味奶糖扁桃仁糖奶脆牛奶糖.jpg','180',4340),
(NULL,'创意星空星空棒棒糖创意糖果','10','http://127.0.0.1:3000/img/index/创意星空星空棒棒糖.jpg','3000',2650),
(NULL,'加拿大特产天然枫糖块散装硬糖枫叶糖儿童零食进口糖果','23','http://127.0.0.1:3000/img/index/加拿大特产天然枫糖块散装硬糖枫叶糖儿童零食进口糖果.jpg','2750',1840),
(NULL,'千纸鹤水果糖水果味糖果儿时怀旧零食','20','http://127.0.0.1:3000/img/index/千纸鹤水果糖.jpg','1800',1140),
(NULL,'嘉云糖德国原装进口糖果罐装水果糖混合水果味糖小零食','23','http://127.0.0.1:3000/img/index/嘉云糖德国原装进口糖果罐装水果糖混合水果味糖小零食.jpg','14205',13025),
(NULL,'大白兔奶糖500g儿时怀旧零食','36','http://127.0.0.1:3000/img/index/大白兔.jpg','8000',8540),
(NULL,'好利来蒲公英空气巧克力松露巧克力生巧克力礼盒黑巧克力送钢叉','23','http://127.0.0.1:3000/img/index/好利来蒲公英空气巧克力松露巧克力生巧克力礼盒黑巧克力送钢叉.jpg','6850',5856),
(NULL,'徐福记酥心糖380g儿时怀旧零食','20','http://127.0.0.1:3000/img/index/徐福记酥心糖.jpg','6800',5496),
(NULL,'德国糖果嘉云糖进口 嘉云水果糖创意果汁硬糖 966g','23','http://127.0.0.1:3000/img/index/德国糖果嘉云糖进口 嘉云水果糖创意果汁硬糖 966g.jpg','5801',5536),
(NULL,'德芙巧克力礼盒 脆香米牛奶碗装216g大包装批发 休闲零食','35','http://127.0.0.1:3000/img/index/德芙巧克力礼盒 脆香米牛奶碗装216g大包装批发 休闲零食.jpg','1800',1549),
(NULL,'德芙碗装多口味任选礼物巧克力','45','http://127.0.0.1:3000/img/index/德芙碗装多口味任选礼物巧克力.jpg','5860',5230),
(NULL,'日本进口零食网红糖果诺贝尔NOBEL超酸糖柠檬夹心硬糖超级酸酸糖','23','http://127.0.0.1:3000/img/index/日本进口零食网红糖果诺贝尔NOBEL超酸糖柠檬夹心硬糖超级酸酸糖.jpg','5800',5148),
(NULL,'明治meiji 雪吻巧克力 六种口味礼盒装 390g盒 礼品','56','http://127.0.0.1:3000/img/index/明治meiji 雪吻巧克力 六种口味礼盒装 390g盒 礼品.jpg','5899',5499),
(NULL,'春光食品 海南特产 糖果 特制椰子糖 东郊椰林 椰子味 袋 228g','12','http://127.0.0.1:3000/img/index/春光食品 海南特产 糖果 特制椰子糖 东郊椰林 椰子味 袋 228g3.jpg','6858',5450),
(NULL,'歌斐颂黑巧克力85%礼盒装','89','http://127.0.0.1:3000/img/index/歌斐颂黑巧克力85礼盒装.jpg','7853',5490),
(NULL,'法国进口费罗伦十二星座水果味糖果罐装休闲零食','64','http://127.0.0.1:3000/img/index/法国进口费罗伦十二星座水果味糖果罐装休闲零食.jpg','6638',5840),
(NULL,'特价俄罗斯进口kdv巧克力kpokaht紫皮糖年货喜糖果零食品大礼包邮','100','http://127.0.0.1:3000/img/index/特价俄罗斯进口kdv巧克力kpokaht紫皮糖年货喜糖果零食品大礼包邮.jpg','5489',5640),
(NULL,'汇福园玉米糖软糖怀旧糖果小零食','25','http://127.0.0.1:3000/img/index/玉米糖.jpg','7595',6530),
(NULL,'美国Andes安迪士单双层薄荷糖夹心巧克力132g2盒（代可可脂）','56','http://127.0.0.1:3000/img/index/美国Andes安迪士单双层薄荷糖夹心巧克力132g2盒（代可可脂）.jpg','2350',1840),
(NULL,'美国进口 牙米滋yummy earth水果味棒棒糖草莓蓝莓芒果含VC糖果','58','http://127.0.0.1:3000/img/index/美国进口 牙米滋yummy earth水果味棒棒糖草莓蓝莓芒果含VC糖果.jpg','2369',1640),
(NULL,'董氏正宗百草秋梨膏糖清凉薄荷糖润喉糖砂板糖手工怀旧糖果小零食','69','http://127.0.0.1:3000/img/index/董氏正宗百草秋梨膏糖清凉薄荷糖润喉糖砂板糖手工怀旧糖果小零食.jpg','8809',8940),
(NULL,'酷莎无糖薄荷糖清口含片强劲薄荷口香糖老式清凉糖压片糖果零食','12','http://127.0.0.1:3000/img/index/薄荷糖.jpg','3652',3530),
(NULL,'话梅糖怀旧糖果小零食硬糖','15','http://127.0.0.1:3000/img/index/话梅糖.jpg','10259',9540),
(NULL,'进口kinder健达缤纷乐牛奶榛果威化夹心建达巧克力条43g30包','56','http://127.0.0.1:3000/img/index/进口kinder健达缤纷乐牛奶榛果威化夹心建达巧克力条43g30包.jpg','5623',4540),
(NULL,'都市牧场爽口含片无糖薄荷糖口气清新糖柠檬糖果小零食口香糖4瓶','69','http://127.0.0.1:3000/img/index/都市牧场爽口含片无糖薄荷糖口气清新糖柠檬糖果小零食口香糖4瓶.jpg','4256',3540),
(NULL,'酷莎无糖薄荷糖清口含片强劲薄荷口香糖老式清凉糖压片糖果零食','35','http://127.0.0.1:3000/img/index/酷莎无糖薄荷糖清口含片强劲薄荷口香糖老式清凉糖压片糖果零食.jpg',5563,5410),
(NULL,'酷莎有个圈的薄荷糖老式清凉糖果酒店餐厅招待圈圈糖批发','56','http://127.0.0.1:3000/img/index/酷莎有个圈的薄荷糖老式清凉糖果酒店餐厅招待圈圈糖批发500g.jpg','5986',5140),
(NULL,'青旺草莓味西瓜味糖果奶糖水果味20粒20板盒380g儿时怀旧零食','36','http://127.0.0.1:3000/img/index/青旺草莓味西瓜味糖果奶糖水果味20粒20板盒380g儿时怀旧零食.jpg','3265',2540),
(NULL,'风车糖','10','http://127.0.0.1:3000/img/index/风车糖.jpg','2356',1540),
(NULL,'马来西亚进口水果糖果 Victory Fruit果超软糖','50','http://127.0.0.1:3000/img/index/马来西亚进口水果糖果 Victory Fruit果超软糖 .jpg','1235',1000);

CREATE TABLE details_pic(
    did INT PRIMARY KEY AUTO_INCREMENT,
    pid INT,
    pic VARCHAR(125)
    );
INSERT INTO details_pic VALUES(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/1.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/2.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/3.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/4.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/5.jpg");

CREATE TABLE details_title(
    tid INT PRIMARY KEY AUTO_INCREMENT,
    pid INT,
    title VARCHAR(100),
    price DECIMAL(5,2),
    sale  INT,
    free  VARCHAR(20),
    place VARCHAR(20),
    favour VARCHAR(20),
    serve   VARCHAR(30)
);
INSERT INTO details_title VALUES(NULL,13,"嘉云糖德国原装进口糖果罐装水果糖混合水果味糖小零食",23,5536,"免运费","江苏南通","满100减10券","快递险||七天包退");

CREATE TABLE details_info(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  pid INT,
  pic VARCHAR(125)
);
INSERT INTO details_info VALUES(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/info/1.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/info/2.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/info/3.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/info/4.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/info/5.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/info/6.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/info/7.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/info/8.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/info/9.jpg"),
(NULL,13,"http://127.0.0.1:3000/img/details/cavendish/info/10.jpg");

CREATE TABLE details_para(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  pid INT,
  info VARCHAR(50)
);
INSERT INTO details_para VALUES(NULL,13,"储藏方法：阴凉干燥处，避免高温阳光直射，密封"),
(NULL,13,"地址：德国嘉云食品有限公司"),
(NULL,13,"生产日期：2018-04-09"),
(NULL,13,"产品编号：4013197767010"),
(NULL,13,"联系方式：372-7352227"),
(NULL,13,"配料表：葡萄糖浆，白砂糖，天然果汁，低糖粉"),
(NULL,13,"保质期：1080天"),
(NULL,13,"国家：德国"),
(NULL,13,"种类：硬质糖果"),
(NULL,13,"品牌：Cavendish&Harvey/嘉云（德国）"),
(NULL,13,"净含量：200g/966g");


CREATE TABLE details_comment(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  pid INT,
  content VARCHAR(250),
  avatar VARCHAR(120),
  who VARCHAR(10)
);
INSERT INTO details_comment VALUES(NULL,13,"很好吃的糖果，收藏了，吃完再来买,非常推荐","http://127.0.0.1:3000/img/avatar/1.jpg","tom");

CREATE TABLE details_taste(
  ttid INT PRIMARY KEY AUTO_INCREMENT,
  pid INT,
 taste VARCHAR(10),
 small_pic VARCHAR(125),
 price DECIMAL(5,2)
);
INSERT INTO details_taste VALUES(NULL,13,"3种口味混搭随机发","http://127.0.0.1:3000/img/details/cavendish/taste/1.jpg",60),
(NULL,13,"5中口味混搭随机发","http://127.0.0.1:3000/img/details/cavendish/taste/2.jpg",100),
(NULL,13,"7种口味混搭随机发","http://127.0.0.1:3000/img/details/cavendish/taste/3.jpg",150),
(NULL,13,"全口味礼包","http://127.0.0.1:3000/img/details/cavendish/taste/3.jpg",420),
(NULL,13,"热带果香味","http://127.0.0.1:3000/img/details/cavendish/taste/4.jpg",23),
(NULL,13,"薄荷味","http://127.0.0.1:3000/img/details/cavendish/taste/5.jpg",23),
(NULL,13,"西柚味","http://127.0.0.1:3000/img/details/cavendish/taste/6.jpg",23),
(NULL,13,"草莓味 175g","http://127.0.0.1:3000/img/details/cavendish/taste/7.jpg",23),
(NULL,13,"黑莓梨味","http://127.0.0.1:3000/img/details/cavendish/taste/8.jpg",23),
(NULL,13,"可乐味","http://127.0.0.1:3000/img/details/cavendish/taste/9.jpg",23),
(NULL,13,"酸柠檬味","http://127.0.0.1:3000/img/details/cavendish/taste/10.jpg",23),
(NULL,13,"四季果味","http://127.0.0.1:3000/img/details/cavendish/taste/11.jpg",23),
(NULL,13,"苹果味","http://127.0.0.1:3000/img/details/cavendish/taste/12.jpg",23),
(NULL,13,"香橙味","http://127.0.0.1:3000/img/details/cavendish/taste/13.jpg",23),
(NULL,13,"樱桃味","http://127.0.0.1:3000/img/details/cavendish/taste/14.jpg",23),
(NULL,13,"芒果猕猴桃味","http://127.0.0.1:3000/img/details/cavendish/taste/15.jpg",23),
(NULL,13,"桑果什锦味 175g","http://127.0.0.1:3000/img/details/cavendish/taste/16.jpg",23),
(NULL,13,"柠檬西柚味","http://127.0.0.1:3000/img/details/cavendish/taste/17.jpg",23),
(NULL,13,"冰爽味","http://127.0.0.1:3000/img/details/cavendish/taste/18.jpg",23),
(NULL,13,"香草味 175g","http://127.0.0.1:3000/img/details/cavendish/taste/19.jpg",23),
(NULL,13,"维他命夹心味 175g","http://127.0.0.1:3000/img/details/cavendish/taste/20.jpg",23),
(NULL,13,"新版什锦味","http://127.0.0.1:3000/img/details/cavendish/taste/11.jpg",23),
(NULL,13,"咖啡味 175g","http://127.0.0.1:3000/img/details/cavendish/taste/14.jpg",23),
(NULL,13,"樱桃味","http://127.0.0.1:3000/img/details/cavendish/taste/16.jpg",23),
(NULL,13,"无糖什锦味 175g","http://127.0.0.1:3000/img/details/cavendish/taste/12.jpg",23),
(NULL,13,"杂果味（覆盆子，草莓，苹果，柠檬，香橙）","http://127.0.0.1:3000/img/details/cavendish/taste/21.jpg",60);