

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appreciation` bit(1) NOT NULL,
  `commentabled` bit(1) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `views` int(11) NULL DEFAULT NULL,
  `type_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK292449gwg5yf7ocdlmswv9w4j`(`type_id`) USING BTREE,
  INDEX `FK8ky5rrsxh01nkhctmo7d48p82`(`user_id`) USING BTREE,
  CONSTRAINT `FK292449gwg5yf7ocdlmswv9w4j` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES (4, b'1', b'1', '# Linux使用Yum安装Java开发环境\r\n\r\n##前言\r\nlinux上安装软件，可以用yum非常方便，不需要下载解压，也不需要配置环境变量,一个指令就能用yum安装java。\r\n\r\n一般项目部署的时候,是一个.jar后缀的文件，此文件是是依赖于java环境的，所以本篇文章来介绍一下如何使用Yum在Linux系统(此文用CentOS7来举例)中安装Java开发环境.\r\n#### 资源准备\r\n	Linux系统(CentOS7)\r\n	Yum 3.4.3\r\n##yum环境的安装\r\n####1.yum介绍\r\nyum（全称为 Yellow dog Updater, Modified）是一个在Fedora和RedHat以及CentOS中的Shell前端软件包管理器。\r\n基于RPM包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软件包，无须繁琐地一次次下载、安装。\r\n#### 2.检查是否已经安装Java\r\n```shell\r\nrpm -qa | grep java\r\n```\r\n如果没有java环境的话，接着就去查找java-1.8.0的可以使用的安装包：\r\n```shell\r\nyum list | grep java-1.8.0-openjdk\r\n```\r\n结果\r\n```shell\r\n[root@yoyo ~]# yum list | grep java-1.8.0-openjdk\r\njava-1.8.0-openjdk.i686                  1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk.x86_64                1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-accessibility.i686    1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-accessibility.x86_64  1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-accessibility-debug.i686\r\njava-1.8.0-openjdk-accessibility-debug.x86_64\r\njava-1.8.0-openjdk-debug.i686            1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-debug.x86_64          1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-demo.i686             1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-demo.x86_64           1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-demo-debug.i686       1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-demo-debug.x86_64     1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-devel.i686            1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-devel.x86_64          1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-devel-debug.i686      1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-devel-debug.x86_64    1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-headless.i686         1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-headless.x86_64       1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-headless-debug.i686   1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-headless-debug.x86_64 1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-javadoc.noarch        1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-javadoc-debug.noarch  1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-javadoc-zip.noarch    1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-javadoc-zip-debug.noarch\r\njava-1.8.0-openjdk-src.i686              1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-src.x86_64            1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-src-debug.i686        1:1.8.0.191.b12-1.el7_6       updates  \r\njava-1.8.0-openjdk-src-debug.x86_64      1:1.8.0.191.b12-1.el7_6       updates  \r\n```\r\n安装java-1.8.0-openjdk所有的文件\r\n```shell\r\nyum -y install java-1.8.0-openjdk*\r\n```\r\n安装过程需要1-2分钟...,安装好之后会自动配置环境变量.\r\n查看版本号：\r\n```shell\r\njava -version\r\n```\r\n结果\r\n```shell\r\n[root@yoyo ~]# java -version\r\nopenjdk version \"1.8.0_191\"\r\nOpenJDK Runtime Environment (build 1.8.0_191-b12)\r\nOpenJDK 64-Bit Server VM (build 25.191-b12, mixed mode)\r\n[root@yoyo ~]# \r\n```\r\n如果出现版本号,如上图所示,即Java环境安装完毕.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '2021-01-22 23:02:49', 'Linux上安装软件，可以用yum非常方便，不需要下载解压，也不需要配置环境变量,一个指令就能完成', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1514243100,2352528106&fm=26&gp=0.jpg', '原创', b'1', b'1', b'1', 'Linux系统使用Yum命令安装Java环境', '2021-02-22 21:32:11', 155, 23, 1);
