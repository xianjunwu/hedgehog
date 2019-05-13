<#compress >
    <!DOCTYPE html>
    <html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>系统设置</title>
        <!-- jquery js -->
        <script src="/static/plugins/zui/lib/jquery/jquery.js"></script>
        <!-- zui css -->
        <link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
        <link rel="stylesheet" href="/static/theme/blue.css">
        <!-- app css -->
        <link rel="stylesheet" href="/static/css/app.css">

    </head>
    <body>
    <div class="wrapper">
        <#include "common/header.ftl">
        <aside class="main-sidebar">
            <section class="sidebar">
                <ul class="sidebar-menu" data-widget="tree">
                    <li class="header">主要菜单</li>
                    <li>
                        <a href="/admin/index/">
                            <i class="icon icon-dashboard"></i>
                            <span>仪表盘</span>
                            <span class="pull-right-container">
                            </span>
                        </a>
                    </li>
                    <li class="treeview">
                        <a href="javascript:;">
                            <i class="icon icon-file"></i>
                            <span>页面演示</span>
                            <span class="pull-right-container">
                                <i class="icon icon-angle-left"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="layout.html"><i class="icon icon-circle-blank"></i> 空白页</a></li>
                            <li><a href="login.html"><i class="icon icon-circle-blank"></i> 登录</a></li>
                            <li><a href="error-404.html"><i class="icon icon-circle-blank"></i> 404页</a></li>
                            <li><a href="list.html"><i class="icon icon-circle-blank"></i> 用户列表</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="javascript:;">
                            <i class="icon icon-columns"></i>
                            <span>基础组件</span>
                            <span class="pull-right-container">
                                <i class="icon icon-angle-left"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="component-checkbox-radio.html"><i class="icon icon-circle-blank"></i> 多选和单选框</a></li>
                            <li><a href="component-step.html"><i class="icon icon-circle-blank"></i> 步骤条</a></li>
                        </ul>
                    </li>
                    <li class="treeview">
                        <a href="javascript:;">
                            <i class="icon icon-sign-blank"></i>
                            <span>扩展插件</span>
                            <span class="pull-right-container">
                                <i class="icon icon-angle-left"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li class="active"><a href="config.html"><i class="icon icon-circle-blank"></i> 系统设置</a></li>
                        </ul>
                    </li>
                </ul>
            </section>
        </aside>
        <div class="content-wrapper">
            <div class="content-header">
                <ul class="breadcrumb">
                    <li><a href="#"><i class="icon icon-home"></i></a></li>
                    <li><a href="#">页面演示</a></li>
                    <li class="active">系统设置</li>
                </ul>
            </div>
            <div class="content-body">
                <div class="container-fluid">
                    <div class="alert alert-warning alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <p>页面演示仅供参考，可自行修改</p>
                    </div>
                    <div class="panel">
                        <div class="panel-heading">
                            <div class="panel-title">系统设置</div>
                        </div>
                        <div class="panel-body">
                            <ul class="nav nav-tabs" style="margin-bottom: 20px;">
                                <li class="active"><a href="#">基本</a></li>
                                <li><a href="#">全局</a></li>
                                <li><a href="#">开发</a></li>
                                <li><a href="#">上传</a></li>
                            </ul>
                            <form>
                                <div class="form-group">
                                    <label>网站名称</label>
                                    <input type="text" class="form-control" placeholder="请输入网站名称">
                                </div>
                                <div class="form-group">
                                    <label>网站关键字</label>
                                    <input type="text" class="form-control" placeholder="请输入网站关键字">
                                </div>
                                <div class="form-group">
                                    <label>网站描述</label>
                                    <textarea class="form-control" placeholder="请输入网站描述"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>网站开关</label>
                                    <div class="radio-group">
                                        <label class="radio-inline">
                                            <input type="radio" name="status" checked> 开启
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="status"> 关闭
                                        </label>
                                    </div>
                                    <div class="help-block">关闭后前台将不能访问</div>
                                </div>
                                <div class="form-group">
                                    <label>关站描述</label>
                                    <textarea class="form-control" placeholder="请输入关站描述">网站升级中。。。</textarea>
                                    <div class="help-block">网站关闭时显示</div>
                                </div>
                                <button type="submit" class="btn btn-primary">提交</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- zui js -->
    <script src="/static/plugins/zui/js/zui.min.js"></script>
    <!-- app js -->
    <script src="/static/js/app.js"></script>
    </body>
    </html>
</#compress>
