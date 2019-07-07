<#--头通用宏指令-->
<#macro head >
  <!DOCTYPE html>
  <html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="format-detection" content="telephone=yes"/>
    <meta name="renderer" content="webkit">
    <meta name="theme-color" content="#fff">
      <#--通过每个页面将页面的title传入-->
    <title><#nested></title>
    <!-- 引入css -->
    <link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
    <link rel="stylesheet" href="/static/theme/blue.css">
    <link rel="stylesheet" href="/static/css/app.css">
    <link rel="stylesheet" href="/static/css/pagecommon.css">
  </head>
  <body>
<#--导航栏-->
  <nav class="navbar navbar-default" role="navigation"
       style="background-color: white;border-right: none;border-left: none">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target="#example-navbar-collapse">
          <span class="sr-only">切换导航</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/">dengyi.pro</a>
      </div>
      <div class="collapse navbar-collapse" id="example-navbar-collapse">
        <!-- 一般导航项目 -->
        <ul class="nav navbar-nav" id="category">
          <li></li>
        </ul>
        <form action="/search" method="get" autocomplete="off" class="navbar-form navbar-right"
              role="search" id="headerSearchForm">
          <div class="form-group">
            <input name="key" type="text" class="form-control" placeholder="搜索"/>
          </div>
          <button type="submit" class="btn btn-success">搜索</button>
        </form>
      </div>
    </div>
  </nav>
</#macro>

<#--通用脚，自定义宏命令-->
<#macro foot>
<#--引入js-->
  <script src="/static/plugins/zui/lib/jquery/jquery.js"></script>
  <script src="/static/js/hedgehog.js"></script>
  <script>
    /**
     * 每个页面加载时，都需要调用的相应ajax
     */
    $(function () {
      //添加分类，并且激活当前分类
      addCategoryAndActiveOne();
      //判断导航栏中的搜索框是否要显示
      headerSearchFormCanshow();
    });
  </script>
  </body>
  </html>
</#macro>