INSERT INTO `t_blog` VALUES (5, b'1', b'1', '## 一.简介\r\n##### 此篇文章将详细介绍如何将自己的SpringBoot项目部署到各大公司互联网提供的在线云解决方案,以下用阿里云的轻量级服务器来做演示.将自己的项目部署到Linux系统,并且能从外网直接访问.\r\n## 二.详细步骤\r\n#### 1.将项目打包\r\n##### 将SpringBoot项目用Maven工具打包成.jar的项目包,用package命令即可.   \r\n[![idea打包项目](https://img-blog.csdnimg.cn/20200228140825178.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FsbGVuX2NzZG5z,size_16,color_FFFFFF,t_70 \"idea打包项目\")](https://img-blog.csdnimg.cn/20200228140825178.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FsbGVuX2NzZG5z,size_16,color_FFFFFF,t_70 \"idea打包项目\")\r\n\r\n#### 2.将项目包发送至服务器\r\n##### 将该项目包复制到桌面,用FTPS之类的远程通讯软件将该包发送至服务器端口的某一目录下,建议放到/home/usr/SpringBoot目录下. \r\n   [![将项目包发送至服务器](https://img-blog.csdnimg.cn/20200228135447105.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FsbGVuX2NzZG5z,size_16,color_FFFFFF,t_70 \"将项目包发送至服务器\")](https://img-blog.csdnimg.cn/20200228135447105.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FsbGVuX2NzZG5z,size_16,color_FFFFFF,t_70 \"将项目包发送至服务器\")\r\n\r\n#### 3.查看服务器的端口是否被占用\r\n  ```shell\r\nnetstat -anp | grep 80\r\n```\r\n##### 如果被占用,使用以下命令将该进程k掉.\r\n```shell\r\nsudo fuser -k -n tcp 80\r\n```\r\n#### 4.启动项目\r\n```shell\r\njava -jar ***.jar\r\n```\r\n\r\n[![启动项目](https://img-blog.csdnimg.cn/20200228135642163.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FsbGVuX2NzZG5z,size_16,color_FFFFFF,t_70 \"启动项目\")](https://img-blog.csdnimg.cn/20200228135642163.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FsbGVuX2NzZG5z,size_16,color_FFFFFF,t_70 \"启动项目\")\r\n#### 5.开启服务器端口\r\n```shell\r\niptables-save > iptables.bak\r\niptables  -I INPUT  -p tcp --dport    80   -j  ACCEPT\r\nfirewall-cmd --add-port=80/tcp\r\n```\r\n#### 6.测试运行\r\n##### 随便找个浏览器，搜索栏输入http://公网ip:端口号 就可以搜索到你的网站了\r\n#### 7.将项目运行至后台\r\n ```shell\r\n nohup java -jar  ***.jar  &     //***为你的jar包名\r\n```\r\n#### 8.查看日志信息\r\n```shell\r\nvim nohup.out\r\n```\r\n## 三.参考文章\r\n\r\n```markdown\r\nhttps://blog.csdn.net/whh18254122507/article/details/78011713\r\nhttps://blog.csdn.net/pts315414/article/details/79076230\r\nhttps://blog.csdn.net/qq_34975710/article/details/83989642\r\nhttps://yq.aliyun.com/articles/292609\r\nhttps://blog.csdn.net/weixin_39800144/article/details/78836289\r\nhttps://blog.csdn.net/sinat_30436087/article/details/80669767\r\n```\r\n', '2021-01-22 23:41:20', '此篇文章将详细介绍如何将自己的SpringBoot项目部署到各大互联网公司提供的在线云解决方案,并且能从外网直接访问', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1287747382,2860807416&fm=26&gp=0.jpg', '原创', b'1', b'1', b'1', 'SpringBoot项目部署云服务器详细步骤', '2021-02-22 21:31:51', 153, 23, 1);
INSERT INTO `t_blog` VALUES (9, b'1', b'1', '# 1. 版本控制工具简介\r\n\r\n## 1.1什么是版本控制工具\r\n##### 版本控制工具提供完备的版本管理功能，用于存储、追踪目录（文件夹）和文件的修改历史，是软件开发者的必备工具，是软件公司的基础设施。\r\n\r\n##### 版本控制最主要的功能就是追踪文件的变更。它将什么时候、什么人更改了文件的什么内容等信息忠实地了已录下来。每一次文件的改变，文件的版本号都将增加。除了记录版本变更外，版本控制的另一个重要功能是并行开发。软件开发往往是多人协同作业，版本控制可以有效地解决版本的同步以及不同开发者之间的开发通信问题，提高协同开发的效率。并行开发中最常见的不同版本软件的错误(Bug)修正问题也可以通过版本控制中分支与合并的方法有效地解决。\r\n \r\n\r\n## 1.2版本控制工具的作用：\r\n\r\n### （1）协同开发\r\n		团队协作共同完成同一个项目\r\n### （2）版本管理\r\n		以不断提升项目版本的方式逐步完成项目。\r\n### （3）数据备份\r\n		开发中以版本控制的形式保存每一个历史版本。\r\n### （4）权限控制\r\n		对团队开发人员进行不同的权限分配。\r\n### （5）分支管理\r\n		允许开发团队在工作过程中多条生产线同时推进任务，进一步提高效率。\r\n\r\n## 1.2 市场上常见的版本控制工具及分类\r\n\r\n### a. 集中式版本控制工具\r\n##### CVS、SVN、VSS……\r\n##### 不同的客户端直接跟服务器端交互工作，可以进行提交操作、克隆操作等。不同客户端之间是相互独立的。\r\n\r\n### b. 分布式版本控制工具\r\n##### Git、Mercurial、Bazaar、Darcs……\r\n##### 每个用户都有自己在本地的仓库，用来管理版本控制，每个客户端也同时是一个服务器。同时也可以用一个专门的服务器的仓库用来管理。 \r\n\r\n# 2.  Git简介\r\n\r\n## 2.1 Git概述\r\n##### 	Git是一个开源的分布式版本控制系统，可以有效、高速地处理从很小到非常大的项目版本管理。Git起初是 Linus Torvalds 为了帮助管理 Linux 内核开发而开发的一个开放源码的版本控制软件。\r\n\r\n\r\n\r\n## 2.2 Git历史简介\r\n\r\n### Git创建历史解读：\r\n\r\n- ##### 1991年				Linus在1991年创建了开源的Linux，从此，Linux系统不断发展，						已经成为最大的服务器系统软件了\r\n- ##### 2002年以前			世界各地的志愿者把源代码文件通过diff的方式发给Linus（Linus坚定地反对CVS和SVN，这些集中式的版本控制系统不							但速度慢，而且必须联网才能使用。有一些商用的版本控制系统，						虽然比CVS、SVN好用，但那是付费的，和Linux的开源精神不							符）\r\n- ##### 2002年				Linux系统已经发展了十年了，代码库之大让Linus很难继续通过						手工方式管理了。Linus选择了一个商业的版本控制系统							BitKeeper，BitKeeper的东家BitMover公司出于人道主义精神，							授权Linux社区免费使用这个版本控制系统\r\n- ##### 2005年				开发Samba（Samba是在Linux和UNIX系统上实现SMB协议的							一个免费软件）的Andrew试图破解BitKeeper的协议，被BitMover						公司发现了，于是BitMover公司在愤怒中收回了Linux社区对于						BitKeeper的免费使用权\r\n- ##### 同是2005年			Linus在没有版本控制系统的窘境下，自己用C语言写了一个分							布式版本控制系统，这就是Git值得一提的是，Linus仅仅使用两周时间就完成了Git的创建Git创建完毕的一个月后，Linux系统的源码正式由Git管理\r\n- ##### 	2008年				GitHub网站上线了，它为开源项目免费提供Git存储，无数开源						项目开始迁移至GitHub，包括jQuery，PHP，Ruby等等\r\n\r\n- ##### 如今，GitHub+Git的开发模式已经被全世界所认可，已然成为了全世界应用最广泛的分布式版本控制管理工具。\r\n\r\n## 2.3 Git官网及Logo\r\n##### 	官网地址：https://git-scm.com/\r\n##### GitLogo\r\n[![GitLogo](https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1308806829,1155590890&fm=26&gp=0.jpg \"GitLogo\")](https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1308806829,1155590890&fm=26&gp=0.jpg \"GitLogo\")\r\n## 2.4 Git的优点\r\n##### （1）适合分布式开发，强调个体。\r\n##### （2）公共服务器压力和数据量都不会太大。\r\n##### （3）速度快、灵活。\r\n##### （4）相对容易的解决冲突。\r\n##### （5）大部分操作在本地完成，不需要联网。\r\n\r\n# 3.  Git安装\r\n\r\n##### 双击安装文件 \r\n##### 注意安装路径不能有中文和空格\r\n##### 启动cmd命令行工具，以查看版本号的形式验证Git是否已经安装成功\r\n\r\n## 3.1 Git版本控制方式\r\n\r\n##### 关于基本操作\r\n	 \r\n\r\n##### 将工作目录的代码先提交到暂存区，然后再由暂存区提交到本地仓库\r\n\r\n##### 关于分支操作\r\n \r\n##### 在版本控制过程中，使用多条线同时推进多个任务\r\n\r\n## 3.2 以命令行方式操作本地库\r\n\r\n##### 首先找到一个任意的路径当做本地库目录\r\n##### 例如：目录D:\\git\\test\r\n##### 点击右键 --> Git Bash Here\r\n \r\n##### 初始化本地库\r\n##### 命令：git init\r\n \r\n##### 执行完该命令后，在当前目录会出现 文件夹 .git\r\n \r\n\r\n##### .git目录的出现表示本地库初始化成功（表示这个.git目录就是我们的本地库了）\r\n##### 注意：.git目录存放的是和本地库相关的文件，不要修改或者删除\r\n\r\n#### Git目录说明\r\n##### 工作目录：任意目录下，我们开发代码的目录\r\n##### 暂存区域：.get目录下，作用：有个后悔（返回撤销）的余地\r\n##### 本地仓库：.get目录下，Git存储项目的仓库\r\n\r\n## 3.3 设置签名\r\n\r\n##### 设置签名的作用：区分不同开发人员的身份\r\n##### 注意：为Git设置签名与远程库（代码托管中心）的账号密码没有任何关系\r\n\r\n	设置签名命令： \r\n	\r\n	本地库级别设置签名方式：\r\n	git config user.name zs\r\n	git config user.email zs@bjpowernode.com\r\n	信息保存位置：./.git/config 文件\r\n	\r\n	系统用户级别设置签名方式：\r\n	git config --global user.name zs\r\n	git config --global user.email zs@bjpowernode.com\r\n	~/.gitconfig 文件\r\n	\r\n	优先级按照就近原则：项目级别优先于系统用户级别，二者都有时采用项目级别\r\n	的签名\r\n\r\n\r\n\r\n\r\n\r\n\r\n# 4.  GitHub应用方式\r\n\r\n## 4.1 GitHub概述\r\n##### GitHub是一个面向开源及私有软件项目的托管平台，因为只支持Git 作为唯一的版本库格式进行托管，故名GitHub。\r\n##### 2018年6月4日，微软宣布，通过75亿美元的股票交易收购代码托管平台GitHub。\r\n##### 2018年10月26日，微软以75亿美元收购GitHub交易已完成。同年10月29日微软开发者服务副总裁奈特·弗里德曼(Nat Friedman)将成为GitHub的新一任CEO。\r\n\r\n## 4.2 创建远程库\r\n##### 看到以下远程库信息页面证明远程库已经创建成功\r\n##### 如果是刚登录进来，欢迎页面的左侧也会看到远程库的菜单项\r\n##### 点击左侧菜单中的远程库，也会进入到该远程库信息页面\r\n##### 观察如下详细信息页面\r\n##### 点击HTTP，会得到访问远程库的地址\r\n##### 使用另一个账号登录，可以搜索到别人创建的远程库\r\n## 4.3 邀请其他GitHub用户加入开发团队\r\n##### 打开远程库信息页面，点击settings\r\n##### 点击Collaborators\r\n##### 输入被邀请人账号，点击Add collaborator\r\n##### 复制邀请链接\r\n##### 登录被邀请账号\r\n##### 打开浏览器新窗口，在地址栏访问刚刚复制的链接\r\n##### 点击Accept invitaion 接受邀请\r\n##### 变为团队成员后可以推送代码到远程库了\r\n\r\n# 5. 相关文章\r\n- [Github简明指南](http://http://rogerdudler.github.io/git-guide/index.zh.html \"Github简明指南\")\r\n\r\n- [如何高效利用Github](http://http://www.yangzhiping.com/tech/github.html \"如何高效利用Github\")', '2021-02-02 20:59:42', 'GitHub于2008年4月10日正式上线，除了Git代码仓库托管及基本的Web管理界面以外，还提供了订阅、讨论组、文本渲染、在线文件编辑器、协作图谱（报表）、代码片段分享（Gist）等功能', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3356417196,2837443394&fm=26&gp=0.jpg', '原创', b'1', b'1', b'1', 'Git以及Github使用指南', '2021-02-19 12:28:57', 106, 23, 1);
INSERT INTO `t_blog` VALUES (13, b'1', b'1', '# 前言\r\n- ##### 本文主要受众为开发人员,所以不涉及到MySQL的服务部署等操作,且内容较多,大家准备好耐心和瓜子矿泉水.\r\n- ##### 前一阵系统的学习了一下MySQL,也有一些实际操作经验,偶然看到一篇和MySQL相关的面试文章,发现其中的一些问题自己也回答不好,虽然知识点大部分都知道,但是无法将知识串联起来.\r\n- ##### 因此决定搞一个MySQL灵魂100问,试着用回答问题的方式,让自己对知识点的理解更加深入一点.\r\n- ##### 此文不会事无巨细的从select的用法开始讲解mysql,主要针对的是开发人员需要知道的一些MySQL的知识点,主要包括索引,事务,优化等方面,以在面试中高频的问句形式给出答案.\r\n\r\n# 正文\r\n## 索引相关\r\n#### 1. 什么是索引?\r\n##### 索引是一种数据结构,可以帮助我们快速的进行数据的查找.\r\n#### 2. 索引是个什么样的数据结构呢?\r\n##### 索引的数据结构和具体存储引擎的实现有关, 在MySQL中使用较多的索引有Hash索引,B+树索引等,而我们经常使用的InnoDB存储引擎的默认索引实现为:B+树索引.\r\n#### 3. Hash索引和B+树所有有什么区别或者说优劣呢?\r\n##### 首先要知道Hash索引和B+树索引的底层实现原理:\r\n##### hash索引底层就是hash表,进行查找时,调用一次hash函数就可以获取到相应的键值,之后进行回表查询获得实际数据.B+树底层实现是多路平衡查找树.对于每一次的查询都是从根节点出发,查找到叶子节点方可以获得所查键值,然后根据查询判断是否需要回表查询数据.\r\n##### 那么可以看出他们有以下的不同:\r\n##### hash索引进行等值查询更快(一般情况下),但是却无法进行范围查询.\r\n##### 因为在hash索引中经过hash函数建立索引之后,索引的顺序与原顺序无法保持一致,不能支持范围查询.而B+树的的所有节点皆遵循(左节点小于父节点,右节点大于父节点,多叉树也类似),天然支持范围.\r\n##### hash索引不支持使用索引进行排序,原理同上.\r\n##### hash索引不支持模糊查询以及多列索引的最左前缀匹配.原理也是因为hash函数的不可预测.AAAA和AAAAB的索引没有相关性.\r\n##### hash索引任何时候都避免不了回表查询数据,而B+树在符合某些条件(聚簇索引,覆盖索引等)的时候可以只通过索引完成查询.\r\n##### hash索引虽然在等值查询上较快,但是不稳定.性能不可预测,当某个键值存在大量重复的时候,发生hash碰撞,此时效率可能极差.而B+树的查询效率比较稳定,对于所有的查询都是从根节点到叶子节点,且树的高度较低.\r\n##### 因此,在大多数情况下,直接选择B+树索引可以获得稳定且较好的查询速度.而不需要使用hash索引.\r\n#### 4. 上面提到了B+树在满足聚簇索引和覆盖索引的时候不需要回表查询数据,什么是聚簇索引?\r\n##### 在B+树的索引中,叶子节点可能存储了当前的key值,也可能存储了当前的key值以及整行的数据,这就是聚簇索引和非聚簇索引. 在InnoDB中,只有主键索引是聚簇索引,如果没有主键,则挑选一个唯一键建立聚簇索引.如果没有唯一键,则隐式的生成一个键来建立聚簇索引.\r\n##### 当查询使用聚簇索引时,在对应的叶子节点,可以获取到整行数据,因此不用再次进行回表查询.\r\n#### 5. 非聚簇索引一定会回表查询吗?\r\n##### 不一定,这涉及到查询语句所要求的字段是否全部命中了索引,如果全部命中了索引,那么就不必再进行回表查询.\r\n##### 举个简单的例子,假设我们在员工表的年龄上建立了索引,那么当进行 select age from employee where age < 20 的查询时,在索引的叶子节点上,已经包含了age信息,不会再次进行回表查询.\r\n#### 6. 在建立索引的时候,都有哪些需要考虑的因素呢?\r\n##### 建立索引的时候一般要考虑到字段的使用频率,经常作为条件进行查询的字段比较适合.如果需要建立联合索引的话,还需要考虑联合索引中的顺序.此外也要考虑其他方面,比如防止过多的所有对表造成太大的压力.这些都和实际的表结构以及查询方式有关.\r\n#### 7. 联合索引是什么?为什么需要注意联合索引中的顺序?\r\n##### MySQL可以使用多个字段同时建立一个索引,叫做联合索引.在联合索引中,如果想要命中索引,需要按照建立索引时的字段顺序挨个使用,否则无法命中索引.\r\n##### 具体原因为:\r\n##### MySQL使用索引时需要索引有序,假设现在建立了\"name,age,school\"的联合索引,那么索引的排序为: 先按照name排序,如果name相同,则按照age排序,如果age的值也相等,则按照school进行排序.\r\n##### 当进行查询时,此时索引仅仅按照name严格有序,因此必须首先使用name字段进行等值查询,之后对于匹配到的列而言,其按照age字段严格有序,此时可以使用age字段用做索引查找,,,以此类推.因此在建立联合索引的时候应该注意索引列的顺序,一般情况下,将查询需求频繁或者字段选择性高的列放在前面.此外可以根据特例的查询或者表结构进行单独的调整.\r\n#### 8. 创建的索引有没有被使用到?或者说怎么才可以知道这条语句运行很慢的原因?\r\n##### MySQL提供了explain命令来查看语句的执行计划,MySQL在执行某个语句之前,会将该语句过一遍查询优化器,之后会拿到对语句的分析,也就是执行计划,其中包含了许多信息. 可以通过其中和索引有关的信息来分析是否命中了索引,例如possilbe_key,key,key_len等字段,分别说明了此语句可能会使用的索引,实际使用的索引以及使用的索引长度.\r\n#### 9. 那么在哪些情况下会发生针对该列创建了索引但是在查询的时候并没有使用呢?\r\n##### 使用不等于查询,\r\n##### 列参与了数学运算或者函数\r\n##### 在字符串like时左边是通配符.类似于\'%aaa\'.\r\n##### 当mysql分析全表扫描比使用索引快的时候不使用索引.\r\n##### 当使用联合索引,前面一个条件为范围查询,后面的即使符合最左前缀原则,也无法使用索引.\r\n##### 以上情况,MySQL无法使用索引.\r\n\r\n## 事务相关\r\n#### 1. 什么是事务?\r\n##### 理解什么是事务最经典的就是转账的栗子,相信大家也都了解,这里就不再说一边了.\r\n##### 事务是一系列的操作,他们要符合ACID特性.最常见的理解就是:事务中的操作要么全部成功,要么全部失败.但是只是这样还不够的.\r\n#### 2. ACID是什么?可以详细说一下吗?\r\n##### A=Atomicity\r\n##### 原子性,就是上面说的,要么全部成功,要么全部失败.不可能只执行一部分操作.\r\n##### C=Consistency\r\n##### 系统(数据库)总是从一个一致性的状态转移到另一个一致性的状态,不会存在中间状态.\r\n##### I=Isolation\r\n##### 隔离性: 通常来说:一个事务在完全提交之前,对其他事务是不可见的.注意前面的通常来说加了红色,意味着有例外情况.\r\n##### D=Durability\r\n##### 持久性,一旦事务提交,那么就永远是这样子了,哪怕系统崩溃也不会影响到这个事务的结果.\r\n#### 3. 同时有多个事务在进行会怎么样呢?\r\n##### 多事务的并发进行一般会造成以下几个问题:\r\n##### 脏读: A事务读取到了B事务未提交的内容,而B事务后面进行了回滚.\r\n##### 不可重复读: 当设置A事务只能读取B事务已经提交的部分,会造成在A事务内的两次查询,结果竟然不一样,因为在此期间B事务进行了提交操作.\r\n##### 幻读: A事务读取了一个范围的内容,而同时B事务在此期间插入了一条数据.造成\"幻觉\".\r\n#### 4. 怎么解决这些问题呢?MySQL的事务隔离级别了解吗?\r\n##### MySQL的四种隔离级别如下:\r\n##### 未提交读(READ UNCOMMITTED)\r\n##### 这就是上面所说的例外情况了,这个隔离级别下,其他事务可以看到本事务没有提交的部分修改.因此会造成脏读的问题(读取到了其他事务未提交的部分,而之后该事务进行了回滚).\r\n##### 这个级别的性能没有足够大的优势,但是又有很多的问题,因此很少使用.\r\n##### 已提交读(READ COMMITTED)\r\n##### 其他事务只能读取到本事务已经提交的部分.这个隔离级别有 不可重复读的问题,在同一个事务内的两次读取,拿到的结果竟然不一样,因为另外一个事务对数据进行了修改.\r\n##### REPEATABLE READ(可重复读)\r\n##### 可重复读隔离级别解决了上面不可重复读的问题(看名字也知道),但是仍然有一个新问题,就是 幻读,当你读取id> 10 的数据行时,对涉及到的所有行加上了读锁,此时例外一个事务新插入了一条id=11的数据,因为是新插入的,所以不会触发上面的锁的排斥,那么进行本事务进行下一次的查询时会发现有一条id=11的数据,而上次的查询操作并没有获取到,再进行插入就会有主键冲突的问题.\r\n##### SERIALIZABLE(可串行化)\r\n##### 这是最高的隔离级别,可以解决上面提到的所有问题,因为他强制将所以的操作串行执行,这会导致并发性能极速下降,因此也不是很常用.\r\n#### 5. Innodb使用的是哪种隔离级别呢?\r\n##### InnoDB默认使用的是可重复读隔离级别.\r\n#### 6. 对MySQL的锁了解吗?\r\n##### 当数据库有并发事务的时候,可能会产生数据的不一致,这时候需要一些机制来保证访问的次序,锁机制就是这样的一个机制.\r\n##### 就像酒店的房间,如果大家随意进出,就会出现多人抢夺同一个房间的情况,而在房间上装上锁,申请到钥匙的人才可以入住并且将房间锁起来,其他人只有等他使用完毕才可以再次使用.\r\n#### 7. MySQL都有哪些锁呢?像上面那样子进行锁定岂不是有点阻碍并发效率了?\r\n##### 从锁的类别上来讲,有共享锁和排他锁.\r\n##### 共享锁: 又叫做读锁. 当用户要进行数据的读取时,对数据加上共享锁.共享锁可以同时加上多个.\r\n##### 排他锁: 又叫做写锁. 当用户要进行数据的写入时,对数据加上排他锁.排他锁只可以加一个,他和其他的排他锁,共享锁都相斥.\r\n##### 用上面的例子来说就是用户的行为有两种,一种是来看房,多个用户一起看房是可以接受的. 一种是真正的入住一晚,在这期间,无论是想入住的还是想看房的都不可以.\r\n##### 锁的粒度取决于具体的存储引擎,InnoDB实现了行级锁,页级锁,表级锁.\r\n##### 他们的加锁开销从大大小,并发能力也是从大到小.\r\n\r\n## 表结构设计\r\n#### 1. 为什么要尽量设定一个主键?\r\n##### 主键是数据库确保数据行在整张表唯一性的保障,即使业务上本张表没有主键,也建议添加一个自增长的ID列作为主键.设定了主键之后,在后续的删改查的时候可能更加快速以及确保操作数据范围安全.\r\n#### 2. 主键使用自增ID还是UUID?\r\n##### 推荐使用自增ID,不要使用UUID.\r\n##### 因为在InnoDB存储引擎中,主键索引是作为聚簇索引存在的,也就是说,主键索引的B+树叶子节点上存储了主键索引以及全部的数据(按照顺序),如果主键索引是自增ID,那么只需要不断向后排列即可,如果是UUID,由于到来的ID与原来的大小不确定,会造成非常多的数据插入,数据移动,然后导致产生很多的内存碎片,进而造成插入性能的下降.\r\n##### 总之,在数据量大一些的情况下,用自增主键性能会好一些.\r\n##### 图片来源于《高性能MySQL》: 其中默认后缀为使用自增ID,_uuid为使用UUID为主键的测试,测试了插入100w行和300w行的性能.\r\n[![](https://ss.csdn.net/p?https://mmbiz.qpic.cn/mmbiz_png/iaIdQfEric9TyUPmicNlEo7VicUWXlQRm0P8cjjJrHDWKd0Pla0vFZkpHXFbQq4H9vqg3aub3K9B1U6Sczpuibibo2cA/640?wx_fmt=png)](https://ss.csdn.net/p?https://mmbiz.qpic.cn/mmbiz_png/iaIdQfEric9TyUPmicNlEo7VicUWXlQRm0P8cjjJrHDWKd0Pla0vFZkpHXFbQq4H9vqg3aub3K9B1U6Sczpuibibo2cA/640?wx_fmt=png)\r\n\r\n##### 关于主键是聚簇索引,如果没有主键,InnoDB会选择一个唯一键来作为聚簇索引,如果没有唯一键,会生成一个隐式的主键.\r\n> If you define a PRIMARY KEY on your table, InnoDB uses it as the clustered index.\r\nIf you do not define a PRIMARY KEY for your table, MySQL picks the first UNIQUE index that has only NOT NULL columns as the primary key and InnoDB uses it as the clustered index.\r\n\r\n#### 3. 字段为什么要求定义为not null?\r\n##### MySQL官网这样介绍:\r\n> NULL columns require additional space in the rowto record whether their values are NULL. For MyISAM tables, each NULL columntakes one bit extra, rounded up to the nearest byte.\r\n\r\n##### null值会占用更多的字节,且会在程序中造成很多与预期不符的情况.\r\n#### 4. 如果要存储用户的密码散列,应该使用什么字段进行存储?\r\n##### 密码散列,盐,用户身份证号等固定长度的字符串应该使用char而不是varchar来存储,这样可以节省空间且提高检索效率.\r\n## 存储引擎相关\r\n#### 1. MySQL支持哪些存储引擎?\r\n##### MySQL支持多种存储引擎,比如InnoDB,MyISAM,Memory,Archive等等.在大多数的情况下,直接选择使用InnoDB引擎都是最合适的,InnoDB也是MySQL的默认存储引擎.\r\n#### InnoDB和MyISAM有什么区别?\r\n- ##### InnoDB支持事物，而MyISAM不支持事物\r\n- ##### InnoDB支持行级锁，而MyISAM支持表级锁\r\n- ##### InnoDB支持MVCC, 而MyISAM不支持\r\n- ##### InnoDB支持外键，而MyISAM不支持\r\n- ##### InnoDB不支持全文索引，而MyISAM支持。\r\n## 其他问题\r\n#### 1. MySQL中的varchar和char有什么区别.\r\n##### char是一个定长字段,假如申请了 char(10) 的空间,那么无论实际存储多少内容.该字段都占用10个字符,而varchar是变长的,也就是说申请的只是最大长度,占用的空间为实际字符长度+1,最后一个字符存储使用了多长的空间.\r\n##### 在检索效率上来讲,char > varchar,因此在使用中,如果确定某个字段的值的长度,可以使用char,否则应该尽量使用varchar.例如存储用户MD5加密后的密码,则应该使用char.\r\n#### 2. varchar(10)和int(10)代表什么含义?\r\n##### varchar的10代表了申请的空间长度,也是可以存储的数据的最大长度,而int的10只是代表了展示的长度,不足10位以0填充.也就是说,int(1)和int(10)所能存储的数字大小以及占用的空间都是相同的,只是在展示时按照长度展示.\r\n#### 3. MySQL的binlog有有几种录入格式?分别有什么区别?\r\n##### 有三种格式,statement,row和mixed.\r\n##### statement模式下,记录单元为语句.即每一个sql造成的影响会记录.由于sql的执行是有上下文的,因此在保存的时候需要保存相关的信息,同时还有一些使用了函数之类的语句无法被记录复制.\r\n##### row级别下,记录单元为每一行的改动,基本是可以全部记下来但是由于很多操作,会导致大量行的改动(比如alter table),因此这种模式的文件保存的信息太多,日志量太大.\r\n##### mixed. 一种折中的方案,普通操作使用statement记录,当无法使用statement的时候使用row.\r\n##### 此外,新版的MySQL中对row级别也做了一些优化,当表结构发生变化的时候,会记录语句而不是逐行记录.\r\n#### 4. 超大分页怎么处理?\r\n##### 超大的分页一般从两个方向上来解决.\r\n##### 数据库层面,这也是我们主要集中关注的(虽然收效没那么大),类似于 select * from table where age &gt; 20 limit 1000000,10 这种查询其实也是有可以优化的余地的. 这条语句需要load1000000数据然后基本上全部丢弃,只取10条当然比较慢. 当时我们可以修改为 select * from table where id in (select id from table where age &gt; 20 limit 1000000,10) .这样虽然也load了一百万的数据,但是由于索引覆盖,要查询的所有字段都在索引中,所以速度会很快. 同时如果ID连续的好,我们还可以 select * from table where id &gt; 1000000 limit 10 ,效率也是不错的,优化的可能性有许多种,但是核心思想都一样,就是减少load的数据.\r\n##### 从需求的角度减少这种请求….主要是不做类似的需求(直接跳转到几百万页之后的具体某一页.只允许逐页查看或者按照给定的路线走,这样可预测,可缓存)以及防止ID泄漏且连续被人恶意攻击.\r\n##### 解决超大分页,其实主要是靠缓存,可预测性的提前查到内容,缓存至redis等k-V数据库中,直接返回即可.\r\n##### 在阿里巴巴《Java开发手册》中,对超大分页的解决办法是类似于上面提到的第一种.\r\n\r\n#### 5. 关心过业务系统里面的sql耗时吗?统计过慢查询吗?对慢查询都怎么优化过?\r\n##### 在业务系统中,除了使用主键进行的查询,其他的我都会在测试库上测试其耗时,慢查询的统计主要由运维在做,会定期将业务中的慢查询反馈给我们.\r\n##### 慢查询的优化首先要搞明白慢的原因是什么? 是查询条件没有命中索引?是load了不需要的数据列?还是数据量太大?\r\n##### 所以优化也是针对这三个方向来的,\r\n##### 首先分析语句,看看是否load了额外的数据,可能是查询了多余的行并且抛弃掉了,可能是加载了许多结果中并不需要的列,对语句进行分析以及重写.\r\n##### 分析语句的执行计划,然后获得其使用索引的情况,之后修改语句或者修改索引,使得语句可以尽可能的命中索引.\r\n##### 如果对语句的优化已经无法进行,可以考虑表中的数据量是否太大,如果是的话可以进行横向或者纵向的分表.\r\n#### 6. 上面提到横向分表和纵向分表,可以分别举一个适合他们的例子吗?\r\n##### 横向分表是按行分表.假设我们有一张用户表,主键是自增ID且同时是用户的ID.数据量较大,有1亿多条,那么此时放在一张表里的查询效果就不太理想.我们可以根据主键ID进行分表,无论是按尾号分,或者按ID的区间分都是可以的. 假设按照尾号0-99分为100个表,那么每张表中的数据就仅有100w.这时的查询效率无疑是可以满足要求的.\r\n##### 纵向分表是按列分表.假设我们现在有一张文章表.包含字段 id-摘要-内容 .而系统中的展示形式是刷新出一个列表,列表中仅包含标题和摘要,当用户点击某篇文章进入详情时才需要正文内容.此时,如果数据量大,将内容这个很大且不经常使用的列放在一起会拖慢原表的查询速度.我们可以将上面的表分为两张. id-摘要 , id-内容 .当用户点击详情,那主键再来取一次内容即可.而增加的存储量只是很小的主键字段.代价很小.\r\n##### 当然,分表其实和业务的关联度很高,在分表之前一定要做好调研以及benchmark.不要按照自己的猜想盲目操作.\r\n#### 7. 什么是存储过程？有哪些优缺点？\r\n##### 存储过程是一些预编译的SQL语句。1、更加直白的理解：存储过程可以说是一个记录集，它是由一些T-SQL语句组成的代码块，这些T-SQL语句代码像一个方法一样实现一些功能（对单表或多表的增删改查），然后再给这个代码块取一个名字，在用到这个功能的时候调用他就行了。2、存储过程是一个预编译的代码块，执行效率比较高,一个存储过程替代大量T_SQL语句 ，可以降低网络通信量，提高通信速率,可以一定程度上确保数据安全\r\n##### 但是,在互联网项目中,其实是不太推荐存储过程的,比较出名的就是阿里的《Java开发手册》中禁止使用存储过程,我个人的理解是,在互联网项目中,迭代太快,项目的生命周期也比较短,人员流动相比于传统的项目也更加频繁,在这样的情况下,存储过程的管理确实是没有那么方便,同时,复用性也没有写在服务层那么好.\r\n#### 8. 说一说三个范式\r\n##### 第一范式: 每个列都不可以再拆分. 第二范式: 非主键列完全依赖于主键,而不能是依赖于主键的一部分. 第三范式: 非主键列只依赖于主键,不依赖于其他非主键.\r\n##### 在设计数据库结构的时候,要尽量遵守三范式,如果不遵守,必须有足够的理由.比如性能. 事实上我们经常会为了性能而妥协数据库的设计.', '2021-02-06 20:41:52', '本文主要受众为开发人员,所以不涉及到MySQL的服务部署等操作.', 'https://www.runoob.com/wp-content/uploads/2014/03/mysql.jpg', '原创', b'1', b'1', b'1', '关于MySQL面试100个常见问题', '2021-02-22 21:32:37', 180, 38, 1);
INSERT INTO `t_blog` VALUES (15, b'1', b'1', '题目来源于 LeetCode 上第 1 号问题：两数之和。题目难度为 Easy，目前通过率为 45.8% 。\r\n\r\n## 题目描述\r\n给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。\r\n\r\n你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。\r\n\r\n## 示例:\r\n\r\n给定 nums = [2, 7, 11, 15], target = 9\r\n\r\n因为 nums[0] + nums[1] = 2 + 7 = 9\r\n所以返回 [0, 1]\r\n\r\n## 代码实现\r\n```java\r\n// 1. Two Sum\r\n// https://leetcode.com/problems/two-sum/description/\r\n// 时间复杂度：O(n)\r\n// 空间复杂度：O(n)\r\nclass Solution {\r\n  public int[] twoSum(int[] nums, int target) {\r\n      int l = nums.length;\r\n      int[] ans=new int[2];\r\n      int i,j;\r\n      for(i=0;i<l-1;i++)\r\n      {\r\n          for(j=i+1;j<l;j++)\r\n          {\r\n              if(nums[i]+nums[j] == target)\r\n              {\r\n                  ans[0]=i;\r\n                  ans[1]=j;\r\n              }\r\n          }\r\n      }\r\n       \r\n      return ans;\r\n       \r\n  }\r\n}\r\n```\r\n[![作者公众号](https://img-blog.csdnimg.cn/20210221205619653.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDAyODA1OA==,size_16,color_FFFFFF,t_70#pic_center \"作者公众号\")](https://img-blog.csdnimg.cn/20210221205619653.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDAyODA1OA==,size_16,color_FFFFFF,t_70#pic_centerhttps://img-blog.csdnimg.cn/20210221205619653.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDAyODA1OA==,size_16,color_FFFFFF,t_70#pic_center \"作者公众号\")', '2021-02-21 20:59:41', '给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD//gA7Q1JFQVRPUjogZ2QtanBlZyB2MS4wICh1c2luZyBJSkcgSlBFRyB2NjIpLCBxdWFsaXR5ID0gODAK/9sAQwAGBAUGBQQGBgUGBwcGCAoQCgoJCQoUDg8MEBcUGBgXFBYWGh0lHxobIxwWFiAsICMmJykqKRkfLTAtKDAlKCko/9sAQwEHBwcKCAoTCgoTKBoWGigoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgo/8AAEQgA6gH0AwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A+VKKdRQA2inUUANop1FADaKdRQA2inUUANop1FADaKdRQA2inUUANop1FADaKdRQA2inUUANop1FABTadRQA2inUUANop1FADaKdRQA2inUUANop1FADaKdRQA2inUUANop1FADaKdRQA2inUUANop1FADaKdRQA2inUUANop1FADaKdRQA2inUUANop1FADaKdRQA2inUUALRiiigBKWiigAooooAKKKKACiiigAooooASiloxQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSUtFABRRRQAUUUUAFFFFABRRRQAlFLRQAlLRRQAUUUUAJS0UUAJRS0UAFFFFABRRRQAUUYooAKKKKACiiigBKWiigAopaKACinUUANop1FADaKdRQA2inUUANoxTqKAG0U6igBtFOooAbRTqMUANop1FADcUU6igBtFOooAbijFOooAbRTqKAG0U6igBtFOooAbRTqKAG0U6igBtFOxRQA2inUUANop1FADaMU6igBtFOooAbRTqKAG0U6igBtFOooAbRTsUUANxRTqKAG4op1FADaKdRQA2inUYoAbRTqKAG0U6igBaKWigBKKXFFACUUtFACUUtFACYopaKAEoxS0UAJRS0UAJRS4ooASjFLRigBKKWjFACUUtGKAEopaKAEopaKAEopaKAEoxS0UAJRS16r8EvhHffEPURcXW610GBv38+OZP9hPf3oA8por7a8e/APwfP4Ru10ax/s7ULaFpYbhHLZKjOGz1zXxTNH5cjqexIoAjopaKAEopaKAExRS0UAJiilxRQAlGKWigBKKWigBKKWigBKMUtFACUUtFACUUuKKAEopaMUAJRS4oxQAmKKWigBKKXFFACUUuKKAHUYpaKAEoxS0UAJiilooATFFLiigBMUUuKMUAJijFLRQAlFLiigBKKWjFACUUtFACYopaMUAJRS0UAJRS0UAJijFLRQAlGKWjFACUUuK9U+CXwlv/AIgaotxdLJbaBA/7+5xgy/8ATOP39+1AB8E/hLf/ABB1QXF0HttAhb9/cd5P+mae/vX3FoWkWOhaTbadpdultZwLtjjUdP8A69GhaTY6FpVvp2l26W1nbrtjjQcD/wCvXJ/EXWJZ9NutK0i+ezu5V2tdxAExfT3rGviKdCPNUdka0qUqr5Yo8u/aM+MsOlWt14X8NSLLqMqmK7uVPECnqg/2z+lfIxJJJPWu68ffDzWfDbyXkpN9ZMcm6jyTn/bHauFp0q0Kseam7ompTlTdpKwlFLiitSBKKWigBKKWigBKKWjFACUUtGKAExRS0UAJRS0YoASiloxQAmKKXFFACYopaKAEoxS4ooASilooATFFLRQAlFLRQAlFLiigBcU6lxRQAmKKWjFACUUtFACUYpcUUAJRS0YoATFFLRQAlNxT6MUAMxTsUuKKAEptPooASilooATFNp9FACYopcUUAJRilxRQAlGKWvUvgh8K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', '', b'1', b'1', b'1', 'LeetCode-001 两数之和', '2021-02-22 21:32:54', 52, 37, 1);

-- ----------------------------
-- Table structure for t_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tags`;
CREATE TABLE `t_blog_tags`  (
  `blogs_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  INDEX `FK5feau0gb4lq47fdb03uboswm8`(`tags_id`) USING BTREE,
  INDEX `FKh4pacwjwofrugxa9hpwaxg6mr`(`blogs_id`) USING BTREE,
  CONSTRAINT `FK5feau0gb4lq47fdb03uboswm8` FOREIGN KEY (`tags_id`) REFERENCES `t_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKh4pacwjwofrugxa9hpwaxg6mr` FOREIGN KEY (`blogs_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_blog_tags
-- ----------------------------
INSERT INTO `t_blog_tags` VALUES (9, 26);
INSERT INTO `t_blog_tags` VALUES (5, 20);
INSERT INTO `t_blog_tags` VALUES (5, 31);
INSERT INTO `t_blog_tags` VALUES (4, 19);
INSERT INTO `t_blog_tags` VALUES (4, 20);
INSERT INTO `t_blog_tags` VALUES (4, 31);
INSERT INTO `t_blog_tags` VALUES (13, 25);
INSERT INTO `t_blog_tags` VALUES (13, 29);
INSERT INTO `t_blog_tags` VALUES (13, 34);
INSERT INTO `t_blog_tags` VALUES (15, 30);
INSERT INTO `t_blog_tags` VALUES (15, 32);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_comment` bit(1) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blog_id` bigint(20) NULL DEFAULT NULL,
  `parent_comment_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKke3uogd04j4jx316m1p51e05u`(`blog_id`) USING BTREE,
  INDEX `FK4jj284r3pb7japogvo6h72q95`(`parent_comment_id`) USING BTREE,
  CONSTRAINT `FK4jj284r3pb7japogvo6h72q95` FOREIGN KEY (`parent_comment_id`) REFERENCES `t_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKke3uogd04j4jx316m1p51e05u` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (30, b'0', '/images/favicon.ico', 'uouio', '2021-02-25 20:06:18', 'q@ll.com', '1', 13, NULL);
INSERT INTO `t_comment` VALUES (31, b'0', '/images/favicon.ico', '<script>alert(\"test\")<script>', '2021-02-25 20:06:53', 'q@ll.com', '1', 13, 30);
INSERT INTO `t_comment` VALUES (32, b'0', '/images/favicon.ico', '<script>alert(\"test\")<script>', '2021-02-25 20:06:58', 'q@ll.com', '1', 13, NULL);
INSERT INTO `t_comment` VALUES (33, b'0', '/images/favicon.ico', '122121', '2021-03-02 16:59:01', '1212@qq.com', '1212', 13, NULL);
INSERT INTO `t_comment` VALUES (34, b'0', '/images/favicon.ico', '121212', '2021-03-02 16:59:07', '1212@qq.com', '1212', 13, NULL);
INSERT INTO `t_comment` VALUES (35, b'0', '/images/favicon.ico', '12asdadasdsadasdasdadas', '2021-03-02 16:59:12', '1212@qq.com', '1212', 13, NULL);

-- ----------------------------
-- Table structure for t_record
-- ----------------------------
DROP TABLE IF EXISTS `t_record`;
CREATE TABLE `t_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_visit_time` datetime(0) NULL DEFAULT NULL,
  `total_number_of_visits` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 735 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_record
-- ----------------------------
INSERT INTO `t_record` VALUES (1, ' 陕西省榆林市 联通\r', '113.200.5.154', '2021-02-21 08:38:20', 41);
INSERT INTO `t_record` VALUES (2, ' 陕西省西安市 联通\r', '113.200.106.47', '2021-02-19 13:19:19', 5);
INSERT INTO `t_record` VALUES (5, ' 韩国 KT电信\r', '222.119.160.50', '2021-02-19 13:43:44', 1);
INSERT INTO `t_record` VALUES (6, ' 河南省南阳市 移动\r', '223.91.93.64', '2021-02-19 13:57:31', 2);
INSERT INTO `t_record` VALUES (7, ' 浙江省 电信中心网络\r', '183.136.225.46', '2021-02-19 14:24:48', 1);
INSERT INTO `t_record` VALUES (8, ' 日本  CZ88.NET\r', '43.245.218.13', '2021-02-19 14:37:54', 1);
INSERT INTO `t_record` VALUES (9, ' 印度尼西亚  CZ88.NET\r', '125.167.35.222', '2021-02-19 14:46:20', 1);
INSERT INTO `t_record` VALUES (10, ' 新加坡 阿里云\r', '149.129.55.193', '2021-03-03 14:32:12', 20);
INSERT INTO `t_record` VALUES (11, ' 浙江省杭州市 电信\r', '115.231.117.186', '2021-02-19 15:12:52', 1);
INSERT INTO `t_record` VALUES (12, ' 广西贵港市 电信\r', '180.139.240.244', '2021-02-19 15:35:36', 1);
INSERT INTO `t_record` VALUES (13, ' 河南省安阳市 联通\r', '123.8.11.83', '2021-02-19 15:37:42', 1);
INSERT INTO `t_record` VALUES (14, ' 北京市 北京金山云网络技术有限公司\r', '120.92.72.31', '2021-02-19 15:38:29', 3);
INSERT INTO `t_record` VALUES (15, ' 北京市 北京金山云网络技术有限公司\r', '120.92.12.39', '2021-02-19 15:38:24', 1);
INSERT INTO `t_record` VALUES (16, ' 美国 Facebook公司\r', '173.252.127.18', '2021-02-19 16:47:37', 1);
INSERT INTO `t_record` VALUES (17, ' 浙江省杭州市 电信\r', '61.175.197.202', '2021-02-19 16:48:34', 1);
INSERT INTO `t_record` VALUES (18, ' 浙江省杭州市 联通\r', '124.160.236.89', '2021-02-19 16:55:33', 1);
INSERT INTO `t_record` VALUES (19, ' 宁夏银川市 电信\r', '106.45.9.201', '2021-02-19 16:55:37', 1);
INSERT INTO `t_record` VALUES (20, ' 安徽省合肥市 联通\r', '36.32.3.6', '2021-02-19 16:55:38', 1);
INSERT INTO `t_record` VALUES (21, ' 云南省昆明市 电信\r', '182.245.45.134', '2021-02-19 16:55:39', 1);
INSERT INTO `t_record` VALUES (22, ' 新疆乌鲁木齐市 电信\r', '49.118.192.176', '2021-02-19 16:55:39', 1);
INSERT INTO `t_record` VALUES (23, ' 山东省济南市平阴县 电信\r', '113.128.105.228', '2021-02-19 16:55:40', 1);
INSERT INTO `t_record` VALUES (24, ' 河南省郑州市 联通\r', '115.60.152.236', '2021-02-19 16:55:56', 1);
INSERT INTO `t_record` VALUES (25, ' 中国 移动\r', '120.224.1.35', '2021-02-19 17:02:24', 1);
INSERT INTO `t_record` VALUES (26, ' 陕西省西安市 电信\r', '113.140.20.174', '2021-02-19 17:13:50', 1);
INSERT INTO `t_record` VALUES (27, ' 陕西省西安市 电信\r', '1.83.220.216', '2021-02-19 17:45:59', 1);
INSERT INTO `t_record` VALUES (28, ' 重庆市 电信\r', '125.84.236.79', '2021-02-19 17:57:13', 1);
INSERT INTO `t_record` VALUES (29, ' 上海市 阿里云\r', '101.132.106.111', '2021-02-19 17:57:50', 1);
INSERT INTO `t_record` VALUES (30, ' 北京市 北京百度网讯科技有限公司联通节点(BGP)\r', '111.206.36.9', '2021-02-19 18:10:24', 1);
INSERT INTO `t_record` VALUES (31, ' 法国 巴黎Online S.A.S\r', '51.158.78.179', '2021-02-26 18:36:21', 2);
INSERT INTO `t_record` VALUES (32, ' 贵州省 移动\r', '117.188.16.8', '2021-02-19 19:00:43', 2);
INSERT INTO `t_record` VALUES (33, ' 广东省广州市荔湾区 /越秀区电信\r', '61.140.210.145', '2021-02-19 19:22:34', 1);
INSERT INTO `t_record` VALUES (34, ' 浙江省杭州市 阿里云\r', '47.101.187.254', '2021-02-19 20:45:21', 1);
INSERT INTO `t_record` VALUES (35, ' 湖北省 移动\r', '117.155.227.251', '2021-02-19 20:51:11', 2);
INSERT INTO `t_record` VALUES (36, ' 四川省成都市 电信\r', '182.150.155.145', '2021-02-19 20:52:38', 1);
INSERT INTO `t_record` VALUES (37, ' 江苏省扬州市 电信\r', '49.86.25.119', '2021-02-19 20:54:03', 1);
INSERT INTO `t_record` VALUES (38, ' 海南省 电信\r', '223.199.16.148', '2021-02-19 20:54:14', 1);
INSERT INTO `t_record` VALUES (39, ' 江西省赣州市 电信\r', '182.98.41.148', '2021-02-19 20:56:06', 1);
INSERT INTO `t_record` VALUES (40, ' 河南省新乡市 联通\r', '61.136.101.157', '2021-03-01 08:13:28', 3);
INSERT INTO `t_record` VALUES (41, ' 浙江省杭州市 阿里云\r', '47.101.199.1', '2021-02-19 21:02:57', 1);
INSERT INTO `t_record` VALUES (42, ' 北京市海淀区 联通\r', '221.222.251.119', '2021-02-19 22:08:02', 1);
INSERT INTO `t_record` VALUES (43, ' 美国 Microsoft公司\r', '157.55.39.242', '2021-02-19 22:53:45', 1);
INSERT INTO `t_record` VALUES (44, ' 上海市 移动\r', '120.204.76.123', '2021-02-19 23:02:15', 6);
INSERT INTO `t_record` VALUES (45, ' 上海市 联通\r', '27.115.124.38', '2021-03-03 18:25:05', 2);
INSERT INTO `t_record` VALUES (46, ' 上海市 联通\r', '27.115.124.6', '2021-02-19 22:55:59', 1);
INSERT INTO `t_record` VALUES (47, ' 安徽省芜湖市 电信\r', '60.169.190.131', '2021-02-19 22:59:00', 1);
INSERT INTO `t_record` VALUES (48, ' 湖北省咸宁市 电信\r', '121.61.28.82', '2021-02-19 23:00:30', 1);
INSERT INTO `t_record` VALUES (49, ' 广东省揭阳市 电信\r', '113.117.57.135', '2021-02-19 23:07:40', 2);
INSERT INTO `t_record` VALUES (50, ' 上海市 联通\r', '223.166.194.130', '2021-02-19 23:08:49', 1);
INSERT INTO `t_record` VALUES (51, ' 英国  CZ88.NET\r', '193.118.53.210', '2021-03-04 05:25:01', 3);
INSERT INTO `t_record` VALUES (52, ' 中国 移动\r', '112.17.79.156', '2021-03-03 00:53:32', 3);
INSERT INTO `t_record` VALUES (53, ' 美国 加利福尼亚州弗里蒙特市Hurricane Electric公司\r', '65.49.20.67', '2021-02-20 00:24:40', 1);
INSERT INTO `t_record` VALUES (54, ' 河南省郑州市 电信\r', '171.12.25.7', '2021-02-20 00:50:51', 1);
INSERT INTO `t_record` VALUES (55, ' 浙江省杭州市 阿里云\r', '47.101.192.16', '2021-02-20 01:17:59', 1);
INSERT INTO `t_record` VALUES (56, ' 新疆 移动\r', '223.115.241.207', '2021-02-20 01:46:34', 2);
INSERT INTO `t_record` VALUES (57, ' 广东省 移动\r', '223.104.66.140', '2021-02-20 02:46:57', 2);
INSERT INTO `t_record` VALUES (58, ' 辽宁省本溪市 电信\r', '182.202.167.21', '2021-02-20 03:07:32', 1);
INSERT INTO `t_record` VALUES (59, ' 安徽省安庆市 电信\r', '36.60.145.66', '2021-02-20 04:09:02', 1);
INSERT INTO `t_record` VALUES (60, ' 美国  CZ88.NET\r', '167.248.133.56', '2021-02-20 04:09:46', 2);
INSERT INTO `t_record` VALUES (61, ' 俄罗斯  CZ88.NET\r', '185.166.241.31', '2021-02-20 04:16:00', 1);
INSERT INTO `t_record` VALUES (62, ' 北京市海淀区 北龙中网(北京)科技有限公司(BGP)\r', '202.173.11.248', '2021-02-27 04:13:03', 2);
INSERT INTO `t_record` VALUES (63, ' 新加坡 阿里云\r', '8.210.159.44', '2021-03-02 20:49:46', 16);
INSERT INTO `t_record` VALUES (64, ' 美国  CZ88.NET\r', '216.145.14.142', '2021-02-20 05:43:35', 1);
INSERT INTO `t_record` VALUES (65, ' 浙江省杭州市 阿里云\r', '47.101.202.18', '2021-02-20 06:24:50', 1);
INSERT INTO `t_record` VALUES (66, ' 湖北省武汉市 电信\r', '59.174.226.23', '2021-02-20 07:35:43', 3);
INSERT INTO `t_record` VALUES (67, ' 法国 ONLINE S.A.S.数据中心\r', '212.47.244.68', '2021-03-04 07:59:02', 6);
INSERT INTO `t_record` VALUES (68, ' 广东省东莞市 电信\r', '14.222.101.4', '2021-02-20 08:05:13', 2);
INSERT INTO `t_record` VALUES (69, ' 甘肃省白银市 电信\r', '27.224.137.253', '2021-02-20 08:07:54', 1);
INSERT INTO `t_record` VALUES (70, ' 山东省济南市平阴县 电信\r', '113.128.105.239', '2021-02-20 08:07:57', 1);
INSERT INTO `t_record` VALUES (71, ' 宁夏银川市 电信\r', '106.45.9.43', '2021-02-20 08:07:58', 1);
INSERT INTO `t_record` VALUES (72, ' 河北省石家庄市 电信\r', '111.224.249.43', '2021-02-20 08:08:00', 1);
INSERT INTO `t_record` VALUES (73, ' 甘肃省白银市 电信\r', '27.224.137.104', '2021-02-20 08:08:00', 1);
INSERT INTO `t_record` VALUES (74, ' 山东省济南市 联通\r', '221.0.19.220', '2021-02-20 08:08:01', 1);
INSERT INTO `t_record` VALUES (75, ' 北京市 谷翔信息技术有限公司数据中心\r', '203.208.60.36', '2021-02-20 09:17:39', 1);
INSERT INTO `t_record` VALUES (76, ' 吉林省长春市 电信\r', '124.235.65.93', '2021-02-20 09:31:07', 3);
INSERT INTO `t_record` VALUES (77, ' 湖南省益阳市 联通\r', '220.248.163.78', '2021-02-20 10:24:09', 3);
INSERT INTO `t_record` VALUES (78, ' 江西省南昌市 电信\r', '111.75.210.212', '2021-02-28 11:31:55', 5);
INSERT INTO `t_record` VALUES (80, ' 浙江省金华市 移动\r', '223.93.50.149', '2021-02-20 10:34:13', 1);
INSERT INTO `t_record` VALUES (81, ' 浙江省嘉兴市 电信电子政府网络\r', '220.191.220.245', '2021-02-20 10:57:03', 1);
INSERT INTO `t_record` VALUES (82, ' 江苏省苏州市太仓市 电信\r', '218.4.41.149', '2021-02-20 11:00:01', 1);
INSERT INTO `t_record` VALUES (83, ' 河南省洛阳市 联通\r', '42.224.245.160', '2021-02-20 11:33:27', 2);
INSERT INTO `t_record` VALUES (84, ' 北京市 联通\r', '114.242.26.253', '2021-02-20 11:38:29', 2);
INSERT INTO `t_record` VALUES (85, ' 湖南省益阳市 电信\r', '220.170.144.38', '2021-02-20 11:43:06', 1);
INSERT INTO `t_record` VALUES (86, ' 福建省厦门市 电信IDC机房\r', '117.25.139.73', '2021-02-20 11:43:06', 1);
INSERT INTO `t_record` VALUES (87, ' 湖南省益阳市 电信\r', '220.170.144.38', '2021-02-20 11:43:06', 1);
INSERT INTO `t_record` VALUES (88, ' 福建省厦门市 电信IDC机房\r', '117.25.139.73', '2021-02-20 11:43:06', 1);
INSERT INTO `t_record` VALUES (89, ' 湖南省益阳市 电信\r', '220.170.144.38', '2021-02-20 11:43:06', 1);
INSERT INTO `t_record` VALUES (90, ' 湖南省益阳市 电信\r', '220.170.144.38', '2021-02-20 11:43:06', 1);
INSERT INTO `t_record` VALUES (91, ' 湖南省益阳市 电信\r', '220.170.144.38', '2021-02-20 11:43:06', 1);
INSERT INTO `t_record` VALUES (92, ' 上海市 电信\r', '61.129.6.145', '2021-02-20 11:43:20', 1);
INSERT INTO `t_record` VALUES (93, ' 上海市 电信\r', '101.91.60.104', '2021-02-20 11:43:26', 1);
INSERT INTO `t_record` VALUES (94, ' 安徽省宿州市 电信\r', '223.246.30.31', '2021-02-20 11:46:28', 1);
INSERT INTO `t_record` VALUES (95, ' 重庆市九龙坡区 电信\r', '222.182.198.83', '2021-02-20 11:47:03', 1);
INSERT INTO `t_record` VALUES (96, ' 广东省茂名市 电信\r', '219.129.216.189', '2021-02-20 11:47:21', 1);
INSERT INTO `t_record` VALUES (97, ' 广东省深圳市南山区 电信\r', '119.137.53.248', '2021-02-20 17:17:23', 4);
INSERT INTO `t_record` VALUES (98, ' 广东省清远市 电信\r', '183.29.196.132', '2021-02-20 13:04:55', 1);
INSERT INTO `t_record` VALUES (99, ' 瑞典  CZ88.NET\r', '78.66.209.119', '2021-02-20 13:21:40', 1);
INSERT INTO `t_record` VALUES (100, ' 浙江省杭州市 阿里云\r', '47.101.202.76', '2021-02-20 13:21:48', 1);
INSERT INTO `t_record` VALUES (101, ' 浙江省杭州市 电信\r', '115.230.122.11', '2021-02-20 13:37:14', 2);
INSERT INTO `t_record` VALUES (102, ' 广东省佛山市顺德区 电信\r', '61.142.131.76', '2021-02-20 14:34:49', 2);
INSERT INTO `t_record` VALUES (103, ' 广东省 移动\r', '120.231.64.173', '2021-02-20 14:34:46', 1);
INSERT INTO `t_record` VALUES (104, ' 浙江省杭州市 电信\r', '183.129.189.109', '2021-02-20 14:42:57', 1);
INSERT INTO `t_record` VALUES (105, ' 重庆市 电信\r', '106.83.117.191', '2021-02-20 15:12:12', 2);
INSERT INTO `t_record` VALUES (106, ' 湖北省武汉市 联通\r', '113.57.176.41', '2021-02-20 17:14:18', 2);
INSERT INTO `t_record` VALUES (107, ' 中国 移动\r', '111.21.175.10', '2021-02-20 15:51:50', 1);
INSERT INTO `t_record` VALUES (108, ' 广东省揭阳市 电信\r', '113.110.4.157', '2021-02-20 16:25:00', 1);
INSERT INTO `t_record` VALUES (109, ' 吉林省长春市 电信\r', '124.235.138.213', '2021-02-20 16:32:34', 1);
INSERT INTO `t_record` VALUES (110, ' 湖北省襄阳市 联通\r', '183.95.37.194', '2021-02-20 17:27:27', 1);
INSERT INTO `t_record` VALUES (111, ' 河南省郑州市 移动\r', '39.162.141.37', '2021-02-20 17:42:50', 2);
INSERT INTO `t_record` VALUES (112, ' 河南省郑州市 移动\r', '39.162.229.253', '2021-02-20 18:29:44', 1);
INSERT INTO `t_record` VALUES (113, ' 乌克兰  CZ88.NET\r', '5.248.63.131', '2021-02-20 18:33:01', 1);
INSERT INTO `t_record` VALUES (114, ' 上海市 阿里云\r', '106.14.10.143', '2021-02-22 17:41:47', 2);
INSERT INTO `t_record` VALUES (115, ' 北京市 北京金山云网络技术有限公司\r', '120.92.72.96', '2021-02-20 18:53:52', 1);
INSERT INTO `t_record` VALUES (116, ' 美国 加利福尼亚州弗里蒙特市Hurricane Electric公司\r', '74.82.47.2', '2021-02-20 19:09:18', 1);
INSERT INTO `t_record` VALUES (117, ' 山西省太原市 电信\r', '110.177.179.49', '2021-02-20 19:41:14', 1);
INSERT INTO `t_record` VALUES (118, ' 甘肃省白银市 电信\r', '27.224.136.125', '2021-02-20 19:41:18', 1);
INSERT INTO `t_record` VALUES (119, ' 江苏省南京市 联通\r', '112.80.138.244', '2021-02-20 19:41:20', 1);
INSERT INTO `t_record` VALUES (120, ' 内蒙古呼和浩特市 电信\r', '121.57.231.56', '2021-02-20 19:41:20', 1);
INSERT INTO `t_record` VALUES (121, ' 甘肃省白银市 电信\r', '27.224.137.133', '2021-02-20 19:41:20', 1);
INSERT INTO `t_record` VALUES (122, ' 四川省成都市 电信\r', '182.138.137.41', '2021-02-20 19:41:21', 1);
INSERT INTO `t_record` VALUES (123, ' 意大利  CZ88.NET\r', '217.57.74.118', '2021-02-20 20:04:46', 1);
INSERT INTO `t_record` VALUES (124, ' 安徽省 电信\r', '36.59.120.218', '2021-02-20 21:22:28', 1);
INSERT INTO `t_record` VALUES (125, ' 哥伦比亚  CZ88.NET\r', '186.159.4.25', '2021-02-20 21:28:28', 1);
INSERT INTO `t_record` VALUES (126, ' 云南省昭通市 电信\r', '60.160.28.161', '2021-02-20 22:40:53', 1);
INSERT INTO `t_record` VALUES (127, ' 陕西省西安市 电信\r', '124.114.241.221', '2021-02-20 23:34:56', 1);
INSERT INTO `t_record` VALUES (128, ' 墨西哥  CZ88.NET\r', '189.236.240.96', '2021-02-21 00:25:20', 1);
INSERT INTO `t_record` VALUES (129, ' 斯洛伐克  CZ88.NET\r', '217.31.38.109', '2021-02-21 01:31:34', 1);
INSERT INTO `t_record` VALUES (130, ' 河南省郑州市 联通\r', '42.236.253.238', '2021-02-21 01:53:39', 1);
INSERT INTO `t_record` VALUES (131, ' 北美地区  CZ88.NET\r', '104.172.232.5', '2021-02-21 02:01:56', 1);
INSERT INTO `t_record` VALUES (132, ' 挪威  CZ88.NET\r', '185.173.35.33', '2021-02-21 04:39:50', 1);
INSERT INTO `t_record` VALUES (133, ' 美国 Microsoft公司\r', '13.66.139.159', '2021-02-23 04:09:14', 2);
INSERT INTO `t_record` VALUES (134, ' 上海市 阿里云\r', '101.132.100.6', '2021-02-21 05:20:02', 1);
INSERT INTO `t_record` VALUES (135, ' 上海市 阿里云\r', '47.100.104.184', '2021-02-21 05:25:04', 1);
INSERT INTO `t_record` VALUES (136, ' 浙江省杭州市 阿里云\r', '47.101.199.131', '2021-02-22 02:04:55', 2);
INSERT INTO `t_record` VALUES (137, ' 美国 加利福尼亚州洛杉矶Wowrack科技公司\r', '216.244.66.231', '2021-02-22 17:32:57', 2);
INSERT INTO `t_record` VALUES (138, ' 俄罗斯  CZ88.NET\r', '195.208.145.49', '2021-02-21 06:26:00', 1);
INSERT INTO `t_record` VALUES (139, ' 荷兰  CZ88.NET\r', '185.142.236.35', '2021-02-21 07:35:01', 1);
INSERT INTO `t_record` VALUES (140, ' 美国 得克萨斯州\r', '34.78.227.165', '2021-02-27 14:37:24', 5);
INSERT INTO `t_record` VALUES (141, ' 美国 华盛顿州西雅图市亚马逊(Amazon)公司数据中心\r', '52.201.238.106', '2021-02-21 07:39:47', 1);
INSERT INTO `t_record` VALUES (142, ' 美国  CZ88.NET\r', '104.206.128.58', '2021-02-21 07:56:51', 1);
INSERT INTO `t_record` VALUES (143, ' 广东省深圳市南山区 电信\r', '119.137.54.250', '2021-02-21 15:04:39', 7);
INSERT INTO `t_record` VALUES (144, ' 山东省 铁通(全省通用)\r', '123.196.11.63', '2021-02-21 09:30:18', 1);
INSERT INTO `t_record` VALUES (145, ' 广东省深圳市 电信\r', '183.11.72.165', '2021-02-21 10:53:29', 9);
INSERT INTO `t_record` VALUES (146, ' 陕西省西安市 联通\r', '123.139.84.58', '2021-02-21 12:25:09', 2);
INSERT INTO `t_record` VALUES (147, ' 韩国 首尔Amazon数据中心\r', '52.79.233.139', '2021-02-21 12:39:19', 1);
INSERT INTO `t_record` VALUES (148, ' 美国 纽约州伊利县威廉斯维尔村ColoCrossing有限公司\r', '172.245.8.131', '2021-02-21 13:19:29', 1);
INSERT INTO `t_record` VALUES (149, ' 乌克兰  CZ88.NET\r', '2.57.122.97', '2021-03-01 17:10:50', 4);
INSERT INTO `t_record` VALUES (150, ' 湖北省 移动数据上网公共出口\r', '223.104.20.206', '2021-02-21 13:56:12', 1);
INSERT INTO `t_record` VALUES (151, ' 美国 佐治亚州亚特兰大市Cox通信公司\r', '72.223.73.160', '2021-02-21 14:04:37', 1);
INSERT INTO `t_record` VALUES (152, ' 美国  CZ88.NET\r', '162.142.125.54', '2021-02-21 15:18:45', 2);
INSERT INTO `t_record` VALUES (153, ' 北京市 移动\r', '117.132.183.17', '2021-02-27 01:49:48', 2);
INSERT INTO `t_record` VALUES (154, ' 美国 Merit网络公司\r', '35.243.240.156', '2021-02-21 16:31:21', 1);
INSERT INTO `t_record` VALUES (155, ' 法国  CZ88.NET\r', '163.172.115.102', '2021-02-21 16:31:31', 1);
INSERT INTO `t_record` VALUES (156, ' 日本 东京都品川区Linode数据中心\r', '139.162.106.181', '2021-03-02 14:02:37', 3);
INSERT INTO `t_record` VALUES (157, ' 上海市 电信\r', '180.161.111.66', '2021-02-21 17:01:54', 3);
INSERT INTO `t_record` VALUES (158, ' 江苏省苏州市 电信\r', '180.97.118.219', '2021-02-21 17:03:02', 2);
INSERT INTO `t_record` VALUES (159, ' 美国 加利福尼亚州弗里蒙特市Hurricane Electric公司\r', '216.218.206.66', '2021-03-02 03:31:20', 2);
INSERT INTO `t_record` VALUES (160, ' 法国  CZ88.NET\r', '163.172.168.251', '2021-03-02 18:17:34', 8);
INSERT INTO `t_record` VALUES (161, ' 希腊  CZ88.NET\r', '178.147.26.33', '2021-02-21 17:27:47', 1);
INSERT INTO `t_record` VALUES (162, ' 广东省汕头市 电信\r', '116.26.143.254', '2021-02-21 17:33:36', 1);
INSERT INTO `t_record` VALUES (163, ' 江苏省南京市 联通\r', '112.80.136.50', '2021-02-21 17:34:19', 1);
INSERT INTO `t_record` VALUES (164, ' 四川省绵阳市 移动\r', '117.175.2.20', '2021-02-21 17:54:50', 3);
INSERT INTO `t_record` VALUES (165, ' 浙江省杭州市 阿里云BGP数据中心\r', '139.224.114.201', '2021-02-21 18:03:29', 1);
INSERT INTO `t_record` VALUES (167, ' 江西省九江市 移动\r', '117.171.175.3', '2021-02-21 18:39:31', 1);
INSERT INTO `t_record` VALUES (168, ' 江西省南昌市 电信\r', '115.148.154.125', '2021-02-21 18:44:12', 1);
INSERT INTO `t_record` VALUES (169, ' 江西省南昌市 电信\r', '106.4.161.209', '2021-02-21 18:44:15', 1);
INSERT INTO `t_record` VALUES (170, ' 广东省广州市黄埔区 电信\r', '219.136.77.167', '2021-02-21 18:48:25', 1);
INSERT INTO `t_record` VALUES (171, ' 上海市 联通\r', '27.115.124.70', '2021-02-21 18:55:21', 1);
INSERT INTO `t_record` VALUES (172, ' 山西省 移动\r', '111.52.55.12', '2021-02-24 20:28:56', 16);
INSERT INTO `t_record` VALUES (175, ' 青海省 联通\r', '139.170.104.151', '2021-02-21 20:07:33', 1);
INSERT INTO `t_record` VALUES (177, ' 浙江省杭州市 阿里云\r', '47.101.164.135', '2021-02-21 22:29:44', 1);
INSERT INTO `t_record` VALUES (178, ' 上海市 阿里云\r', '101.132.121.228', '2021-02-21 22:36:15', 1);
INSERT INTO `t_record` VALUES (179, ' 河南省南阳市新野县 联通\r', '115.52.145.147', '2021-02-21 22:42:13', 1);
INSERT INTO `t_record` VALUES (180, ' 山东省青岛市 电信\r', '122.4.65.101', '2021-02-22 00:28:29', 1);
INSERT INTO `t_record` VALUES (181, ' 安徽省宿州市 电信\r', '223.246.85.59', '2021-02-22 02:52:57', 2);
INSERT INTO `t_record` VALUES (182, ' 安徽省宿州市 电信\r', '223.246.85.59', '2021-02-22 02:52:56', 1);
INSERT INTO `t_record` VALUES (183, ' 浙江省杭州市 阿里云\r', '47.101.187.176', '2021-02-22 02:54:17', 1);
INSERT INTO `t_record` VALUES (184, ' 陕西省西安市 电信\r', '222.90.28.66', '2021-02-22 04:10:31', 1);
INSERT INTO `t_record` VALUES (185, ' 浙江省杭州市 阿里云\r', '47.101.187.231', '2021-02-22 06:22:44', 1);
INSERT INTO `t_record` VALUES (186, ' 上海市 阿里云\r', '47.100.107.233', '2021-02-22 07:01:53', 1);
INSERT INTO `t_record` VALUES (187, ' 美国 加利福尼亚州旧金山DigitalOcean数据中心\r', '192.241.218.190', '2021-02-22 07:11:28', 1);
INSERT INTO `t_record` VALUES (188, ' 法国  CZ88.NET\r', '163.172.161.118', '2021-03-03 18:35:10', 4);
INSERT INTO `t_record` VALUES (189, ' 山西省太原市 电信\r', '110.177.183.228', '2021-02-22 07:14:08', 1);
INSERT INTO `t_record` VALUES (190, ' 河北省石家庄市 电信\r', '111.224.249.199', '2021-02-22 07:14:11', 1);
INSERT INTO `t_record` VALUES (191, ' 甘肃省白银市 电信\r', '27.224.136.251', '2021-02-22 07:14:13', 1);
INSERT INTO `t_record` VALUES (192, ' 北京市 电信\r', '1.202.116.18', '2021-02-22 07:14:14', 1);
INSERT INTO `t_record` VALUES (193, ' 甘肃省白银市 电信\r', '27.224.137.202', '2021-02-22 07:14:15', 1);
INSERT INTO `t_record` VALUES (194, ' 江西省南昌市 联通\r', '171.34.176.227', '2021-02-22 07:14:15', 1);
INSERT INTO `t_record` VALUES (195, ' 河南省驻马店市 电信\r', '171.14.133.149', '2021-02-22 08:09:11', 2);
INSERT INTO `t_record` VALUES (196, ' 浙江省宁波市 电信\r', '60.178.23.108', '2021-02-22 08:38:18', 2);
INSERT INTO `t_record` VALUES (197, ' 江西省 电信\r', '111.75.220.100', '2021-03-01 15:05:27', 19);
INSERT INTO `t_record` VALUES (198, ' 英国  CZ88.NET\r', '193.118.53.202', '2021-03-02 03:38:16', 2);
INSERT INTO `t_record` VALUES (199, ' 上海市 阿里云\r', '101.132.164.213', '2021-02-22 11:25:03', 1);
INSERT INTO `t_record` VALUES (200, ' 江苏省宿迁市 电信\r', '222.187.237.44', '2021-02-22 11:43:14', 1);
INSERT INTO `t_record` VALUES (201, ' 美国 Amazon EC2服务器\r', '3.94.209.39', '2021-02-22 11:50:22', 1);
INSERT INTO `t_record` VALUES (202, ' 澳大利亚 阿里云\r', '47.74.84.52', '2021-02-22 12:46:07', 1);
INSERT INTO `t_record` VALUES (203, ' 美国 俄勒冈州波特兰Amazon数据中心\r', '34.220.178.247', '2021-02-22 12:54:38', 1);
INSERT INTO `t_record` VALUES (204, ' 山西省太原市 联通\r', '218.26.172.61', '2021-02-22 13:19:37', 1);
INSERT INTO `t_record` VALUES (205, ' 上海市 联通\r', '223.166.75.124', '2021-02-22 14:00:35', 1);
INSERT INTO `t_record` VALUES (206, ' 宁夏银川市 电信\r', '106.45.9.38', '2021-02-22 14:00:41', 1);
INSERT INTO `t_record` VALUES (207, ' 新疆乌鲁木齐市 电信\r', '49.118.202.0', '2021-02-22 14:00:41', 1);
INSERT INTO `t_record` VALUES (208, ' 内蒙古呼和浩特市 电信\r', '121.57.231.170', '2021-02-22 14:00:41', 1);
INSERT INTO `t_record` VALUES (209, ' 山西省太原市小店区 联通\r', '118.81.4.170', '2021-02-22 14:00:42', 1);
INSERT INTO `t_record` VALUES (210, ' 土耳其  CZ88.NET\r', '88.247.40.91', '2021-02-22 14:54:32', 1);
INSERT INTO `t_record` VALUES (211, ' 美国 Interland\r', '64.227.127.147', '2021-02-22 15:51:42', 1);
INSERT INTO `t_record` VALUES (212, ' 巴勒斯坦  CZ88.NET\r', '37.76.214.25', '2021-02-22 16:09:41', 1);
INSERT INTO `t_record` VALUES (213, ' 巴勒斯坦  CZ88.NET\r', '37.76.214.25', '2021-02-22 16:09:41', 1);
INSERT INTO `t_record` VALUES (214, ' 巴勒斯坦  CZ88.NET\r', '37.76.214.25', '2021-02-22 16:09:41', 1);
INSERT INTO `t_record` VALUES (215, ' 坦桑尼亚  CZ88.NET\r', '154.73.64.66', '2021-02-22 17:32:08', 1);
INSERT INTO `t_record` VALUES (216, ' 河南省郑州市 移动\r', '223.90.250.203', '2021-02-22 19:18:16', 3);
INSERT INTO `t_record` VALUES (217, ' 浙江省杭州市 阿里云\r', '47.102.153.219', '2021-02-22 20:02:00', 1);
INSERT INTO `t_record` VALUES (218, ' 新疆乌鲁木齐市 电信\r', '49.118.200.126', '2021-02-22 20:20:05', 1);
INSERT INTO `t_record` VALUES (219, ' 河北省石家庄市 电信\r', '111.224.218.48', '2021-02-22 20:20:10', 1);
INSERT INTO `t_record` VALUES (220, ' 青海省 联通\r', '175.184.164.209', '2021-02-22 20:20:11', 1);
INSERT INTO `t_record` VALUES (221, ' 辽宁省沈阳市 联通\r', '119.118.22.24', '2021-02-22 20:20:12', 1);
INSERT INTO `t_record` VALUES (222, ' 山东省济南市 联通\r', '112.230.45.210', '2021-02-22 20:20:12', 1);
INSERT INTO `t_record` VALUES (223, ' 江西省南昌市 联通\r', '171.34.177.233', '2021-02-22 20:20:14', 1);
INSERT INTO `t_record` VALUES (224, ' 山西省吕梁市 联通\r', '124.165.190.5', '2021-02-23 18:10:38', 4);
INSERT INTO `t_record` VALUES (225, ' 美国 俄勒冈州波特兰Amazon数据中心\r', '54.191.36.240', '2021-02-22 20:55:12', 1);
INSERT INTO `t_record` VALUES (226, ' 山西省 移动\r', '120.208.232.17', '2021-02-22 21:36:36', 3);
INSERT INTO `t_record` VALUES (227, ' 安徽省合肥市蜀山区 电信\r', '223.243.54.57', '2021-02-22 22:23:21', 1);
INSERT INTO `t_record` VALUES (228, ' 加拿大  CZ88.NET\r', '24.53.51.203', '2021-02-23 00:48:39', 1);
INSERT INTO `t_record` VALUES (229, ' 上海市 阿里云\r', '101.132.32.18', '2021-02-23 00:51:01', 1);
INSERT INTO `t_record` VALUES (230, ' 印度 马哈拉施特拉邦孟买Amazon数据中心\r', '52.66.141.78', '2021-02-23 02:17:11', 1);
INSERT INTO `t_record` VALUES (231, ' 浙江省杭州市 阿里云\r', '47.101.193.188', '2021-02-23 02:27:21', 1);
INSERT INTO `t_record` VALUES (232, ' 美国  CZ88.NET\r', '45.159.17.186', '2021-02-23 02:58:56', 1);
INSERT INTO `t_record` VALUES (233, ' 美国 加利福尼亚州弗里蒙特市Hurricane Electric公司\r', '74.82.47.3', '2021-02-23 03:50:46', 1);
INSERT INTO `t_record` VALUES (234, ' 哈萨克斯坦  CZ88.NET\r', '2.133.94.174', '2021-02-23 03:58:56', 1);
INSERT INTO `t_record` VALUES (235, ' 福建省龙岩市 联通\r', '58.22.84.175', '2021-02-23 03:59:51', 1);
INSERT INTO `t_record` VALUES (236, ' 美国 加利福尼亚州洛杉矶Zenlayer数据中心\r', '128.14.134.134', '2021-03-03 09:06:10', 4);
INSERT INTO `t_record` VALUES (237, ' 巴西  CZ88.NET\r', '189.126.195.138', '2021-02-23 05:53:08', 1);
INSERT INTO `t_record` VALUES (238, ' 法国  CZ88.NET\r', '163.172.159.134', '2021-03-02 20:08:43', 5);
INSERT INTO `t_record` VALUES (239, ' 北京市 联通\r', '123.125.21.178', '2021-02-23 06:23:34', 2);
INSERT INTO `t_record` VALUES (240, ' 美国  CZ88.NET\r', '167.248.133.40', '2021-02-23 07:05:14', 2);
INSERT INTO `t_record` VALUES (241, ' 山东省青岛市 电信\r', '123.168.78.61', '2021-02-23 09:42:32', 2);
INSERT INTO `t_record` VALUES (242, ' 上海市 阿里云\r', '106.15.191.82', '2021-02-23 18:47:14', 2);
INSERT INTO `t_record` VALUES (243, ' 荷兰  CZ88.NET\r', '185.142.236.40', '2021-02-27 14:37:03', 2);
INSERT INTO `t_record` VALUES (244, ' 山西省晋城市 /吕梁市联通\r', '218.26.54.35', '2021-02-23 11:57:03', 2);
INSERT INTO `t_record` VALUES (245, ' 浙江省杭州市 阿里云\r', '47.103.82.30', '2021-02-23 10:56:36', 1);
INSERT INTO `t_record` VALUES (246, ' 河北省石家庄市 电信\r', '124.236.146.232', '2021-02-23 11:11:28', 4);
INSERT INTO `t_record` VALUES (247, ' 广西玉林市 联通\r', '171.38.91.140', '2021-02-23 11:50:05', 1);
INSERT INTO `t_record` VALUES (248, ' 上海市 阿里云\r', '47.100.237.7', '2021-02-23 12:38:55', 1);
INSERT INTO `t_record` VALUES (249, ' 巴西  CZ88.NET\r', '191.242.246.177', '2021-02-23 13:30:12', 1);
INSERT INTO `t_record` VALUES (250, ' 瑞典  CZ88.NET\r', '178.73.215.171', '2021-03-02 13:13:20', 3);
INSERT INTO `t_record` VALUES (251, ' 塞尔维亚  CZ88.NET\r', '188.255.251.79', '2021-02-23 14:57:18', 1);
INSERT INTO `t_record` VALUES (252, ' 希腊 雅典\r', '92.118.161.9', '2021-02-23 15:30:24', 1);
INSERT INTO `t_record` VALUES (253, ' 浙江省杭州市 阿里云\r', '47.101.32.174', '2021-02-23 15:37:16', 1);
INSERT INTO `t_record` VALUES (254, ' 英国  CZ88.NET\r', '86.109.43.129', '2021-02-23 15:42:48', 1);
INSERT INTO `t_record` VALUES (255, ' 洪都拉斯  CZ88.NET\r', '179.63.254.90', '2021-02-23 15:59:27', 1);
INSERT INTO `t_record` VALUES (256, ' 泰国  CZ88.NET\r', '180.180.156.15', '2021-02-23 15:59:31', 1);
INSERT INTO `t_record` VALUES (257, ' 泰国 TOT-AS-AP\r', '1.10.188.140', '2021-02-23 15:59:55', 1);
INSERT INTO `t_record` VALUES (258, ' 美国 加利福尼亚州旧金山DigitalOcean数据中心\r', '192.241.206.25', '2021-02-23 16:51:26', 1);
INSERT INTO `t_record` VALUES (259, ' 美国  CZ88.NET\r', '157.230.143.29', '2021-02-23 17:45:39', 1);
INSERT INTO `t_record` VALUES (260, ' 上海市 联通\r', '223.166.75.121', '2021-02-23 17:59:04', 1);
INSERT INTO `t_record` VALUES (261, ' 云南省昆明市 电信\r', '182.245.173.233', '2021-02-23 17:59:07', 1);
INSERT INTO `t_record` VALUES (262, ' 山西省太原市 电信\r', '110.177.183.175', '2021-02-23 17:59:09', 1);
INSERT INTO `t_record` VALUES (263, ' 山东省济南市平阴县 电信\r', '113.128.105.45', '2021-02-23 17:59:09', 1);
INSERT INTO `t_record` VALUES (264, ' 山东省济南市平阴县 电信\r', '113.128.105.45', '2021-02-23 17:59:09', 1);
INSERT INTO `t_record` VALUES (265, ' 北京市 电信\r', '1.202.113.85', '2021-02-23 17:59:11', 1);
INSERT INTO `t_record` VALUES (266, ' 瑞典  CZ88.NET\r', '192.71.30.89', '2021-02-23 18:12:54', 1);
INSERT INTO `t_record` VALUES (267, ' 美国 华盛顿州摩西湖市Microsoft数据中心\r', '52.250.58.212', '2021-02-23 18:17:30', 1);
INSERT INTO `t_record` VALUES (268, ' 美国  CZ88.NET\r', '74.120.14.53', '2021-02-23 19:19:41', 2);
INSERT INTO `t_record` VALUES (269, ' 俄罗斯  CZ88.NET\r', '92.39.217.153', '2021-02-23 21:12:34', 1);
INSERT INTO `t_record` VALUES (270, ' 贵州省 移动\r', '117.189.228.9', '2021-02-23 22:00:52', 1);
INSERT INTO `t_record` VALUES (271, ' 广东省广州市 联通\r', '61.242.40.158', '2021-02-23 22:09:18', 1);
INSERT INTO `t_record` VALUES (272, ' 美国 加利福尼亚州弗里蒙特市Hurricane Electric公司\r', '184.105.139.70', '2021-02-23 22:27:07', 1);
INSERT INTO `t_record` VALUES (273, ' 浙江省 电信中心网络\r', '183.136.190.62', '2021-03-02 17:18:02', 5);
INSERT INTO `t_record` VALUES (274, ' 广东省深圳市 阿里云\r', '119.23.174.205', '2021-02-23 23:36:43', 1);
INSERT INTO `t_record` VALUES (275, ' 广东省深圳市 阿里云\r', '120.79.217.140', '2021-02-23 23:37:02', 1);
INSERT INTO `t_record` VALUES (276, ' 北京市 谷翔信息技术有限公司数据中心\r', '203.208.60.44', '2021-02-23 23:45:50', 1);
INSERT INTO `t_record` VALUES (277, ' 美国 纽约州伊利县威廉斯维尔村ColoCrossing有限公司\r', '172.245.10.102', '2021-02-24 00:03:14', 1);
INSERT INTO `t_record` VALUES (278, ' 河北省张家口市 阿里云\r', '47.92.31.65', '2021-02-24 00:03:32', 1);
INSERT INTO `t_record` VALUES (279, ' 法国  CZ88.NET\r', '163.172.68.26', '2021-02-24 01:32:27', 1);
INSERT INTO `t_record` VALUES (280, ' 河北省石家庄市 联通\r', '120.0.8.220', '2021-02-24 01:34:08', 1);
INSERT INTO `t_record` VALUES (281, ' 浙江省杭州市 阿里云\r', '47.102.111.181', '2021-02-24 01:52:53', 1);
INSERT INTO `t_record` VALUES (282, ' 上海市 阿里云\r', '106.14.187.229', '2021-02-24 01:53:39', 1);
INSERT INTO `t_record` VALUES (283, ' 上海市 电信\r', '180.163.220.5', '2021-02-28 16:53:19', 3);
INSERT INTO `t_record` VALUES (284, ' 美国  CZ88.NET\r', '192.35.168.32', '2021-02-24 02:42:49', 1);
INSERT INTO `t_record` VALUES (285, ' 北美地区  CZ88.NET\r', '168.205.153.249', '2021-02-24 04:04:26', 1);
INSERT INTO `t_record` VALUES (286, ' 俄罗斯  CZ88.NET\r', '77.73.49.254', '2021-02-24 04:38:01', 1);
INSERT INTO `t_record` VALUES (287, ' 浙江省杭州市 阿里云\r', '47.97.215.92', '2021-02-24 05:03:50', 1);
INSERT INTO `t_record` VALUES (288, ' 上海市 阿里云\r', '101.132.156.172', '2021-02-24 05:14:01', 1);
INSERT INTO `t_record` VALUES (289, ' 英国  CZ88.NET\r', '145.239.82.0', '2021-03-01 18:01:23', 2);
INSERT INTO `t_record` VALUES (290, ' 韩国 KT电信\r', '59.23.172.226', '2021-02-24 06:20:17', 1);
INSERT INTO `t_record` VALUES (291, ' 美国 Microsoft公司\r', '13.66.139.104', '2021-02-25 22:22:31', 5);
INSERT INTO `t_record` VALUES (292, ' 乌克兰  CZ88.NET\r', '178.93.10.64', '2021-02-24 07:43:09', 1);
INSERT INTO `t_record` VALUES (293, ' 河南省郑州市 电信\r', '1.193.60.223', '2021-02-24 08:22:49', 2);
INSERT INTO `t_record` VALUES (294, ' 美国 伊利诺伊州芝加哥市SingleHop有限公司\r', '198.20.99.130', '2021-02-24 10:00:48', 1);
INSERT INTO `t_record` VALUES (295, ' 哥伦比亚  CZ88.NET\r', '190.109.171.5', '2021-02-24 10:50:38', 1);
INSERT INTO `t_record` VALUES (296, ' 浙江省杭州市 阿里云\r', '47.101.202.13', '2021-02-28 12:39:19', 2);
INSERT INTO `t_record` VALUES (297, ' 美国 加利福尼亚州洛杉矶Zenlayer数据中心\r', '128.14.134.170', '2021-02-24 12:39:16', 1);
INSERT INTO `t_record` VALUES (298, ' 美国 Google\r', '66.249.70.96', '2021-02-24 23:43:38', 2);
INSERT INTO `t_record` VALUES (299, ' 上海市徐汇区 联通漕河泾数据中心\r', '112.65.156.150', '2021-02-24 13:40:57', 4);
INSERT INTO `t_record` VALUES (300, ' 浙江省杭州市 阿里云\r', '47.101.201.20', '2021-02-24 14:27:13', 1);
INSERT INTO `t_record` VALUES (301, ' 湖南省怀化市 联通\r', '42.49.141.34', '2021-02-24 15:25:12', 2);
INSERT INTO `t_record` VALUES (302, ' 美国  CZ88.NET\r', '104.206.128.46', '2021-02-24 15:31:05', 1);
INSERT INTO `t_record` VALUES (303, ' 北京市 阿里云\r', '47.94.39.226', '2021-02-24 15:41:05', 1);
INSERT INTO `t_record` VALUES (304, ' 美国 弗吉尼亚州费尔法克斯县赫恩登镇时代华纳有线互联网有限公司\r', '75.181.35.56', '2021-02-24 15:52:53', 1);
INSERT INTO `t_record` VALUES (305, ' 安徽省阜阳市 电信\r', '60.172.0.142', '2021-02-24 16:25:44', 1);
INSERT INTO `t_record` VALUES (306, ' 河南省 移动\r', '117.158.210.253', '2021-02-25 11:05:24', 2);
INSERT INTO `t_record` VALUES (307, ' 上海市 电信\r', '101.91.62.89', '2021-02-24 17:58:34', 1);
INSERT INTO `t_record` VALUES (308, ' 玻利维亚  CZ88.NET\r', '190.186.250.171', '2021-02-24 18:06:45', 1);
INSERT INTO `t_record` VALUES (309, ' 山西省晋城市 /吕梁市联通\r', '218.26.54.155', '2021-02-24 18:15:06', 1);
INSERT INTO `t_record` VALUES (310, ' 广东省广州市 电信\r', '113.67.156.6', '2021-02-24 18:48:50', 1);
INSERT INTO `t_record` VALUES (311, ' 美国 加利福尼亚州弗里蒙特市Hurricane Electric公司\r', '184.105.247.196', '2021-03-02 21:06:26', 2);
INSERT INTO `t_record` VALUES (312, ' 以色列  CZ88.NET\r', '82.166.83.219', '2021-02-24 19:13:58', 1);
INSERT INTO `t_record` VALUES (313, ' 英国 伦敦DigitalOcean数据中心\r', '139.59.161.230', '2021-02-24 20:07:11', 1);
INSERT INTO `t_record` VALUES (314, ' 上海市 阿里云\r', '47.100.246.14', '2021-02-24 20:11:44', 1);
INSERT INTO `t_record` VALUES (315, ' 美国 里斯敦市\r', '71.6.232.4', '2021-03-03 14:43:07', 2);
INSERT INTO `t_record` VALUES (316, ' 美国 加利福尼亚州旧金山DigitalOcean数据中心\r', '192.241.213.57', '2021-02-24 21:52:52', 1);
INSERT INTO `t_record` VALUES (317, ' 湖南省长沙市 联通\r', '119.39.248.9', '2021-02-24 22:42:50', 2);
INSERT INTO `t_record` VALUES (318, ' 海南省三亚市 电信\r', '140.240.97.102', '2021-02-24 23:09:04', 1);
INSERT INTO `t_record` VALUES (319, ' 俄罗斯  CZ88.NET\r', '188.17.153.233', '2021-02-24 23:51:24', 1);
INSERT INTO `t_record` VALUES (320, ' 北京市 移动\r', '221.179.144.118', '2021-02-25 08:15:13', 3);
INSERT INTO `t_record` VALUES (321, ' 浙江省温州市 电信\r', '122.228.19.79', '2021-03-01 01:34:07', 4);
INSERT INTO `t_record` VALUES (322, ' 北美地区  CZ88.NET\r', '104.152.52.30', '2021-02-25 01:16:49', 1);
INSERT INTO `t_record` VALUES (323, ' 浙江省杭州市 阿里云\r', '47.101.191.143', '2021-02-25 03:37:36', 1);
INSERT INTO `t_record` VALUES (324, ' 广东省东莞市 移动\r', '223.104.63.250', '2021-02-25 06:40:29', 1);
INSERT INTO `t_record` VALUES (325, ' 浙江省杭州市 阿里云\r', '47.101.202.118', '2021-02-25 07:09:04', 1);
INSERT INTO `t_record` VALUES (326, ' 英国  CZ88.NET\r', '46.166.187.81', '2021-02-25 07:15:11', 1);
INSERT INTO `t_record` VALUES (327, ' 宁夏银川市 电信\r', '106.45.11.208', '2021-02-25 07:24:01', 1);
INSERT INTO `t_record` VALUES (328, ' 宁夏银川市 电信\r', '106.45.11.208', '2021-02-25 07:24:01', 1);
INSERT INTO `t_record` VALUES (329, ' 宁夏银川市 电信\r', '106.45.11.208', '2021-02-25 07:24:01', 1);
INSERT INTO `t_record` VALUES (330, ' 宁夏银川市 电信\r', '106.45.11.208', '2021-02-25 07:24:01', 1);
INSERT INTO `t_record` VALUES (331, ' 宁夏银川市 电信\r', '106.45.11.208', '2021-02-25 07:24:01', 1);
INSERT INTO `t_record` VALUES (332, ' 宁夏银川市 电信\r', '106.45.11.208', '2021-02-25 07:24:01', 1);
INSERT INTO `t_record` VALUES (333, ' 美国  CZ88.NET\r', '167.248.133.54', '2021-03-03 23:25:30', 3);
INSERT INTO `t_record` VALUES (334, ' 浙江省杭州市 阿里云\r', '47.101.198.216', '2021-02-25 07:35:11', 1);
INSERT INTO `t_record` VALUES (335, ' 浙江省杭州市 阿里云\r', '47.103.124.9', '2021-02-25 07:54:54', 1);
INSERT INTO `t_record` VALUES (336, ' 陕西省西安市 联通\r', '220.200.163.37', '2021-02-25 08:40:08', 1);
INSERT INTO `t_record` VALUES (337, ' 美国 Google\r', '66.249.70.98', '2021-02-25 08:55:14', 1);
INSERT INTO `t_record` VALUES (338, ' 英国 伦敦DigitalOcean数据中心\r', '178.62.55.19', '2021-02-25 09:05:40', 1);
INSERT INTO `t_record` VALUES (339, ' 美国 加利福尼亚州旧金山DigitalOcean数据中心\r', '192.241.223.135', '2021-02-25 09:30:16', 1);
INSERT INTO `t_record` VALUES (340, ' 广东省广州市 电信\r', '14.29.126.62', '2021-02-25 10:07:15', 1);
INSERT INTO `t_record` VALUES (341, ' 美国 俄勒冈州波特兰Amazon数据中心\r', '54.68.202.10', '2021-02-25 10:24:19', 1);
INSERT INTO `t_record` VALUES (342, ' 美国 康涅狄格州费尔菲尔德县费尔菲尔德镇通用电气公司\r', '3.237.42.165', '2021-02-25 10:58:48', 1);
INSERT INTO `t_record` VALUES (343, ' 广东省广州市 电信\r', '113.67.156.250', '2021-02-25 12:21:06', 2);
INSERT INTO `t_record` VALUES (344, ' 印度  CZ88.NET\r', '123.108.202.2', '2021-02-25 12:58:26', 1);
INSERT INTO `t_record` VALUES (345, ' 美国 加利福尼亚州圣克拉拉阿里云\r', '47.89.192.12', '2021-02-25 13:09:16', 1);
INSERT INTO `t_record` VALUES (346, ' 俄罗斯  CZ88.NET\r', '46.146.216.195', '2021-02-25 13:24:53', 1);
INSERT INTO `t_record` VALUES (347, ' 美国  CZ88.NET\r', '129.146.190.190', '2021-03-02 14:25:14', 3);
INSERT INTO `t_record` VALUES (348, ' 欧盟  CZ88.NET\r', '45.83.67.164', '2021-02-25 15:22:50', 1);
INSERT INTO `t_record` VALUES (349, ' 浙江省 电信中心网络\r', '183.138.177.69', '2021-02-25 15:43:43', 1);
INSERT INTO `t_record` VALUES (350, ' 江苏省苏州市 电信\r', '121.224.216.203', '2021-02-25 16:54:28', 1);
INSERT INTO `t_record` VALUES (351, ' 山西省晋城市 联通\r', '218.26.55.123', '2021-02-25 17:25:40', 2);
INSERT INTO `t_record` VALUES (352, ' 上海市 电信\r', '61.129.6.251', '2021-02-25 17:35:25', 1);
INSERT INTO `t_record` VALUES (353, ' 北京市 鹏博士长城宽带\r', '124.205.77.115', '2021-02-25 17:50:54', 1);
INSERT INTO `t_record` VALUES (354, ' 亚太地区  CZ88.NET\r', '103.95.70.130', '2021-02-25 18:18:35', 1);
INSERT INTO `t_record` VALUES (355, ' 安徽省 移动\r', '120.243.74.157', '2021-02-25 18:49:58', 1);
INSERT INTO `t_record` VALUES (356, ' 加拿大  CZ88.NET\r', '206.80.249.105', '2021-02-25 18:50:00', 1);
INSERT INTO `t_record` VALUES (357, ' 浙江省杭州市 阿里云\r', '47.101.196.225', '2021-02-25 19:15:44', 1);
INSERT INTO `t_record` VALUES (358, ' 广东省广州市 联通\r', '112.94.4.92', '2021-02-25 19:18:07', 1);
INSERT INTO `t_record` VALUES (359, ' 辽宁省朝阳市 电信\r', '182.204.73.74', '2021-02-25 19:25:57', 1);
INSERT INTO `t_record` VALUES (360, ' 美国 Google\r', '66.249.70.100', '2021-02-25 19:27:52', 1);
INSERT INTO `t_record` VALUES (361, ' 广东省潮州市 电信\r', '113.85.91.34', '2021-02-25 20:32:59', 3);
INSERT INTO `t_record` VALUES (362, ' 湖南省衡阳市 移动\r', '36.157.250.74', '2021-02-25 20:33:38', 1);
INSERT INTO `t_record` VALUES (363, ' 江苏省镇江市 电信\r', '58.217.34.171', '2021-02-25 20:54:21', 1);
INSERT INTO `t_record` VALUES (364, ' 上海市 联通\r', '210.22.245.219', '2021-02-25 21:04:00', 1);
INSERT INTO `t_record` VALUES (365, ' 美国 科罗拉多州丹佛市Qwest通信有限公司\r', '205.169.39.125', '2021-02-25 21:35:47', 1);
INSERT INTO `t_record` VALUES (366, ' 河南省郑州市 联通\r', '182.127.10.151', '2021-02-25 21:41:52', 2);
INSERT INTO `t_record` VALUES (367, ' 上海市 电信\r', '101.85.68.82', '2021-02-25 21:52:44', 1);
INSERT INTO `t_record` VALUES (368, ' 美国 加利福尼亚州洛杉矶Zenlayer数据中心\r', '128.14.133.58', '2021-03-01 16:39:43', 3);
INSERT INTO `t_record` VALUES (369, ' 陕西省西安市 电信\r', '117.22.82.155', '2021-02-25 22:24:59', 1);
INSERT INTO `t_record` VALUES (370, ' 北美地区  CZ88.NET\r', '23.231.76.98', '2021-02-25 22:43:05', 1);
INSERT INTO `t_record` VALUES (371, ' 山西省太原市 电信\r', '110.177.180.70', '2021-02-25 23:52:36', 1);
INSERT INTO `t_record` VALUES (372, ' 山西省太原市 电信\r', '110.177.180.70', '2021-02-25 23:52:36', 1);
INSERT INTO `t_record` VALUES (373, ' 山西省太原市 电信\r', '110.177.180.70', '2021-02-25 23:52:36', 1);
INSERT INTO `t_record` VALUES (374, ' 山西省太原市 电信\r', '110.177.180.70', '2021-02-25 23:52:36', 1);
INSERT INTO `t_record` VALUES (375, ' 山西省太原市 电信\r', '110.177.180.70', '2021-02-25 23:52:36', 1);
INSERT INTO `t_record` VALUES (376, ' 山西省太原市 电信\r', '110.177.180.70', '2021-02-25 23:52:36', 1);
INSERT INTO `t_record` VALUES (377, ' 山西省太原市 电信\r', '110.177.180.70', '2021-02-25 23:52:36', 1);
INSERT INTO `t_record` VALUES (378, ' 广东省深圳市 阿里云\r', '120.78.231.236', '2021-03-03 14:06:14', 2);
INSERT INTO `t_record` VALUES (379, ' 河北省承德市 联通\r', '110.245.204.158', '2021-02-26 00:12:06', 1);
INSERT INTO `t_record` VALUES (380, ' 美国 伊利诺伊州芝加哥市SingleHop有限公司\r', '107.6.157.2', '2021-02-26 00:31:24', 1);
INSERT INTO `t_record` VALUES (381, ' 山东省东营市 联通\r', '211.90.1.206', '2021-03-03 16:38:59', 3);
INSERT INTO `t_record` VALUES (382, ' 贵州省黔南州 电信\r', '222.86.180.185', '2021-02-26 00:39:34', 1);
INSERT INTO `t_record` VALUES (383, ' 美国  CZ88.NET\r', '45.155.126.222', '2021-02-26 01:20:51', 1);
INSERT INTO `t_record` VALUES (384, ' 上海市 阿里云\r', '47.100.110.234', '2021-02-26 01:56:54', 1);
INSERT INTO `t_record` VALUES (385, ' 山东省 联通\r', '39.77.24.218', '2021-02-26 02:20:24', 1);
INSERT INTO `t_record` VALUES (386, ' 美国 弗吉尼亚州劳登县阿什本地区MCI通信服务公司\r', '63.78.214.55', '2021-02-26 02:31:12', 1);
INSERT INTO `t_record` VALUES (387, ' 美国 Microsoft数据中心\r', '20.193.49.40', '2021-02-26 03:11:41', 1);
INSERT INTO `t_record` VALUES (388, ' 美国 加利福尼亚州弗里蒙特市Hurricane Electric公司\r', '184.105.247.252', '2021-02-26 03:38:27', 1);
INSERT INTO `t_record` VALUES (389, ' 美国 Microsoft公司\r', '13.68.130.242', '2021-02-27 00:35:24', 3);
INSERT INTO `t_record` VALUES (390, ' 美国 Google\r', '66.249.73.142', '2021-02-26 07:09:48', 1);
INSERT INTO `t_record` VALUES (391, ' 海南省 联通\r', '150.255.11.185', '2021-02-26 07:11:44', 1);
INSERT INTO `t_record` VALUES (392, ' 青海省西宁市 电信\r', '110.167.215.254', '2021-02-26 07:11:48', 1);
INSERT INTO `t_record` VALUES (393, ' 上海市 联通\r', '223.166.75.163', '2021-02-26 07:11:49', 1);
INSERT INTO `t_record` VALUES (394, ' 天津市 电信\r', '36.106.167.127', '2021-02-26 07:11:49', 1);
INSERT INTO `t_record` VALUES (395, ' 陕西省西安市 电信\r', '1.85.219.43', '2021-02-26 07:11:50', 1);
INSERT INTO `t_record` VALUES (396, ' 广西南宁市 联通\r', '171.37.37.189', '2021-02-26 07:11:54', 1);
INSERT INTO `t_record` VALUES (397, ' 意大利  CZ88.NET\r', '185.168.173.121', '2021-02-26 07:29:57', 1);
INSERT INTO `t_record` VALUES (398, ' 荷兰 北荷兰省阿姆斯特丹DigitalOcean数据中心\r', '178.62.217.198', '2021-02-26 07:43:23', 1);
INSERT INTO `t_record` VALUES (399, ' 美国 华盛顿州西雅图市亚马逊(Amazon)公司数据中心\r', '35.161.206.183', '2021-02-26 08:02:36', 1);
INSERT INTO `t_record` VALUES (400, ' 广东省 联通数据上网公共出口\r', '112.96.115.88', '2021-02-26 08:49:18', 1);
INSERT INTO `t_record` VALUES (401, ' 美国  CZ88.NET\r', '162.142.125.38', '2021-02-26 08:52:38', 2);
INSERT INTO `t_record` VALUES (402, ' 哥伦比亚  CZ88.NET\r', '200.116.168.241', '2021-02-26 08:52:55', 1);
INSERT INTO `t_record` VALUES (403, ' 湖北省武汉市 电信\r', '111.175.56.149', '2021-02-26 08:53:57', 3);
INSERT INTO `t_record` VALUES (404, ' 美国 加利福尼亚州洛杉矶Zenlayer数据中心\r', '128.14.209.146', '2021-02-26 08:54:17', 1);
INSERT INTO `t_record` VALUES (405, ' 山西省吕梁市 联通\r', '118.77.110.197', '2021-02-26 16:21:48', 4);
INSERT INTO `t_record` VALUES (406, ' 广东省揭阳市 电信\r', '113.107.33.142', '2021-02-26 09:39:01', 1);
INSERT INTO `t_record` VALUES (407, ' 巴勒斯坦  CZ88.NET\r', '85.184.46.252', '2021-02-26 09:44:43', 1);
INSERT INTO `t_record` VALUES (408, ' 巴勒斯坦  CZ88.NET\r', '85.184.46.252', '2021-02-26 09:44:43', 1);
INSERT INTO `t_record` VALUES (409, ' 巴勒斯坦  CZ88.NET\r', '85.184.46.252', '2021-02-26 09:44:43', 1);
INSERT INTO `t_record` VALUES (410, ' 巴勒斯坦  CZ88.NET\r', '85.184.46.252', '2021-02-26 09:44:43', 1);
INSERT INTO `t_record` VALUES (411, ' 上海市 阿里云\r', '47.100.7.25', '2021-02-26 09:45:25', 1);
INSERT INTO `t_record` VALUES (412, ' 浙江省绍兴市 电信\r', '115.239.182.206', '2021-02-26 10:02:34', 1);
INSERT INTO `t_record` VALUES (413, ' 广东省深圳市南山区 电信\r', '119.137.54.56', '2021-02-26 10:14:11', 1);
INSERT INTO `t_record` VALUES (414, ' 湖南省长沙市 电信\r', '175.7.94.206', '2021-02-26 10:16:43', 1);
INSERT INTO `t_record` VALUES (415, ' 美国 俄勒冈州波特兰Amazon数据中心\r', '54.213.4.47', '2021-02-26 10:23:08', 1);
INSERT INTO `t_record` VALUES (416, ' 山东省烟台市 电信\r', '58.59.30.226', '2021-02-26 10:34:29', 1);
INSERT INTO `t_record` VALUES (417, ' 河北省石家庄市 电信\r', '222.222.38.4', '2021-02-26 10:40:00', 1);
INSERT INTO `t_record` VALUES (418, ' 福建省厦门市 电信\r', '27.154.242.142', '2021-02-26 10:41:16', 1);
INSERT INTO `t_record` VALUES (419, ' 中国 移动\r', '120.245.122.43', '2021-02-26 11:00:33', 1);
INSERT INTO `t_record` VALUES (420, ' 山东省 联通\r', '123.133.105.117', '2021-02-26 11:11:10', 1);
INSERT INTO `t_record` VALUES (421, ' 陕西省西安市 电信\r', '117.22.186.11', '2021-02-26 11:39:22', 1);
INSERT INTO `t_record` VALUES (422, ' 浙江省杭州市 阿里云\r', '47.102.44.141', '2021-02-26 11:40:30', 1);
INSERT INTO `t_record` VALUES (423, ' 北京市 北京金山云网络技术有限公司\r', '120.92.72.116', '2021-02-26 11:40:50', 1);
INSERT INTO `t_record` VALUES (424, ' 湖南省衡阳市 电信\r', '124.228.65.134', '2021-02-26 11:45:43', 1);
INSERT INTO `t_record` VALUES (425, ' 浙江省杭州市 华数传媒家庭宽带\r', '58.101.150.54', '2021-02-26 12:48:08', 1);
INSERT INTO `t_record` VALUES (426, ' 加拿大 安大略省多伦多Bell\r', '174.89.34.115', '2021-02-26 13:21:31', 1);
INSERT INTO `t_record` VALUES (427, ' 美国 俄勒冈州波特兰Amazon数据中心\r', '34.238.115.94', '2021-02-26 13:23:18', 1);
INSERT INTO `t_record` VALUES (428, ' 河南省郑州市 联通\r', '115.60.11.173', '2021-02-26 14:02:43', 1);
INSERT INTO `t_record` VALUES (429, ' 湖南省邵阳市 电信\r', '113.220.25.69', '2021-02-26 18:41:59', 2);
INSERT INTO `t_record` VALUES (430, ' 哥伦比亚  CZ88.NET\r', '181.143.221.21', '2021-02-26 15:57:39', 1);
INSERT INTO `t_record` VALUES (431, ' 俄罗斯  CZ88.NET\r', '5.8.10.202', '2021-02-26 16:33:45', 2);
INSERT INTO `t_record` VALUES (432, ' 荷兰  CZ88.NET\r', '89.248.171.23', '2021-02-26 16:33:57', 1);
INSERT INTO `t_record` VALUES (433, ' 欧盟  CZ88.NET\r', '45.87.95.237', '2021-02-26 16:36:12', 1);
INSERT INTO `t_record` VALUES (434, ' 伊朗  CZ88.NET\r', '188.253.40.176', '2021-02-26 18:00:23', 1);
INSERT INTO `t_record` VALUES (435, ' 云南省昆明市 电信\r', '220.163.33.134', '2021-02-26 18:39:10', 1);
INSERT INTO `t_record` VALUES (436, ' 甘肃省白银市 电信\r', '27.224.137.59', '2021-02-26 18:39:14', 1);
INSERT INTO `t_record` VALUES (437, ' 天津市 电信\r', '36.106.166.2', '2021-02-26 18:39:14', 1);
INSERT INTO `t_record` VALUES (438, ' 广西南宁市 联通\r', '171.36.247.242', '2021-02-26 18:39:16', 1);
INSERT INTO `t_record` VALUES (439, ' 甘肃省 联通\r', '220.200.152.245', '2021-02-26 18:39:16', 1);
INSERT INTO `t_record` VALUES (440, ' 天津市 电信\r', '36.106.167.203', '2021-02-26 18:39:17', 1);
INSERT INTO `t_record` VALUES (441, ' 湖南省永州市 联通\r', '220.202.249.95', '2021-02-26 19:04:09', 1);
INSERT INTO `t_record` VALUES (442, ' 巴勒斯坦  CZ88.NET\r', '46.244.68.93', '2021-02-26 19:21:54', 3);
INSERT INTO `t_record` VALUES (443, ' 江苏省常州市 移动数据上网公共出口\r', '117.136.46.129', '2021-02-26 19:34:09', 1);
INSERT INTO `t_record` VALUES (444, ' 黑龙江省齐齐哈尔市 电信\r', '112.98.24.159', '2021-02-26 19:54:30', 1);
INSERT INTO `t_record` VALUES (445, ' 美国  CZ88.NET\r', '104.140.188.34', '2021-02-26 20:19:50', 1);
INSERT INTO `t_record` VALUES (446, ' 美国  CZ88.NET\r', '45.144.177.140', '2021-02-26 20:42:28', 1);
INSERT INTO `t_record` VALUES (447, ' 浙江省杭州市 阿里云\r', '47.101.200.122', '2021-02-26 21:31:11', 1);
INSERT INTO `t_record` VALUES (448, ' 河南省 移动\r', '223.90.115.168', '2021-02-26 22:54:45', 2);
INSERT INTO `t_record` VALUES (449, ' 广东省广州市 电信\r', '119.131.217.248', '2021-02-26 22:22:38', 1);
INSERT INTO `t_record` VALUES (450, ' 浙江省杭州市 阿里云\r', '47.103.14.133', '2021-02-27 00:07:55', 1);
INSERT INTO `t_record` VALUES (451, ' 广东省江门市新会区 联通\r', '58.252.175.184', '2021-02-27 00:31:04', 2);
INSERT INTO `t_record` VALUES (452, ' 天津市 移动数据上网公共出口\r', '223.104.7.128', '2021-02-27 00:38:20', 1);
INSERT INTO `t_record` VALUES (453, ' 印度尼西亚  CZ88.NET\r', '36.68.181.204', '2021-02-27 01:20:40', 1);
INSERT INTO `t_record` VALUES (454, ' 挪威  CZ88.NET\r', '185.173.35.9', '2021-02-27 01:33:58', 1);
INSERT INTO `t_record` VALUES (455, ' 北美地区  CZ88.NET\r', '138.122.20.91', '2021-02-27 01:44:26', 1);
INSERT INTO `t_record` VALUES (456, ' 北京市 鹏博士长城宽带\r', '124.204.54.61', '2021-02-27 01:50:56', 1);
INSERT INTO `t_record` VALUES (457, ' 浙江省杭州市 阿里云\r', '47.101.47.147', '2021-02-27 02:15:47', 1);
INSERT INTO `t_record` VALUES (458, ' 浙江省杭州市 阿里云\r', '47.101.145.173', '2021-02-27 02:17:03', 1);
INSERT INTO `t_record` VALUES (459, ' 北京市 北京百度网讯科技有限公司BGP节点\r', '180.76.113.102', '2021-02-27 03:44:12', 2);
INSERT INTO `t_record` VALUES (460, ' 美国 加利福尼亚州弗里蒙特市Hurricane Electric公司\r', '184.105.139.67', '2021-02-27 02:39:56', 1);
INSERT INTO `t_record` VALUES (461, ' 河南省郑州市 移动\r', '223.88.73.130', '2021-02-27 03:02:02', 1);
INSERT INTO `t_record` VALUES (462, ' 北京市 联通\r', '111.204.176.252', '2021-02-27 03:15:39', 1);
INSERT INTO `t_record` VALUES (463, ' 伊朗  CZ88.NET\r', '2.183.108.25', '2021-02-27 03:29:18', 1);
INSERT INTO `t_record` VALUES (464, ' 上海市 阿里云\r', '101.132.177.14', '2021-02-27 06:11:59', 2);
INSERT INTO `t_record` VALUES (465, ' 浙江省 电信中心网络\r', '183.136.225.56', '2021-03-03 13:25:20', 5);
INSERT INTO `t_record` VALUES (466, ' 广东省东莞市 移动\r', '223.104.63.231', '2021-02-27 06:54:10', 2);
INSERT INTO `t_record` VALUES (467, ' 美国  CZ88.NET\r', '167.71.90.18', '2021-02-27 07:42:29', 3);
INSERT INTO `t_record` VALUES (468, ' 葡萄牙  CZ88.NET\r', '80.172.233.27', '2021-02-27 07:14:34', 1);
INSERT INTO `t_record` VALUES (469, ' 日本 东京都品川区Linode数据中心\r', '139.162.119.197', '2021-02-27 07:18:54', 1);
INSERT INTO `t_record` VALUES (470, ' 浙江省杭州市 电信\r', '60.191.125.35', '2021-02-27 07:44:21', 1);
INSERT INTO `t_record` VALUES (471, ' 俄罗斯  CZ88.NET\r', '185.209.70.5', '2021-02-27 08:23:46', 1);
INSERT INTO `t_record` VALUES (472, ' 伊朗  CZ88.NET\r', '5.235.208.129', '2021-02-27 08:47:14', 1);
INSERT INTO `t_record` VALUES (473, ' 澳大利亚 Vodafone(沃达丰)通信有限公司\r', '120.23.25.211', '2021-02-27 09:47:08', 1);
INSERT INTO `t_record` VALUES (474, ' 北京市 合聚数字技术\r', '121.79.135.146', '2021-02-27 10:13:27', 1);
INSERT INTO `t_record` VALUES (475, ' 美国 俄勒冈州波特兰Amazon数据中心\r', '52.36.106.134', '2021-02-27 10:21:15', 1);
INSERT INTO `t_record` VALUES (476, ' 辽宁省盘锦市 电信\r', '59.45.19.98', '2021-02-27 11:02:14', 1);
INSERT INTO `t_record` VALUES (477, ' 辽宁省葫芦岛市 联通\r', '175.148.64.114', '2021-02-27 11:07:53', 1);
INSERT INTO `t_record` VALUES (478, ' 上海市 阿里云\r', '47.100.9.101', '2021-02-27 12:31:53', 7);
INSERT INTO `t_record` VALUES (479, ' 美国 加利福尼亚州洛杉矶市Coperation Coloction数据中心\r', '192.151.192.114', '2021-02-27 16:52:34', 2);
INSERT INTO `t_record` VALUES (480, ' 浙江省杭州市 阿里云\r', '47.101.59.104', '2021-02-27 12:48:48', 1);
INSERT INTO `t_record` VALUES (481, ' 四川省成都市 西南民族大学\r', '222.210.14.73', '2021-02-27 13:01:26', 1);
INSERT INTO `t_record` VALUES (482, ' 土耳其  CZ88.NET\r', '213.43.34.210', '2021-02-27 13:12:11', 1);
INSERT INTO `t_record` VALUES (483, ' 广东省深圳市 电信\r', '113.98.191.137', '2021-02-27 13:57:21', 1);
INSERT INTO `t_record` VALUES (484, ' 北京市 移动\r', '120.244.202.224', '2021-02-27 14:05:04', 3);
INSERT INTO `t_record` VALUES (485, ' 美国  CZ88.NET\r', '162.142.125.37', '2021-02-27 14:12:57', 2);
INSERT INTO `t_record` VALUES (486, ' 陕西省西安市 电信\r', '222.90.155.77', '2021-02-27 15:03:18', 1);
INSERT INTO `t_record` VALUES (487, ' 广东省湛江市 电信\r', '14.16.131.165', '2021-02-27 16:05:41', 2);
INSERT INTO `t_record` VALUES (488, ' 英国 伦敦Linode数据中心\r', '139.162.215.70', '2021-02-27 15:51:24', 1);
INSERT INTO `t_record` VALUES (489, ' 江苏省淮安市 电信\r', '180.125.99.80', '2021-02-27 15:59:53', 1);
INSERT INTO `t_record` VALUES (490, ' 江苏省淮安市 电信\r', '180.125.99.80', '2021-02-27 15:59:54', 1);
INSERT INTO `t_record` VALUES (491, ' 比利时  CZ88.NET\r', '87.64.122.149', '2021-02-27 17:34:48', 1);
INSERT INTO `t_record` VALUES (492, ' 中国 移动\r', '117.136.117.123', '2021-02-27 17:59:52', 3);
INSERT INTO `t_record` VALUES (493, ' 山西省太原市 电信\r', '223.12.140.163', '2021-02-27 18:06:59', 1);
INSERT INTO `t_record` VALUES (494, ' 上海市 UCloud BGP数据中心\r', '106.75.245.121', '2021-03-04 02:21:03', 12);
INSERT INTO `t_record` VALUES (495, ' 南非  CZ88.NET\r', '102.182.190.218', '2021-02-27 19:44:58', 1);
INSERT INTO `t_record` VALUES (496, ' 重庆市 联通\r', '27.13.240.72', '2021-02-27 21:19:45', 2);
INSERT INTO `t_record` VALUES (497, ' 浙江省杭州市 阿里云\r', '39.96.138.63', '2021-02-27 21:36:45', 1);
INSERT INTO `t_record` VALUES (498, ' 广东省东莞市 鹏博士长城宽带\r', '101.247.214.57', '2021-02-27 22:18:38', 1);
INSERT INTO `t_record` VALUES (499, ' 美国 加利福尼亚州旧金山DigitalOcean数据中心\r', '192.241.228.246', '2021-02-27 22:50:31', 1);
INSERT INTO `t_record` VALUES (500, ' 美国 加利福尼亚州弗里蒙特市Hurricane Electric公司\r', '65.49.20.68', '2021-02-27 23:02:17', 1);
INSERT INTO `t_record` VALUES (501, ' 美国 得克萨斯州\r', '34.77.162.3', '2021-02-27 23:14:41', 1);
INSERT INTO `t_record` VALUES (502, ' 罗马尼亚  CZ88.NET\r', '91.239.130.31', '2021-02-27 23:37:35', 1);
INSERT INTO `t_record` VALUES (503, ' 巴西  CZ88.NET\r', '186.226.162.177', '2021-02-28 00:55:26', 1);
INSERT INTO `t_record` VALUES (504, ' 美国 Microsoft公司\r', '157.55.39.149', '2021-03-03 22:17:41', 3);
INSERT INTO `t_record` VALUES (505, ' 湖北省武汉市 电信\r', '58.49.170.19', '2021-02-28 01:46:58', 2);
INSERT INTO `t_record` VALUES (506, ' 浙江省杭州市 阿里云\r', '47.102.127.80', '2021-02-28 02:41:35', 1);
INSERT INTO `t_record` VALUES (507, ' 广东省东莞市 鹏博士长城宽带\r', '101.247.240.222', '2021-02-28 05:10:40', 1);
INSERT INTO `t_record` VALUES (508, ' 美国 Merit网络公司\r', '35.237.58.105', '2021-02-28 06:26:35', 1);
INSERT INTO `t_record` VALUES (509, ' 美国  CZ88.NET\r', '167.248.133.37', '2021-02-28 06:44:39', 2);
INSERT INTO `t_record` VALUES (510, ' 孟加拉  CZ88.NET\r', '103.17.181.169', '2021-02-28 07:03:49', 1);
INSERT INTO `t_record` VALUES (511, ' 亚美尼亚  CZ88.NET\r', '93.94.217.184', '2021-02-28 07:36:30', 1);
INSERT INTO `t_record` VALUES (512, ' 巴西 圣保罗\r', '200.185.218.59', '2021-02-28 08:09:28', 1);
INSERT INTO `t_record` VALUES (513, ' 美国 纽约市DigitalOcean云公司\r', '138.197.99.204', '2021-02-28 09:39:34', 1);
INSERT INTO `t_record` VALUES (514, ' 美国  CZ88.NET\r', '44.234.150.43', '2021-02-28 10:20:38', 1);
INSERT INTO `t_record` VALUES (515, ' 浙江省杭州市 阿里云\r', '47.102.143.149', '2021-03-03 13:32:21', 2);
INSERT INTO `t_record` VALUES (516, ' 浙江省杭州市 阿里云\r', '47.101.200.166', '2021-02-28 11:25:06', 1);
INSERT INTO `t_record` VALUES (517, ' 英国 社会保险安全部\r', '51.254.59.113', '2021-02-28 12:09:51', 1);
INSERT INTO `t_record` VALUES (518, ' 蒙古 Gemnet.mn\r', '180.149.125.163', '2021-02-28 14:50:18', 1);
INSERT INTO `t_record` VALUES (519, ' 日本 Linode数据中心\r', '172.104.108.243', '2021-02-28 15:01:09', 1);
INSERT INTO `t_record` VALUES (520, ' 上海市 阿里云\r', '47.100.36.216', '2021-02-28 15:50:20', 1);
INSERT INTO `t_record` VALUES (521, ' 美国  CZ88.NET\r', '23.129.64.216', '2021-02-28 15:59:11', 1);
INSERT INTO `t_record` VALUES (522, ' 中国 移动\r', '111.18.40.33', '2021-02-28 16:16:47', 1);
INSERT INTO `t_record` VALUES (523, ' 北京市丰台区 联通\r', '124.64.18.162', '2021-02-28 16:25:58', 1);
INSERT INTO `t_record` VALUES (524, ' 北京市 鹏博士宽带\r', '121.69.88.230', '2021-02-28 16:43:12', 2);
INSERT INTO `t_record` VALUES (525, ' 河南省郑州市 联通\r', '115.61.250.219', '2021-02-28 16:50:01', 1);
INSERT INTO `t_record` VALUES (526, ' 上海市 电信\r', '180.163.220.66', '2021-02-28 18:33:20', 2);
INSERT INTO `t_record` VALUES (527, ' 浙江省金华市 移动\r', '39.187.232.124', '2021-02-28 18:06:09', 1);
INSERT INTO `t_record` VALUES (528, ' 山西省长治市 移动\r', '120.208.109.139', '2021-02-28 18:32:36', 4);
INSERT INTO `t_record` VALUES (529, ' 上海市 阿里云\r', '101.133.154.232', '2021-02-28 18:30:54', 1);
INSERT INTO `t_record` VALUES (530, ' 上海市 电信\r', '180.163.220.4', '2021-02-28 18:33:20', 1);
INSERT INTO `t_record` VALUES (531, ' 美国  CZ88.NET\r', '68.183.146.218', '2021-02-28 18:56:36', 1);
INSERT INTO `t_record` VALUES (532, ' 山东省临沂市 电信\r', '113.122.246.76', '2021-02-28 19:20:19', 1);
INSERT INTO `t_record` VALUES (533, ' 浙江省温州市 电信\r', '115.219.32.228', '2021-02-28 19:55:13', 1);
INSERT INTO `t_record` VALUES (534, ' 德国  CZ88.NET\r', '194.127.178.206', '2021-02-28 20:11:52', 1);
INSERT INTO `t_record` VALUES (535, ' 江西省宜春市 移动\r', '117.167.193.222', '2021-02-28 20:14:20', 1);
INSERT INTO `t_record` VALUES (536, ' 北京市海淀区 北京首都在线科技股份有限公司电信\r', '101.251.242.238', '2021-02-28 21:35:20', 1);
INSERT INTO `t_record` VALUES (537, ' 浙江省杭州市 阿里云\r', '47.102.41.108', '2021-02-28 21:40:11', 1);
INSERT INTO `t_record` VALUES (538, ' 陕西省西安市 电信\r', '36.40.141.95', '2021-02-28 22:05:30', 3);
INSERT INTO `t_record` VALUES (539, ' 陕西省西安市 鹏博士长城宽带\r', '49.221.32.109', '2021-02-28 22:13:50', 1);
INSERT INTO `t_record` VALUES (540, ' 上海市 阿里云\r', '106.15.95.120', '2021-02-28 22:20:29', 1);
INSERT INTO `t_record` VALUES (541, ' 巴西  CZ88.NET\r', '179.118.238.115', '2021-02-28 22:54:50', 1);
INSERT INTO `t_record` VALUES (542, ' 乌克兰  CZ88.NET\r', '77.222.130.97', '2021-02-28 23:13:46', 1);
INSERT INTO `t_record` VALUES (543, ' 格鲁吉亚  CZ88.NET\r', '188.169.77.175', '2021-03-01 00:13:25', 1);
INSERT INTO `t_record` VALUES (544, ' 美国 加利福尼亚州弗里蒙特市Hurricane Electric公司\r', '74.82.47.4', '2021-03-01 00:44:14', 1);
INSERT INTO `t_record` VALUES (545, ' 英国 社会保险安全部\r', '51.222.43.158', '2021-03-01 01:40:36', 3);
INSERT INTO `t_record` VALUES (546, ' 欧盟  CZ88.NET\r', '45.87.61.188', '2021-03-01 01:56:52', 1);
INSERT INTO `t_record` VALUES (547, ' 上海市 阿里云\r', '101.132.102.45', '2021-03-01 04:19:37', 1);
INSERT INTO `t_record` VALUES (548, ' 美国  CZ88.NET\r', '96.60.15.157', '2021-03-01 05:48:14', 1);
INSERT INTO `t_record` VALUES (549, ' 浙江省杭州市 阿里云\r', '47.101.56.197', '2021-03-01 06:58:36', 1);
INSERT INTO `t_record` VALUES (550, ' 广东省茂名市 电信\r', '183.0.214.25', '2021-03-01 08:04:49', 1);
INSERT INTO `t_record` VALUES (551, ' 河南省洛阳市 电信\r', '123.149.141.119', '2021-03-01 08:05:20', 1);
INSERT INTO `t_record` VALUES (552, ' 四川省成都市  CZ88.NET\r', '148.70.46.235', '2021-03-01 08:34:59', 1);
INSERT INTO `t_record` VALUES (553, ' 美国  CZ88.NET\r', '45.144.225.116', '2021-03-02 06:40:22', 2);
INSERT INTO `t_record` VALUES (554, ' 美国 俄勒冈州波特兰Amazon数据中心\r', '54.186.211.194', '2021-03-01 10:14:01', 1);
INSERT INTO `t_record` VALUES (555, ' 美国 弗吉尼亚州阿什本Amazon数据中心\r', '54.167.20.187', '2021-03-01 10:25:51', 1);
INSERT INTO `t_record` VALUES (556, ' 美国 纽约DigitalOcean数据中心\r', '159.203.70.245', '2021-03-01 10:30:14', 1);
INSERT INTO `t_record` VALUES (557, ' 欧盟  CZ88.NET\r', '45.85.90.99', '2021-03-01 10:41:57', 1);
INSERT INTO `t_record` VALUES (558, ' 北美地区  CZ88.NET\r', '138.122.20.92', '2021-03-01 11:10:06', 1);
INSERT INTO `t_record` VALUES (559, ' 甘肃省兰州市 联通\r', '180.95.231.100', '2021-03-01 11:54:35', 1);
INSERT INTO `t_record` VALUES (560, ' 甘肃省兰州市 联通\r', '180.95.231.117', '2021-03-01 11:54:37', 1);
INSERT INTO `t_record` VALUES (561, ' 辽宁省沈阳市 联通\r', '119.118.12.247', '2021-03-01 11:54:38', 1);
INSERT INTO `t_record` VALUES (562, ' 甘肃省兰州市 联通\r', '60.13.6.111', '2021-03-01 11:54:40', 1);
INSERT INTO `t_record` VALUES (563, ' 天津市 联通\r', '111.162.145.178', '2021-03-01 11:54:41', 1);
INSERT INTO `t_record` VALUES (564, ' 新疆 移动数据上网公共出口\r', '223.104.30.232', '2021-03-01 11:54:52', 1);
INSERT INTO `t_record` VALUES (565, ' 浙江省杭州市 阿里云\r', '47.101.200.88', '2021-03-01 11:57:47', 1);
INSERT INTO `t_record` VALUES (566, ' 江苏省苏州市太仓市 电信\r', '218.4.41.188', '2021-03-01 12:25:14', 3);
INSERT INTO `t_record` VALUES (567, ' 河南省南阳市 移动\r', '223.91.83.44', '2021-03-01 12:45:22', 2);
INSERT INTO `t_record` VALUES (568, ' 河南省郑州市 联通\r', '42.237.33.222', '2021-03-01 12:56:38', 2);
INSERT INTO `t_record` VALUES (569, ' 上海市 电信\r', '101.89.19.197', '2021-03-01 13:07:13', 1);
INSERT INTO `t_record` VALUES (570, ' 浙江省杭州市 阿里云\r', '47.101.186.114', '2021-03-01 13:52:18', 1);
INSERT INTO `t_record` VALUES (571, ' 浙江省杭州市 阿里云\r', '47.101.202.55', '2021-03-03 11:03:17', 2);
INSERT INTO `t_record` VALUES (572, ' 河北省邢台市 电信\r', '222.223.124.242', '2021-03-01 14:03:43', 1);
INSERT INTO `t_record` VALUES (573, ' 上海市 阿里云\r', '106.15.52.246', '2021-03-01 14:21:33', 1);
INSERT INTO `t_record` VALUES (574, ' 中国 移动\r', '120.224.111.172', '2021-03-01 15:13:35', 1);
INSERT INTO `t_record` VALUES (575, ' 广东省 移动\r', '120.231.37.30', '2021-03-01 15:17:56', 1);
INSERT INTO `t_record` VALUES (576, ' 上海市 移动\r', '120.204.17.70', '2021-03-01 15:24:25', 1);
INSERT INTO `t_record` VALUES (577, ' 亚太地区  CZ88.NET\r', '103.141.174.130', '2021-03-01 15:28:07', 1);
INSERT INTO `t_record` VALUES (578, ' 河南省郑州市 联通\r', '115.61.204.182', '2021-03-01 16:10:26', 1);
INSERT INTO `t_record` VALUES (579, ' 浙江省宁波市慈溪市 电信\r', '60.190.11.106', '2021-03-01 16:11:51', 2);
INSERT INTO `t_record` VALUES (580, ' 浙江省杭州市 阿里云\r', '47.101.195.248', '2021-03-01 16:18:53', 1);
INSERT INTO `t_record` VALUES (581, ' 江苏省淮安市 联通\r', '153.99.32.66', '2021-03-01 16:33:53', 2);
INSERT INTO `t_record` VALUES (582, ' 浙江省绍兴市 电信\r', '122.224.38.50', '2021-03-01 16:52:11', 1);
INSERT INTO `t_record` VALUES (583, ' 上海市长宁区 /普陀区电信\r', '116.236.190.197', '2021-03-01 17:22:46', 1);
INSERT INTO `t_record` VALUES (584, ' 江苏省苏州市 移动\r', '112.3.215.8', '2021-03-01 17:40:22', 2);
INSERT INTO `t_record` VALUES (585, ' 浙江省 电信\r', '36.112.10.102', '2021-03-01 17:44:35', 1);
INSERT INTO `t_record` VALUES (586, ' 加拿大  CZ88.NET\r', '142.93.244.247', '2021-03-01 17:50:54', 1);
INSERT INTO `t_record` VALUES (587, ' 北京市 移动\r', '39.155.186.231', '2021-03-01 18:00:36', 1);
INSERT INTO `t_record` VALUES (588, ' 北京市 联通\r', '111.198.190.132', '2021-03-01 18:24:02', 1);
INSERT INTO `t_record` VALUES (589, ' 伊朗  CZ88.NET\r', '87.107.143.153', '2021-03-01 18:26:27', 1);
INSERT INTO `t_record` VALUES (590, ' 北京市 新国信通信有限公司\r', '116.163.11.34', '2021-03-01 18:27:20', 1);
INSERT INTO `t_record` VALUES (591, ' 陕西省西安市 电信\r', '124.114.141.62', '2021-03-01 18:38:16', 1);
INSERT INTO `t_record` VALUES (592, ' 黑龙江省 移动(全省通用)\r', '111.43.248.116', '2021-03-01 18:45:16', 1);
INSERT INTO `t_record` VALUES (593, ' 湖南省长沙市 电信\r', '175.9.102.235', '2021-03-01 18:48:58', 1);
INSERT INTO `t_record` VALUES (594, ' 中国 移动\r', '120.242.179.54', '2021-03-01 19:39:55', 1);
INSERT INTO `t_record` VALUES (595, ' 安徽省合肥市 电信\r', '36.7.80.38', '2021-03-01 19:42:41', 1);
INSERT INTO `t_record` VALUES (596, ' 北京市 移动\r', '39.149.230.91', '2021-03-01 20:53:44', 3);
INSERT INTO `t_record` VALUES (597, ' 江苏省苏州市常熟市 电信\r', '221.225.79.187', '2021-03-01 21:10:14', 1);
INSERT INTO `t_record` VALUES (598, ' 浙江省杭州市 电信\r', '125.121.238.138', '2021-03-01 22:21:08', 1);
INSERT INTO `t_record` VALUES (599, ' 湖北省荆州市 联通\r', '183.93.26.74', '2021-03-01 22:33:06', 1);
INSERT INTO `t_record` VALUES (600, ' 欧盟  CZ88.NET\r', '45.85.90.170', '2021-03-01 23:15:02', 1);
INSERT INTO `t_record` VALUES (601, ' 北京市 移动\r', '120.244.40.37', '2021-03-02 00:09:25', 1);
INSERT INTO `t_record` VALUES (602, ' 美国 圣安娜Krypt机房\r', '98.126.155.250', '2021-03-02 00:53:38', 1);
INSERT INTO `t_record` VALUES (603, ' 山东省烟台市 联通\r', '112.238.29.225', '2021-03-02 00:58:29', 1);
INSERT INTO `t_record` VALUES (604, ' 摩尔多瓦  CZ88.NET\r', '185.191.171.5', '2021-03-02 01:32:14', 1);
INSERT INTO `t_record` VALUES (605, ' 湖北省武汉市 电信\r', '27.17.177.111', '2021-03-02 02:05:05', 2);
INSERT INTO `t_record` VALUES (606, ' 浙江省杭州市 阿里云\r', '47.102.202.162', '2021-03-02 02:19:49', 1);
INSERT INTO `t_record` VALUES (607, ' 浙江省杭州市 阿里云\r', '47.103.130.184', '2021-03-02 02:21:15', 1);
INSERT INTO `t_record` VALUES (608, ' 亚太地区  CZ88.NET\r', '103.75.41.149', '2021-03-02 03:16:50', 1);
INSERT INTO `t_record` VALUES (609, ' 上海市 阿里云\r', '101.133.148.206', '2021-03-02 03:45:21', 1);
INSERT INTO `t_record` VALUES (610, ' 浙江省杭州市 阿里云\r', '47.97.204.168', '2021-03-02 03:56:51', 1);
INSERT INTO `t_record` VALUES (611, ' 浙江省杭州市 阿里云\r', '47.97.120.5', '2021-03-02 04:03:05', 1);
INSERT INTO `t_record` VALUES (612, ' 浙江省台州市 移动\r', '39.182.130.27', '2021-03-02 04:08:58', 1);
INSERT INTO `t_record` VALUES (613, ' 美国 Google\r', '66.249.75.48', '2021-03-03 18:19:14', 18);
INSERT INTO `t_record` VALUES (614, ' 浙江省 电信中心网络\r', '183.136.225.42', '2021-03-02 04:47:09', 2);
INSERT INTO `t_record` VALUES (615, ' 伊朗  CZ88.NET\r', '86.57.23.79', '2021-03-02 05:01:34', 1);
INSERT INTO `t_record` VALUES (616, ' 北京市 阿里云\r', '47.93.180.168', '2021-03-02 05:44:13', 1);
INSERT INTO `t_record` VALUES (617, ' 江苏省南京市 电信\r', '180.111.116.20', '2021-03-02 05:55:15', 1);
INSERT INTO `t_record` VALUES (618, ' 美国 加利福尼亚州旧金山DigitalOcean数据中心\r', '192.241.219.226', '2021-03-02 06:32:37', 1);
INSERT INTO `t_record` VALUES (619, ' 浙江省杭州市 阿里云\r', '47.110.180.67', '2021-03-03 07:24:04', 24);
INSERT INTO `t_record` VALUES (620, ' 浙江省杭州市 阿里云\r', '47.110.180.65', '2021-03-03 07:22:12', 24);
INSERT INTO `t_record` VALUES (621, ' 美国 Google\r', '66.249.75.46', '2021-03-03 20:14:45', 12);
INSERT INTO `t_record` VALUES (622, ' 浙江省杭州市 阿里云\r', '47.101.200.11', '2021-03-02 10:41:48', 2);
INSERT INTO `t_record` VALUES (623, ' 辽宁省沈阳市沈河区 电信\r', '123.245.25.181', '2021-03-02 08:08:39', 1);
INSERT INTO `t_record` VALUES (624, ' 广西河池市 电信\r', '124.227.31.230', '2021-03-02 08:08:44', 1);
INSERT INTO `t_record` VALUES (625, ' 陕西省西安市 联通\r', '220.200.162.246', '2021-03-02 08:08:45', 1);
INSERT INTO `t_record` VALUES (626, ' 云南省昆明市 电信\r', '222.221.154.59', '2021-03-02 08:08:45', 1);
INSERT INTO `t_record` VALUES (627, ' 河南省郑州市 联通\r', '61.52.73.126', '2021-03-02 08:08:44', 1);
INSERT INTO `t_record` VALUES (628, ' 墨西哥  CZ88.NET\r', '189.173.19.151', '2021-03-02 08:26:22', 1);
INSERT INTO `t_record` VALUES (629, ' 荷兰  CZ88.NET\r', '89.248.174.24', '2021-03-03 14:41:57', 2);
INSERT INTO `t_record` VALUES (630, ' 亚太地区  CZ88.NET\r', '103.141.136.70', '2021-03-02 08:50:55', 1);
INSERT INTO `t_record` VALUES (631, ' 广东省汕头市 移动\r', '120.229.244.216', '2021-03-02 09:30:47', 1);
INSERT INTO `t_record` VALUES (632, ' 美国  CZ88.NET\r', '104.140.188.2', '2021-03-02 09:34:05', 1);
INSERT INTO `t_record` VALUES (633, ' 安徽省 联通\r', '36.33.216.189', '2021-03-02 10:00:52', 1);
INSERT INTO `t_record` VALUES (634, ' 江苏省南京市 电信\r', '180.111.106.40', '2021-03-02 10:01:22', 1);
INSERT INTO `t_record` VALUES (635, ' 俄罗斯  CZ88.NET\r', '185.191.32.207', '2021-03-02 10:16:23', 1);
INSERT INTO `t_record` VALUES (636, ' 美国  CZ88.NET\r', '44.232.183.25', '2021-03-02 10:22:21', 1);
INSERT INTO `t_record` VALUES (637, ' 美国 Google\r', '66.249.75.50', '2021-03-03 16:23:12', 16);
INSERT INTO `t_record` VALUES (638, ' 上海市 电信\r', '114.88.235.1', '2021-03-02 10:51:58', 1);
INSERT INTO `t_record` VALUES (639, ' 英国 伦敦DigitalOcean数据中心\r', '178.62.80.38', '2021-03-02 11:12:38', 1);
INSERT INTO `t_record` VALUES (640, ' 美国 华盛顿州西雅图市亚马逊(Amazon)公司数据中心\r', '35.177.213.49', '2021-03-02 11:16:02', 1);
INSERT INTO `t_record` VALUES (641, ' 河南省郑州市 联通\r', '182.119.227.201', '2021-03-02 11:47:09', 1);
INSERT INTO `t_record` VALUES (642, ' 意大利  CZ88.NET\r', '193.43.118.35', '2021-03-02 11:55:42', 3);
INSERT INTO `t_record` VALUES (643, ' 山西省 电信\r', '223.11.127.203', '2021-03-03 21:37:16', 3);
INSERT INTO `t_record` VALUES (644, ' 韩国  CZ88.NET\r', '111.118.21.122', '2021-03-02 12:10:09', 1);
INSERT INTO `t_record` VALUES (645, ' 美国  CZ88.NET\r', '192.35.168.128', '2021-03-02 12:58:50', 1);
INSERT INTO `t_record` VALUES (646, ' 河南省郑州市 电信\r', '123.52.17.71', '2021-03-02 14:21:55', 1);
INSERT INTO `t_record` VALUES (647, ' 广东省深圳市 电信\r', '183.14.212.59', '2021-03-02 14:41:21', 1);
INSERT INTO `t_record` VALUES (648, ' 陕西省安康市 移动\r', '111.19.122.119', '2021-03-02 15:03:11', 1);
INSERT INTO `t_record` VALUES (649, ' 广东省珠海市 电信\r', '113.76.148.185', '2021-03-02 15:13:37', 1);
INSERT INTO `t_record` VALUES (650, ' 广东省珠海市 电信\r', '113.76.148.185', '2021-03-02 15:13:37', 1);
INSERT INTO `t_record` VALUES (651, ' 四川省 移动数据上网公共出口\r', '117.136.62.101', '2021-03-02 15:17:37', 1);
INSERT INTO `t_record` VALUES (652, ' 福建省福州市 电信\r', '220.160.15.114', '2021-03-02 15:35:57', 1);
INSERT INTO `t_record` VALUES (653, ' 福建省厦门市 电信\r', '120.36.255.177', '2021-03-02 15:41:38', 1);
INSERT INTO `t_record` VALUES (654, ' 山东省青岛市 联通\r', '61.162.43.6', '2021-03-04 08:55:52', 10);
INSERT INTO `t_record` VALUES (655, ' 上海市 联通\r', '223.166.151.199', '2021-03-02 17:01:28', 1);
INSERT INTO `t_record` VALUES (656, ' 上海市 移动\r', '120.204.133.57', '2021-03-02 17:07:08', 1);
INSERT INTO `t_record` VALUES (657, ' 上海市 电信\r', '116.231.36.188', '2021-03-02 18:18:13', 1);
INSERT INTO `t_record` VALUES (658, ' 加拿大  CZ88.NET\r', '47.205.50.57', '2021-03-02 19:12:36', 1);
INSERT INTO `t_record` VALUES (659, ' 中国 移动\r', '111.18.101.183', '2021-03-02 20:23:52', 2);
INSERT INTO `t_record` VALUES (660, ' 美国 得克萨斯州\r', '34.77.162.6', '2021-03-02 22:05:05', 1);
INSERT INTO `t_record` VALUES (661, ' 意大利  CZ88.NET\r', '87.20.191.72', '2021-03-02 23:03:50', 1);
INSERT INTO `t_record` VALUES (662, ' 俄罗斯  CZ88.NET\r', '37.193.43.103', '2021-03-02 23:14:47', 1);
INSERT INTO `t_record` VALUES (663, ' 黎巴嫩  CZ88.NET\r', '213.204.117.179', '2021-03-03 00:51:41', 1);
INSERT INTO `t_record` VALUES (664, ' 阿根廷  CZ88.NET\r', '181.94.244.116', '2021-03-03 02:18:47', 1);
INSERT INTO `t_record` VALUES (665, ' 浙江省杭州市 阿里云\r', '47.103.69.149', '2021-03-03 02:27:28', 1);
INSERT INTO `t_record` VALUES (666, ' 北京市 北京百度网讯科技有限公司BGP节点\r', '180.76.170.52', '2021-03-03 02:34:34', 1);
INSERT INTO `t_record` VALUES (667, ' 美国  CZ88.NET\r', '192.46.221.241', '2021-03-03 03:02:28', 1);
INSERT INTO `t_record` VALUES (668, ' 美国  CZ88.NET\r', '167.248.133.55', '2021-03-03 04:03:38', 2);
INSERT INTO `t_record` VALUES (669, ' 非洲地区  CZ88.NET\r', '102.128.141.181', '2021-03-03 04:17:02', 3);
INSERT INTO `t_record` VALUES (670, ' 美国 新泽西州Linode公司\r', '104.237.140.169', '2021-03-03 04:50:30', 1);
INSERT INTO `t_record` VALUES (671, ' 南非  CZ88.NET\r', '197.245.86.59', '2021-03-03 05:24:31', 1);
INSERT INTO `t_record` VALUES (672, ' 上海市 阿里云\r', '106.15.88.163', '2021-03-03 05:41:24', 1);
INSERT INTO `t_record` VALUES (673, ' 浙江省金华市 电信\r', '122.225.242.46', '2021-03-03 06:04:18', 10);
INSERT INTO `t_record` VALUES (674, ' 上海市 阿里云\r', '106.14.227.62', '2021-03-03 08:47:21', 1);
INSERT INTO `t_record` VALUES (675, ' 四川省成都市 电信\r', '125.71.212.24', '2021-03-03 09:12:34', 1);
INSERT INTO `t_record` VALUES (676, ' 河南省驻马店市 移动\r', '111.7.100.24', '2021-03-03 09:16:21', 2);
INSERT INTO `t_record` VALUES (677, ' 河南省驻马店市 移动\r', '111.7.100.26', '2021-03-03 09:16:26', 1);
INSERT INTO `t_record` VALUES (678, ' 美国  CZ88.NET\r', '23.129.64.213', '2021-03-03 09:27:34', 1);
INSERT INTO `t_record` VALUES (679, ' 肯尼亚  CZ88.NET\r', '197.237.129.58', '2021-03-03 09:27:38', 1);
INSERT INTO `t_record` VALUES (680, ' 美国  CZ88.NET\r', '162.142.125.55', '2021-03-03 09:35:33', 1);
INSERT INTO `t_record` VALUES (681, ' 美国  CZ88.NET\r', '44.234.9.216', '2021-03-03 10:04:58', 1);
INSERT INTO `t_record` VALUES (682, ' 浙江省杭州市 阿里云\r', '47.101.201.45', '2021-03-03 10:10:32', 1);
INSERT INTO `t_record` VALUES (683, ' 美国 加利福尼亚州费利蒙Linode数据中心\r', '45.33.56.182', '2021-03-03 10:46:30', 1);
INSERT INTO `t_record` VALUES (684, ' 广东省深圳市 电信\r', '113.91.32.236', '2021-03-03 10:48:42', 1);
INSERT INTO `t_record` VALUES (685, ' 北京市 联通\r', '124.65.191.218', '2021-03-03 10:56:13', 1);
INSERT INTO `t_record` VALUES (686, ' 澳大利亚 Microsoft公司\r', '23.101.213.72', '2021-03-03 11:26:26', 1);
INSERT INTO `t_record` VALUES (687, ' 浙江省杭州市 阿里云\r', '47.101.197.153', '2021-03-03 11:46:19', 1);
INSERT INTO `t_record` VALUES (688, ' 美国  CZ88.NET\r', '74.120.14.37', '2021-03-03 12:12:54', 2);
INSERT INTO `t_record` VALUES (689, ' 浙江省杭州市 阿里云\r', '47.102.139.80', '2021-03-03 12:19:36', 1);
INSERT INTO `t_record` VALUES (690, ' 浙江省杭州市 阿里云\r', '47.102.156.101', '2021-03-03 12:20:33', 1);
INSERT INTO `t_record` VALUES (691, ' 美国  CZ88.NET\r', '162.142.125.40', '2021-03-03 12:35:44', 2);
INSERT INTO `t_record` VALUES (692, ' 美国 加利福尼亚州旧金山DigitalOcean数据中心\r', '192.241.218.240', '2021-03-03 12:44:24', 1);
INSERT INTO `t_record` VALUES (693, ' 山东省青岛市 电信\r', '123.168.84.207', '2021-03-03 13:11:07', 1);
INSERT INTO `t_record` VALUES (694, ' 云南省曲靖市 电信\r', '220.164.62.61', '2021-03-03 13:44:11', 3);
INSERT INTO `t_record` VALUES (695, ' 浙江省杭州市 阿里云\r', '47.102.151.152', '2021-03-03 14:07:22', 1);
INSERT INTO `t_record` VALUES (696, ' 北京市 东四电信IDC机房\r', '119.57.133.226', '2021-03-03 14:16:45', 1);
INSERT INTO `t_record` VALUES (697, ' 希腊  CZ88.NET\r', '46.12.37.151', '2021-03-03 14:25:50', 1);
INSERT INTO `t_record` VALUES (698, ' 丹麦  CZ88.NET\r', '83.89.218.58', '2021-03-03 14:38:03', 1);
INSERT INTO `t_record` VALUES (699, ' 浙江省杭州市 阿里云\r', '47.101.53.84', '2021-03-03 15:27:37', 1);
INSERT INTO `t_record` VALUES (700, ' 广东省惠州市 电信\r', '113.106.167.146', '2021-03-03 16:22:00', 1);
INSERT INTO `t_record` VALUES (701, ' 河北省秦皇岛市 联通\r', '121.22.98.222', '2021-03-03 16:26:51', 2);
INSERT INTO `t_record` VALUES (702, ' 美国  CZ88.NET\r', '104.206.128.2', '2021-03-03 16:29:03', 1);
INSERT INTO `t_record` VALUES (703, ' 浙江省杭州市 阿里云\r', '39.101.138.7', '2021-03-03 17:50:46', 1);
INSERT INTO `t_record` VALUES (704, ' 希腊  CZ88.NET\r', '178.128.194.144', '2021-03-03 17:53:36', 1);
INSERT INTO `t_record` VALUES (705, ' 中国  CZ88.NET\r', '121.89.222.94', '2021-03-03 18:02:49', 1);
INSERT INTO `t_record` VALUES (706, ' 广西南宁市 电信\r', '116.8.58.19', '2021-03-03 18:13:29', 1);
INSERT INTO `t_record` VALUES (707, ' 上海市 电信\r', '180.163.220.3', '2021-03-03 18:24:23', 2);
INSERT INTO `t_record` VALUES (708, ' 浙江省杭州市 阿里云\r', '39.103.136.15', '2021-03-03 18:35:54', 1);
INSERT INTO `t_record` VALUES (709, ' 美国 加利福尼亚州弗里蒙特市Hurricane Electric公司\r', '184.105.139.68', '2021-03-03 18:49:05', 1);
INSERT INTO `t_record` VALUES (710, ' 中国  CZ88.NET\r', '121.89.213.131', '2021-03-03 18:51:23', 1);
INSERT INTO `t_record` VALUES (711, ' 浙江省绍兴市 移动\r', '112.13.96.187', '2021-03-03 20:19:49', 1);
INSERT INTO `t_record` VALUES (712, ' 天津市 联通\r', '218.68.65.193', '2021-03-03 20:20:55', 1);
INSERT INTO `t_record` VALUES (713, ' 美国 Google\r', '66.249.66.206', '2021-03-04 08:00:22', 6);
INSERT INTO `t_record` VALUES (714, ' 河南省 电信\r', '36.99.136.133', '2021-03-04 05:26:11', 2);
INSERT INTO `t_record` VALUES (715, ' 河南省 电信\r', '36.99.136.131', '2021-03-04 05:24:23', 2);
INSERT INTO `t_record` VALUES (716, ' 河南省 电信\r', '36.99.136.130', '2021-03-03 22:11:02', 1);
INSERT INTO `t_record` VALUES (717, ' 乌拉圭  CZ88.NET\r', '190.133.23.240', '2021-03-03 22:11:25', 1);
INSERT INTO `t_record` VALUES (718, ' 河南省郑州市 鹏博士长城宽带\r', '220.114.194.162', '2021-03-03 22:14:01', 1);
INSERT INTO `t_record` VALUES (719, ' 广东省揭阳市 电信\r', '183.9.197.4', '2021-03-03 23:28:49', 1);
INSERT INTO `t_record` VALUES (720, ' 美国 Google\r', '66.249.66.210', '2021-03-04 08:22:54', 7);
INSERT INTO `t_record` VALUES (721, ' 江西省南昌市 电信\r', '59.52.179.24', '2021-03-03 23:55:32', 1);
INSERT INTO `t_record` VALUES (722, ' 江西省南昌市 电信\r', '59.52.177.67', '2021-03-03 23:55:41', 1);
INSERT INTO `t_record` VALUES (723, ' 北京市 北京百度网讯科技有限公司电信节点\r', '220.181.108.104', '2021-03-04 00:29:37', 1);
INSERT INTO `t_record` VALUES (724, ' 日本 OCN\r', '114.153.198.144', '2021-03-04 00:49:00', 1);
INSERT INTO `t_record` VALUES (725, ' 美国 加利福尼亚州圣克拉拉县山景市谷歌公司\r', '35.187.190.226', '2021-03-04 00:50:55', 1);
INSERT INTO `t_record` VALUES (726, ' 广东省肇庆市 联通\r', '58.253.231.95', '2021-03-04 02:02:46', 2);
INSERT INTO `t_record` VALUES (727, ' 德国 黑森州法兰克福Amazon数据中心\r', '18.184.78.103', '2021-03-04 02:24:06', 1);
INSERT INTO `t_record` VALUES (728, ' 美国 Microsoft公司\r', '13.66.139.115', '2021-03-04 02:54:32', 1);
INSERT INTO `t_record` VALUES (729, ' 美国 Google\r', '66.249.66.208', '2021-03-04 03:37:10', 1);
INSERT INTO `t_record` VALUES (730, ' 美国 乔治亚州亚特兰大Linode数据中心\r', '45.33.96.205', '2021-03-04 04:16:26', 1);
INSERT INTO `t_record` VALUES (731, ' 波兰  CZ88.NET\r', '194.169.241.170', '2021-03-04 05:16:40', 1);
INSERT INTO `t_record` VALUES (732, ' 北京市 北京百度网讯科技有限公司电信节点\r', '220.181.108.160', '2021-03-04 05:52:03', 1);
INSERT INTO `t_record` VALUES (733, ' 美国 科罗拉多州布隆菲尔德市Level 3通信股份有限公司\r', '8.131.132.54', '2021-03-04 05:53:27', 1);
INSERT INTO `t_record` VALUES (734, ' 上海市 联通\r', '223.167.152.53', '2021-03-04 09:02:16', 1);

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (19, 'Java');
INSERT INTO `t_tag` VALUES (20, 'Linux');
INSERT INTO `t_tag` VALUES (21, 'HTML');
INSERT INTO `t_tag` VALUES (22, 'JavaScript');
INSERT INTO `t_tag` VALUES (23, 'JQuery');
INSERT INTO `t_tag` VALUES (24, 'Semantic UI');
INSERT INTO `t_tag` VALUES (25, 'MySQL');
INSERT INTO `t_tag` VALUES (26, '其他');
INSERT INTO `t_tag` VALUES (27, 'SpringBoot');
INSERT INTO `t_tag` VALUES (28, 'MyBatis');
INSERT INTO `t_tag` VALUES (29, '面试');
INSERT INTO `t_tag` VALUES (30, 'LeetCode');
INSERT INTO `t_tag` VALUES (31, '运维');
INSERT INTO `t_tag` VALUES (32, '数据结构&算法');
INSERT INTO `t_tag` VALUES (33, '前端');
INSERT INTO `t_tag` VALUES (34, '数据库');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (22, '程序人生');
INSERT INTO `t_type` VALUES (23, '教程');
INSERT INTO `t_type` VALUES (25, '踩坑记录');
INSERT INTO `t_type` VALUES (37, '学习笔记');
INSERT INTO `t_type` VALUES (38, '面试整理');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'http://p1.music.126.net/d5zrKbBHSO43vegQ9L5gjQ==/109951163963019922.jpg?param=180y180', '2021-01-22 15:07:15', '3458494020@qq.com', '马云', '21232f297a57a5a743894a0e4a801fc3', 1, '2021-01-22 15:08:00', 'admin');
INSERT INTO `t_user` VALUES (2, 'https://tva3.sinaimg.cn/crop.0.0.996.996.180/8f48a433jw8fcq486pduqj20ro0roq4u.jpg?KID=imgbed,tva&Expires=1613397419&ssig=01bZU2jVId', '2021-01-23 22:15:04', '3458494020@qq.com', '马化腾', 'e10adc3949ba59abbe56e057f20f883e', 1, '2021-01-23 22:15:39', '123456');

-- ----------------------------
-- Table structure for t_website_info
-- ----------------------------
DROP TABLE IF EXISTS `t_website_info`;
CREATE TABLE `t_website_info`  (
  `value_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`value_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_website_info
-- ----------------------------
INSERT INTO `t_website_info` VALUES ('aboutMeContent', '马云,一个即将秃顶的大三计科狗,整天折腾在代码的世界.正在寻找高效学习的方法.');
INSERT INTO `t_website_info` VALUES ('aboutMeImageUrl', 'https://api.qinor.cn/img');
INSERT INTO `t_website_info` VALUES ('topTitle', '马云个人博客');
INSERT INTO `t_website_info` VALUES ('views', '1301');

SET FOREIGN_KEY_CHECKS = 1;
