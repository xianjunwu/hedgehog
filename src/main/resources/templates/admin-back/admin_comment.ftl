<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>demo | 评论管理</title>
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
        <style type="text/css" rel="stylesheet">
            .draft,.publish,.trash{list-style:none;float:left;margin:0;padding-bottom:10px}s
        </style>
        <section class="content-header">
            <h1>评论管理<small></small></h1>
            <ol class="breadcrumb">
                <li>
                    <a data-pjax="true" href="/admin"><i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li class="active">评论管理</li>
            </ol>
        </section>
        <section class="content container-fluid">
            <ul style="list-style: none;padding-left: 0">
                <li class="publish">
                    <a data-pjax="true" href="/admin/comments" style="color: #000" >已发布<span class="count">(1)</span></a>&nbsp;|&nbsp;
                </li>
                <li class="draft">
                    <a data-pjax="true" href="/admin/comments?status=1" >待审核<span class="count">(0)</span></a>&nbsp;|&nbsp;
                </li>
                <li class="trash">
                    <a data-pjax="true" href="/admin/comments?status=2" >回收站<span class="count">(0)</span></a>
                </li>
            </ul>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>评论者</th>
                                    <th width="50%">内容</th>
                                    <th>评论页面</th>
                                    <th>日期</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><a href="https://ryanc.cc" target="_blank">ruibaby</a></td>
                                    <td>欢迎，欢迎！</td>
                                    <td>
                                        <a target="_blank" href="/archives/hello-halo#comment-id-4">Hello Halo!</a>
                                    </td>
                                    <td>2018-10-11 21:36</td>
                                    <td>
                                        <button class="btn btn-primary btn-xs " onclick="replyShow('4','3')" >回复</button>
                                        <button class="btn btn-danger btn-xs " onclick="modelShow('/admin/comments/throw?commentId=4&status=0&page=0','确定移到回收站？')">丢弃</button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <div class="no-margin pull-left">
                                第1/1页
                            </div>
                            <ul class="pagination no-margin pull-right">
                                <li><a data-pjax="true" class="btn btn-sm disabled" href="/admin/comments?status=0">首页</a> </li>
                                <li><a data-pjax="true" class="btn btn-sm disabled" href="/admin/comments?status=0&page=-1">上一页</a></li>
                                <li><a data-pjax="true" class="btn btn-sm disabled" href="/admin/comments?status=0&page=1">下一页</a></li>
                                <li><a data-pjax="true" class="btn btn-sm disabled" href="/admin/comments?status=0&page=0">尾页</a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 删除确认弹出层 -->
        <div class="modal fade" id="removeCommentModal">
            <div class="modal-dialog">
                <div class="modal-content message_align">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">提示</h4>
                    </div>
                    <div class="modal-body">
                        <p id="message"></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="url"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a onclick="removeIt()" class="btn btn-danger" data-dismiss="modal">确定</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 回复弹出层 -->
        <div class="modal fade" id="commentReplyModal">
            <div class="modal-dialog">
                <div class="modal-content message_align">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">回复</h4>
                    </div>
                    <form method="post" action="/admin/comments/reply">
                        <div class="modal-body">
                            <textarea class="form-control comment-input-content" rows="5" id="commentContent" name="commentContent" style="resize: none"></textarea>
                            <div class="OwO"></div>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" id="commentId" name="commentId" value=""/>
                            <input type="hidden" id="userAgent" name="userAgent" value=""/>
                            <input type="hidden" id="postId" name="postId" value="" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="submit" class="btn btn-primary">确定</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            var s = new OwO({
                container: document.getElementsByClassName('OwO')[0],
                target: document.getElementsByClassName('comment-input-content')[0],
                position: 'down',
                width: '100%',
                maxHeight: '210px',
                api:"/static/plugins/OwO/OwO.min.json"
            });
            function modelShow(url,message) {
                $('#url').val(url);
                $('#message').html(message);
                $('#removeCommentModal').modal();
            }
            function removeIt(){
                var url=$.trim($("#url").val());
                window.location.href=url;
            }
            function replyShow(commentId,postId) {
                $('#userAgent').val(navigator.userAgent);
                $('#commentId').val(commentId);
                $('#postId').val(postId);
                $('#commentReplyModal').modal();
            }
        </script>
    </div>
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