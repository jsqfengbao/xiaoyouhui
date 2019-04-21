# 全国微信小程序前后端全套程序

#### 介绍
全国微信小程序前后端全套程序，包含接口部分-taoliyuan
前端部分
管理台前后端部分
现在已投产运行
由于和运营人员合作意见分歧很大，代码是我全程开发的，大概5个月时间。现在开源出来供广大爱好者交流分享

欢迎广大爱好者私聊-共同合作开发运营，可以加楼主QQ：7727-57-263
也可以加QQ群交流 704802627

#### 软件架构
软件架构说明
项目中有五个工程，下面分别介绍进行说明
taoliyuan:小程序接口部分，包含了校友汇、活动、新闻、公司、社区、个人信息等模块
taoliyuanManager：校友会管理台部分，能对校友会成员信息进行审核及多个分会进行管理。
taoliyuanFront:校友会管理台前端部分，和taoliyuanManager进行统一管理。
xiaochengxu-taoliyuan:微信小程序部分，采用微信原生语言进行开发
renren-generator：这个工程是管理台自动生成代码的插件，管理台自动生成能够省略70%的代码开发部分。
db:数据库使用的是Mysql数据库，安装taoliyuan.sql里面有结构文件和初始化操作数据。


#### 安装教程

1. 下载taoliyuan部分，先安装mysql导入数据库taoliyuan.sql文件
2、taoliyuan接口部分采用的是SpringMVC框架进行的开发，配置好Tomcat
3、xiaochengxu-taoliyuan:导入到微信开发工具，配置好连接，自己可以看到下面的运行效果图
4、同理其他两个工程也是这样的操作。
taoliyuanManager,taoliyuanFront是采用SpringBoot和Vue进行的开发，使用renren-fast和renren-fast-vue管理台进行的二次开发。

#### 使用说明

1. 搭建好后，运行管理台，帐号密码是admin   admin
2. 配置学校参数、地区参数、菜单参数等信息
3. 配置好以后看到的效果图：
下面分别是小程序首页信息,社区的板块页面,校友分会页面
![Image text](https://gitee.com/mobilesec110/xiaoyouhui/raw/master/imagePic/2.jpg)
![Image text](https://gitee.com/mobilesec110/xiaoyouhui/raw/master/imagePic/1.jpg)
![Image text](https://gitee.com/mobilesec110/xiaoyouhui/raw/master/imagePic/3.jpg)
下面是校友汇地图页面，可以在这里找到全国的校友位置及信息：
![Image text](https://gitee.com/mobilesec110/xiaoyouhui/raw/master/imagePic/4.jpg)

#### 参与贡献

1. Fork 本仓库
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request


#### 码云特技

1. 使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2. 码云官方博客 [blog.gitee.com](https://blog.gitee.com)
3. 你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解码云上的优秀开源项目
4. [GVP](https://gitee.com/gvp) 全称是码云最有价值开源项目，是码云综合评定出的优秀开源项目
5. 码云官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6. 码云封面人物是一档用来展示码云会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)


#### 打赏：
如果你觉得对你有用，打赏下作者吧：                                                     
![Image text](https://gitee.com/mobilesec110/xiaoyouhui/raw/master/imagePic/5.png)
![Image text](https://gitee.com/mobilesec110/xiaoyouhui/raw/master/imagePic/6.png)
![Image text](https://gitee.com/mobilesec110/xiaoyouhui/raw/master/imagePic/7.png)