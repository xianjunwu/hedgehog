<#--compress指令的作用是将页面压缩-->
<#compress >
    <!DOCTYPE html>
    <html lang="zh-CN">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>后台管理页面</title>
        <!-- jquery js -->
        <script src="/static/plugins/zui/lib/jquery/jquery.js"></script>
        <!-- zui css -->
        <link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
        <link rel="stylesheet" href="/static/theme/blue.css">
        <!-- app css -->
        <link rel="stylesheet" href="/static/css/app.css">
        <script src="/static/plugins/zui/lib/kindeditor/kindeditor.min.js"></script>

    </head>
    <body>
    <div class="wrapper">
        <#--通用头部-->
        <#include "common/header.ftl">
        <#--通用侧边栏-->
        <#include "common/sider.ftl">
        <#--内容体-->
        <div class="content-wrapper">
            <div class="content-header">
                <ul class="breadcrumb">
                    <li><a href="#"><i class="icon icon-home"></i></a></li>
                    <li class="active">写博客</li>
                </ul>
            </div>
            <div class="content-body">
                <div class="container-fluid">
                    <div class="row">
                        <textarea id="content" name="content" class="form-control kindeditor" style="height:150px;">Hello, world!</textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function () {
            KindEditor.create('textarea.kindeditor', {
                basePath: '/static/plugins/zui/lib/kindeditor/',
                allowFileManager: true,
                bodyClass: 'article-content'
            });
        });
    </script>
    <!-- zui js -->
    <script src="/static/plugins/zui/js/zui.min.js"></script>
    <!-- app js -->
    <script src="/static/js/app.js"></script>
    </body>
    </html>
</#compress>
