<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>demo | 个人资料</title>
    <link rel="stylesheet" href="/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/plugins/pace/pace.min.css">
    <link rel="stylesheet" href="/static/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/loader.css">
    <link rel="stylesheet" href="/static/plugins/toast/css/jquery.toast.min.css">
    <link rel="stylesheet" href="/static/plugins/fileinput/fileinput.min.css">
    <link rel="stylesheet" href="/static/plugins/OwO/OwO.min.css">
    <link rel="stylesheet" href="/static/plugins/pretty-checkbox/pretty-checkbox.min.css">
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="/static/plugins/jquery/jquery.min.js"></script>
    <script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/plugins/OwO/OwO.min.js"></script>
</head>
<body class="hold-transition sidebar-mini skin-blue ">
<div class="wrapper">
    <!-- 顶部栏模块 -->
    <header class="main-header">
        <a href="/admin" class="logo">
            <span class="logo-mini"><b>H</b>a</span>
            <span class="logo-lg"><b>Ha</b>lo</span>
        </a>
        <nav class="navbar navbar-static-top" role="navigation">
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li><a href="/" title="跳转到前台" target="_blank"><i class="fa fa-location-arrow"></i></a></li>
                    <li class="dropdown messages-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">
                                你有 0 条新评论
                            </li>
                            <li>
                                <ul class="menu">
                                </ul>
                            </li>
                            <li class="footer"><a href="/admin/comments?status=1">查看所有评论</a></li>
                        </ul>
                    </li>
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="/static/images/default.png" class="user-image" alt="User Image">
                            <span class="hidden-xs">邓艺</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <img src="/static/images/default.png" class="img-circle" alt="User Image">
                                <p>邓艺</p>
                            </li>
                            <li class="user-footer">
                                <div class="pull-left"><a data-pjax="true" href="/admin/profile" class="btn btn-default "><i class="fa fa-user"></i>个人资料</a></div>
                                <div class="pull-right"><a href="/admin/logOut" class="btn btn-default "><i class="fa fa-sign-out"></i>退出登录</a></div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- 菜单栏模块 -->
    <aside class="main-sidebar">
        <section class="sidebar">
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="/static/images/default.png" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>邓艺</p><a href="/admin/profile"><i class="fa fa-circle text-success"></i>个人资料</a>
                </div>
            </div>
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
<button type="submit" name="search" id="search-btn" class="btn btn-flat">
<i class="fa fa-search"></i>
</button>
</span>
                </div>
            </form>
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">HEADER</li>
                <li>
                    <a data-pjax="true" href="/admin">
                        <i class="fa fa-dashboard"></i>
                        <span>仪表盘</span>
                    </a>
                </li>
                <li class="treeview">
                    <a data-pjax="true" href="#">
                        <i class="fa fa-book"></i>
                        <span>文章</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu" style="">
                        <li><a data-pjax="true" href="/admin/posts"><i class="fa fa-circle-o"></i>所有文章</a></li>
                        <li><a data-pjax="false" href="/admin/posts/new"><i class="fa fa-circle-o"></i>写文章</a></li>
                        <li><a data-pjax="true" href="/admin/category"><i class="fa fa-circle-o"></i>分类目录</a></li>
                        <li><a data-pjax="true" href="/admin/tag"><i class="fa fa-circle-o"></i>标签</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a data-pjax="true" href="#">
                        <i class="fa fa-desktop"></i>
                        <span>页面</span>
                        <span class="pull-right-container">
<i class="fa fa-angle-left pull-right"></i>
</span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a data-pjax="true" href="/admin/page"><i class="fa fa-circle-o"></i>所有页面</a></li>
                        <li><a data-pjax="false" href="/admin/page/new"><i class="fa fa-circle-o"></i>新建页面</a></li>
                    </ul>
                </li>
                <li>
                    <a data-pjax="true" href="/admin/attachments">
                        <i class="fa fa-camera"></i>
                        <span>附件</span>
                    </a>
                </li>
                <li>
                    <a data-pjax="true" href="/admin/comments">
                        <i class="fa fa-comment"></i>
                        <span>评论</span>
                        <span class="pull-right-container">
