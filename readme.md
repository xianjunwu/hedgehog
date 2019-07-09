# hedgehog 刺猬
[![LICENSE](https://img.shields.io/badge/license-Anti%20996-blue.svg)](https://github.com/996icu/996.ICU/blob/master/LICENSE)
----------
《刺猬》作为个人的网站产生的原因：其实作为程序员，有一个自己的个人网站，在我看来是最基本的要求。在“刺猬”之前自己的网站基本上是没怎么去打理，导致效果很差。突然有一天意识到，我对自己是很不负责的，所以决定重构。“刺猬”由此诞生。
> “刺猬”的来历是，在我家附近经常出没着一直小刺猬，经常夜间出现。个人喜欢在夜间工作，所以将项目起名为“刺猬”

## 页面展示
### 安装页面
![安装页面](https://github.com/BruceAKABear/hedgehog/blob/master/doc/img/installpage.jpg)

### 登录页面
![登录页面](https://github.com/BruceAKABear/hedgehog/blob/master/doc/img/loginpage.jpg)

###后台管理页
![后台管理页](https://github.com/BruceAKABear/hedgehog/blob/master/doc/img/adminpage.jpg)
## 所使用技术列表
+ 前端
    - jquery
    - zui前端框架（对bootstrap的封装）
    - wizard.js 安装页导航
    - info.js 对第一次使用系统管理界面进行引导
    - kindeditor 富文本编辑器
+ 后端
    - springboot
    - spring data jpa(由于个人服务器性能太垃圾，搜索引擎替换为hibernate search)
    - spring data solr 简化搜索
    - redis 对高频查询进行缓存
    - freemarker 页面静态化处理，后端渲染，方便蜘蛛抓取，利于seo
  
## 技术选型依据
- 为什么前端还选择bootstrap+jquery的组合？
其实就个人而言，我倾向于选择现在大火的vuejs做前端开发。但是，因为个人网站需要经常写博客，如果使用vue开发，
那么对于网站的SEO来说将是个大问题。我们写个人网站其实也是希望各大索索引擎能搜到自己的网站。因此，处于SEO的
考虑选择了bootstrap来开发
- 后端技术为什么选择jpa做orm框架？
我是一个懒人，而且我个人不喜欢写sql，同时我非常崇拜hibernate,加上我的小个人网站是不可能出现性能瓶颈的，所以
选择了jpa做orm层  
## 项目中技术可能会存在的疑点
+ 对于代码中我对技术的使用可能会有疑问的地方，请到项目doc目录下查询。doc目录结构为：
+ doc目录结构
	- 前端疑点：放置前端可能存在的疑点md文档
	- 后端疑点：放置后端可能存在的疑点md文档
## 如何部署？
+ 常规部署模式

    如果你对开发有所了解，那么我个人推荐你使用常规部署模式。这样有几个好处。第一，你可以了解从开发到部署的最基础的流程。
    第二，所有的数据都经过你的手处理，将加深你的印象。
    
    - 安装好环境：在服务器上安装jdk8,mysql5.7,solr8,redis3以上
    - 将项目利用maven打包
    - 修改配置文件
    - 启动项目
    
+ 简洁部署模式
    
    为了方便不是开发人员进行快速项目部署，我将项目上传到了个人的docker hub。方便进行急速部署
    
    - 服务器安装docker
    - 利用docker搜索：docker search hedgehog
    - 下载镜像：docker pull hedgehog
    - 运行即可
    
## 欢迎共同维护项目
### 项目规范
- 代码codestyle必须使用Google codestyle
- 代码需通过alibaba代码规约检测