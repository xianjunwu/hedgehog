<#--自定义指令，用于在组装页面的同时能传入值-->
<#--头部指令-->
<#macro head>
  <!DOCTYPE html>
  <html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台管理页面</title>
    <!-- jquery js -->
    <script src="/static/plugins/zui/lib/jquery/jquery.js"></script>
    <!-- zui js -->
    <script src="/static/plugins/zui/js/zui.min.js"></script>
    <script src="/static/plugins/zui/lib/calendar/zui.calendar.min.js"></script>
    <!-- app js -->
    <script src="/static/js/app.js"></script>
    <script src="/static/js/hedgehog-admin.js"></script>
    <link rel="stylesheet" href="/static/plugins/zui/lib/calendar/zui.calendar.min.css">
      <#--时间选择器-->
    <link rel="stylesheet" href="/static/plugins/zui/lib/datetimepicker/datetimepicker.min.css">
    <script src="/static/plugins/zui/lib/datetimepicker/datetimepicker.min.js"></script>
      <#--颜色选择器-->
    <link rel="stylesheet" href="/static/plugins/zui/lib/colorpicker/zui.colorpicker.min.css">
    <script src="/static/plugins/zui/lib/colorpicker/zui.colorpicker.js"></script>
    <!-- zui css -->
    <link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
    <link rel="stylesheet" href="/static/theme/blue.css">
    <#--表格-->
    <link rel="stylesheet" href="/static/plugins/zui/lib/datagrid/zui.datagrid.min.css">
    <script src="/static/plugins/zui/lib/datagrid/zui.datagrid.min.js"></script>
    <#--文件上传-->
    <link rel="stylesheet" href="/static/plugins/zui/lib/uploader/zui.uploader.min.css">
    <script src="/static/plugins/zui/lib/uploader/zui.uploader.min.js"></script>
    <#--富文本编辑器-->
    <link rel="stylesheet" href="/static/plugins/zui/lib/kindeditor/kindeditor.min.css">
    <script src="/static/plugins/zui/lib/kindeditor/kindeditor.min.js"></script>
    <!-- app css -->
    <link rel="stylesheet" href="/static/css/app.css">
  </head>
  <body>
  <div class="wrapper">
<#--通用头部-->
  <header class="main-header">
    <nav class="navbar navbar-fixed-top bg-primary">
      <div class="navbar-header">
        <a class="navbar-toggle" href="javascript:" data-toggle="collapse"
           data-target=".navbar-collapse"><i
              class="icon icon-th-large"></i></a>
        <a class="sidebar-toggle" href="javascript:" data-toggle="push-menu"><i
              class="icon icon-bars"></i></a>
        <a class="navbar-brand" href="#">
          <span class="logo">Hedgehog</span>
          <span class="logo-mini">H</span>
        </a>
      </div>
      <div class="collapse navbar-collapse">
        <div class="container-fluid">
          <ul class="nav navbar-nav">
            <li><a href="javascript:" data-toggle="push-menu"><i class="icon icon-bars"></i></a>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">

            <li>
              <a id="gotoFrontIco" data-toggle="tooltip" data-placement="bottom" title="前台">
                <i class="icon-lg icon-location-arrow"></i>
              </a>
            </li>
              <#--新通知-->
            <li>
              <a href="/admin/notice" data-toggle="tooltip" data-placement="bottom" title="通知">
                <span>
                    <i class="icon icon-bell-alt"></i>
										<span class="label label-danger label-pill up" id="noticeNumber"></span>
                </span>
              </a>
            </li>
              <#--新邮件-->
            <li>
              <a href="javascript:" data-toggle="tooltip" data-placement="bottom" title="邮件">
                 <span>
                     <i class="icon icon-envelope-alt"></i>
                     <span class="label label-success label-pill up">2</span>
                  </span>
              </a>
            </li>
            <li class="dropdown">
              <a href="javascript:" data-toggle="dropdown"><i class="icon icon-user"></i> 管理员 <span
                    class="caret"></span></a>
              <ul class="dropdown-menu">
                <li class="divider"></li>
                <li><a href="/admin/system/showLoginPage">退出系统</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
<#--通用侧边栏-->
  <aside class="main-sidebar">
    <section class="sidebar">
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">主要菜单</li>
        <li class="active">
          <a href="/admin">
            <i class="icon icon-dashboard"></i>
            <span>仪表盘</span>
            <span class="pull-right-container"></span>
          </a>
        </li>
        <li class="treeview">
          <a href="javascript:">
            <i class="icon icon-th-list"></i>
            <span>分类管理</span>
            <span class="pull-right-container"><i class="icon icon-angle-left"></i></span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/category"><i class="icon icon-circle-blank"></i>分类管理</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="javascript:">
            <i class="icon icon-th-list"></i>
            <span>文章管理</span>
            <span class="pull-right-container"><i class="icon icon-angle-left"></i></span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/article/list"><i class="icon icon-circle-blank"></i>文章列表</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="javascript:">
            <i class="icon icon-th-list"></i>
            <span>评论/通知管理</span>
            <span class="pull-right-container">
                                <i class="icon icon-angle-left"></i>
                            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/comment"><i class="icon icon-circle-blank"></i>评论列表</a></li>
            <li><a href="/admin/notice"><i class="icon icon-circle-blank"></i>通知列表</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="javascript:">
            <i class="icon icon-edit"></i>
            <span>创作</span>
            <span class="pull-right-container">
                                <i class="icon icon-angle-left"></i>
                            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/article/write"><i class="icon icon-circle-blank"></i>写博客</a></li>
              <#-- <li><a href="layout.html"><i class="icon icon-circle-blank"></i>写日记</a></li>-->
          </ul>
        </li>
        <li class="treeview">
          <a href="javascript:">
            <i class="icon icon-cog"></i>
            <span>系统设置</span>
            <span class="pull-right-container">
                                <i class="icon icon-angle-left"></i>
                            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/systemConfig/basicconfig"><i class="icon icon-circle-blank"></i>基础设置</a>
            </li>
            <li><a href="/admin/systemConfig/backup"><i class="icon icon-circle-blank"></i>系统备份</a>
            </li>
            <li><a href="/admin/systemConfig/restore"><i class="icon icon-circle-blank"></i>系统恢复</a>
            </li>
          </ul>
        </li>

      </ul>
    </section>
  </aside>
</#macro>


<#--脚部指令-->
<#macro foot>
<#--用于加载每个页面都需要加载的东西-->
    <script >
        activeSider();
        queryAllNotice();
        queryFrontAddress();
    </script>
  </body>
  </html>
</#macro>