</span>
                    </a>
                </li>
                <li class="treeview">
                    <a data-pjax="true" href="#">
                        <i class="fa fa-paint-brush"></i>
                        <span>外观</span>
                        <span class="pull-right-container">
<i class="fa fa-angle-left pull-right"></i>
</span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a data-pjax="true" href="/admin/themes"><i class="fa fa-circle-o"></i>主题</a></li>
                        <li><a data-pjax="true" href="/admin/menus"><i class="fa fa-circle-o"></i>菜单</a></li>
                        <li><a data-pjax="false" href="/admin/themes/editor"><i class="fa fa-circle-o"></i>主题编辑</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a data-pjax="true" href="#">
                        <i class="fa fa-user-o"></i>
                        <span>用户</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a data-pjax="true" href="/admin/profile"><i class="fa fa-circle-o"></i>个人资料</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a data-pjax="true" href="#">
                        <i class="fa fa-cog"></i>
                        <span>设置</span>
                        <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                    </a>
                    <ul class="treeview-menu">
                        <li><a data-pjax="true" href="/admin/option"><i class="fa fa-circle-o"></i>博客设置</a></li>
                        <li><a data-pjax="true" href="/admin/backup"><i class="fa fa-circle-o"></i>博客备份</a></li>
                    </ul>
                </li>
            </ul>
        </section>
    </aside>
    <div class="content-wrapper">
        <style>
            .form-horizontal .control-label{
                text-align: left;
            }
        </style>
        <section class="content-header">
            <h1>
                个人资料 <small></small>
            </h1>
            <ol class="breadcrumb">
                <li>
                    <a data-pjax="true" href="/admin">
                        <i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li><a data-pjax="true" href="#">用户</a></li>
                <li class="active">个人资料</li>
            </ol>
        </section>
        <!-- tab选项卡 -->
        <section class="content container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#general" data-toggle="tab">基本资料</a>
                            </li>
                            <li>
                                <a href="#pass" data-toggle="tab">密码修改</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="general">
                                <form method="post" class="form-horizontal" id="profileForm">
                                    <input type="hidden" name="userId" value="1">
                                    <input type="hidden" id="userPass" name="userPass" value="e10adc3949ba59abbe56e057f20f883e">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="userName" class="col-lg-2 col-sm-4 control-label">用户名：
                                                <span data-toggle="tooltip" data-placement="top" title="用于登录" style="cursor: pointer">
<i class="fa fa-question-circle" aria-hidden="true"></i>
</span>
                                            </label>
                                            <div class="col-lg-4 col-sm-8">
                                                <input type="text" class="form-control" id="userName" name="userName" value="dengyi">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userDisplayName" class="col-lg-2 col-sm-4 control-label">显示名称：
                                                <span data-toggle="tooltip" data-placement="top" title="页面显示的名称" style="cursor: pointer">
<i class="fa fa-question-circle" aria-hidden="true"></i>
</span>
                                            </label>
                                            <div class="col-lg-4 col-sm-8">
                                                <input type="text" class="form-control" id="userDisplayName" name="userDisplayName" value="邓艺">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userEmail" class="col-lg-2 col-sm-4 control-label">邮箱：</label>
                                            <div class="col-lg-4 col-sm-8">
                                                <input type="email" class="form-control" id="userEmail" name="userEmail" value="dengyi@dengyi.pro">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userAvatar" class="col-lg-2 col-sm-4 control-label">头像：</label>
                                            <div class="col-lg-4 col-sm-8">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="userAvatar" name="userAvatar" value="">
                                                    <span class="input-group-btn">
<button class="btn btn-default " type="button" onclick="openAttach('userAvatar')">选择</button>
</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="userDesc" class="col-lg-2 col-sm-4 control-label">个人说明：
                                                <span data-toggle="tooltip" data-placement="top" title="部分主题可在页面上显示这段话" style="cursor: pointer">
