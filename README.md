# <center>杜少雄的个人博客代码托管仓库</center>

## 项目已成功部署至阿里云服务器 访问地址 : www.ShaoxiongDu.top

## Github地址: https://github.com/ShaoxiongDu/ShaoxiongDu_Blog (欢迎关注  不定期更新各种项目)

## 一.项目介绍

#### * 项目采用SpringBoot框架 前端采用比较流行的Semantic UI

#### * 分为控制层 业务层 数据持久层 严格按照SpringMVC架构模式开发.

#### * 后端持久层数据库采用MySQL

## 二.部署教程

#### 1.  从github中克隆项目 解压之后,用Java开发工具(推荐Idea)选择maven项目导入  Github地址在文末

#### 2. 修改开发环境(-dev)的配置文件中的数据库信息,确保连接的是自己的数据库  修改datasource下的jpa的ddl为update

#### 3. 运行springboot项目 即可自动在数据库中创建表结构  

#### 4. 手动在user表中插入一条数据  注意密码存储采用MD5加密, 可以使用工具类中的主方法转换.

#### 5. 博客首页访问地址: localhost:80  博客后台登陆页面访问地址 localhost:80/admin

#### 6. 后台添加博客  博客主页刷新即可更新.

##### *注:  如果要修改端口号  主配置文件即可修改

## 三.赞赏
#### 如果觉得这个项目有趣,欢迎请作者喝一杯茶!
 
  ![wechatPay](https://gitee.com/ShaoxiongDu/ShaoxiongDu_Blog/blob/master/src/main/resources/static/images/wechatPay.jpg)
