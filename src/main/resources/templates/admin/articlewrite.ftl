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
                        <form method="post">
                            <input type="hidden" id="id" name="id">
                            <div class="col-md-12">
                                <div class="input-control">
                                    <input id="title" name="title" type="text" class="form-control input-lg" onfocus="removeError()" placeholder="文章标题">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <textarea class="form-control" name="summary" rows="3" placeholder="摘要"></textarea>
                            </div>
                            <div class="col-md-12">
                                <textarea id="content" name="content" class="form-control kindeditor" style="height:150px;">Hello, world!</textarea>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <button class="btn btn-block" type="button" onclick="saveAsDraft()">保存为草稿</button>
                                </div>
                                <div class="col-md-6">
                                    <button class="btn btn-block btn-success" type="button" onclick="saveAndPublish()">保存并发布</button>
                                </div>
                            </div>
                        </form>
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

        //在提交之前都去判断
        function saveAsDraft() {
            var tileInput = $("#title");
            if (tileInput.val() === '') {
                tileInput.parent().addClass('has-error');
            } else {
                var trueTile = tileInput.val().trim();
                $.post("/article/write/saveOrUpdate", {id: $("#id").val(), title: trueTile}, function (callback) {
                    if (callback != null) {
                        $("#id").val(callback.id);
                        console.log($("#id").val());
                        //浮动消息通知
                        new $.zui.Messager('保存草稿成功！', {
                            icon: 'bell', // 定义消息图标
                            time: 1000
                        }).show();
                    } else {
                        //浮动消息通知
                        new $.zui.Messager('保存草稿失败！', {
                            icon: 'bell', // 定义消息图标
                            time: 1000
                        }).show();
                    }

                });

            }
        }

        // 当输入框选中，则清除error样式

        function removeError() {
            $("#title").parent().removeClass('has-error');
        }

        function saveAndPublish() {
            new $.zui.Messager('文章保存并发布成功', {
                type: 'success', // 定义颜色主题，
                time: 1000,
                icon: 'ok'
            }).show();
        }
    </script>
    <!-- zui js -->
    <script src="/static/plugins/zui/js/zui.min.js"></script>
    <!-- app js -->
    <script src="/static/js/app.js"></script>
    </body>
    </html>
</#compress>