<i class="fa fa-question-circle" aria-hidden="true"></i>
</span>
                                            </label>
                                            <div class="col-lg-4 col-sm-8">
                                                <textarea class="form-control" rows="3" id="userDesc" name="userDesc" style="resize: none"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary btn-sm " onclick="saveUser('profileForm')">保存</button>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane" id="pass">
                                <form method="post" class="form-horizontal" id="passForm">
                                    <input type="hidden" name="userId" value="1">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="beforePass" class="col-sm-2 control-label">原密码：</label>
                                            <div class="col-sm-4">
                                                <input type="password" class="form-control" id="beforePass" name="beforePass">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="newPass" class="col-sm-2 control-label">新密码：</label>
                                            <div class="col-sm-4">
                                                <input type="password" class="form-control" id="newPass" name="newPass">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="reNewPass" class="col-sm-2 control-label">确认密码：</label>
                                            <div class="col-sm-4">
                                                <input type="password" class="form-control" id="reNewPass" name="reNewPass">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button type="button" class="btn btn-primary btn-sm " onclick="changPass()">修改</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script> $(function () { $('[data-toggle="tooltip"]').tooltip() }); function openAttach(id) { layer.open({ type: 2, title: '所有附件', shadeClose: true, shade: 0.5, maxmin: true, area: ['90%', '90%'], content: '/admin/attachments/select?id='+id, scrollbar: false }); } function saveUser(option) { var param = $('#'+option).serialize(); $.ajax({ type: 'post', url: '/admin/profile/save', data: param, success: function (data) { if(data.code==1){ $.toast({ text: data.msg, heading: '提示', icon: 'success', showHideTransition: 'fade', allowToastClose: true, hideAfter: 1000, stack: 1, position: 'top-center', textAlign: 'left', loader: true, loaderBg: '#ffffff', afterHidden: function () { window.location.reload(); } }); }else{ showMsg(data.msg,"error",2000); } } }); } function changPass() { var beforePass = $('#beforePass').val(); var newPass = $('#newPass').val(); var reNewPass = $('#reNewPass').val(); if(beforePass==""||newPass==""||reNewPass==""){ showMsg("请输入完整信息！","info",2000); return; } if(newPass!=reNewPass){ showMsg("两次密码不一样！","error",2000); return; } var param = $('#passForm').serialize(); $.ajax({ type: 'post', url: '/admin/profile/changePass', data: param, success: function (data) { if(data.code==1){ $.toast({ text: data.msg, heading: '提示', icon: 'success', showHideTransition: 'fade', allowToastClose: true, hideAfter: 1000, stack: 1, position: 'top-center', textAlign: 'left', loader: true, loaderBg: '#ffffff', afterHidden: function () { window.location.reload(); } }); }else{ showMsg(data.msg,"error",2000); } } }); } </script> </div>
    <footer class="main-footer">
        <div class="pull-right hidden-xs"><a target="_blank" href="https://github.com/ruibaby/halo/releases/tag/v0.0.8">0.0.8</a></div>
        Thanks for using <strong><a data-pjax="true" href="/admin/halo">Halo</a>.</strong>
    </footer>
</div>
<script src="/static/plugins/pjax/jquery.pjax.js"></script>
<script src="/static/plugins/pace/pace.min.js"></script>
<script src="/static/js/adminlte.min.js"></script>
<script src="/static/plugins/toast/js/jquery.toast.min.js"></script>
<script src="/static/plugins/layer/layer.js"></script>
<script src="/static/plugins/fileinput/fileinput.min.js"></script>
<script src="/static/plugins/fileinput/zh.min.js"></script>
<script src="/static/js/app.js"></script>
<script> Pace.options = { restartOnRequestAfter: false }; $(document).ajaxStart(function() {Pace.restart();}); $(document).pjax('a[data-pjax=true]', '.content-wrapper', {fragment: '.content-wrapper',timeout: 8000}); var heading = "提示"; </script></body>
</html>