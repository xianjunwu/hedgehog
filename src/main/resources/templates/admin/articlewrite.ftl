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
		<link rel="stylesheet" href="/static/plugins/zui/lib/kindeditor/plugins/code/prettify.css">
		<link rel="stylesheet" href="/static/plugins/zui/lib/kindeditor/kindeditor.min.css">
		<script src="/static/plugins/zui/lib/kindeditor/plugins/code/prettify.js"></script>

	</head>
	<script type="text/javascript">
        prettyPrint();
	</script>
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
						<form method="post" action="/admin/article/write/saveOrUpdate">
							<input type="hidden" id="id" name="id">
							<div class="col-md-12" style="margin-top: 20px">
								<div class="input-control">
									<input id="title" name="title" type="text" class="form-control input-lg"
										   onfocus="removeError()" placeholder="文章标题">
								</div>
							</div>
							<div class="col-md-12" style="margin-top: 20px">
								<textarea class="form-control" name="summary" id="summary" rows="3" placeholder="摘要"></textarea>
							</div>
							<div class="col-md-12" style="margin-top: 20px">
								<textarea id="content" name="content" class="form-control kindeditor"
										  style="height:550px;" placeholder="尽情创作"></textarea>
							</div>
							<footer class="navbar-fixed-bottom">
								<div class="col-md-12 ">
									<div class="btn-group pull-right inline-block">
										<button class="btn btn-block" type="button" onclick="saveAsDraft()">保存为草稿
										</button>
										<button class="btn btn-block btn-success" type="button"
												onclick="saveAndPublish()">保存并发布
										</button>
									</div>
								</div>
							</footer>

						</form>
					</div>
				</div>
				<#--选择文章分类-->
				<div class="form-inline" style="margin-top: 20px">
					<div class="form-group">
						<label for="category">选择分类</label>
						<select class="form-control" id="category">
						</select>
					</div>
					<div class="form-group">
						<label for="category">是否允许评论</label>
						<select class="form-control" id="allowComment">
							<option value="true">允许</option>
							<option value="false">不允许</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
        var kindeditor;
        $(function () {
            kindeditor = KindEditor.create('textarea.kindeditor', {
                basePath: '/static/plugins/zui/lib/kindeditor/',
                allowFileManager: true,
                bodyClass: 'article-content'
        });
            //查询所有的分类
            $.get("/admin/category/findAllCategory", function (data) {
                if (data.result === 'success') {
                    data.data.forEach(function (value,i) {
                        $("#category").append("<option value='"+value.id+"'>"+value.categoryName+"</option>");
                    });
                } else {
                    console.log('分类加载失败');
                }
            })
        });

        //在提交之前都去判断
        function saveAsDraft() {
            var tileInput = $("#title");
            if (tileInput.val() === '') {
                tileInput.parent().addClass('has-error');
                new $.zui.Messager('请将文章填写完整', {
                    type: 'warning', // 定义颜色主题，
                    time: 1000,
                    icon: 'warning-sign'
                }).show();
            } else {
                var trueTile = tileInput.val().trim();
                $.post("/admin/article/write/saveOrUpdate",
                    {
                        id: $("#id").val(),
                        title: trueTile,
                        summary: $("#summary").val(),
                        content: $("#content").val()

                    }, function (callback) {
                        if (callback != null) {
                            $("#id").val(callback.id);
                            //浮动消息通知
                            new $.zui.Messager('保存草稿成功！', {
                                type: 'success', // 定义颜色主题，
                                time: 1000,
                                icon: 'ok'
                            }).show();
                        } else {
                            //浮动消息通知
                            new $.zui.Messager('保存草稿失败！', {
                                icon: 'warning-sign', // 定义消息图标
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
            kindeditor.sync();
            var tileInput = $("#title");
            console.log(tileInput.val());
            if (tileInput.val() === '') {
                tileInput.parent().addClass('has-error');
                new $.zui.Messager('请将文章填写完整', {
                    type: 'warning', // 定义颜色主题，
                    time: 1000,
                    icon: 'warning-sign'
                }).show();
            } else {
                var trueTile = tileInput.val().trim();
                var parms={
                    "id": $("#id").val(),
                    "title": trueTile,
                    "summary": $("#summary").val(),
                    "content": $("#content").val(),
                    "articleStatus": true,
                    "allowComment":$("#allowComment").val(),
					"category":{
                        "id":$("#category").val()
					}

				};
                $.ajaxSettings.contentType = "application/json;charset=UTF-8";
                $.post("/admin/article/write/saveOrUpdate", JSON.stringify(parms), function (callback) {
                        if (callback != null) {
                            $("#id").val(callback.id);
                            //浮动消息通知
                            new $.zui.Messager('保存草稿成功！', {
                                type: 'success', // 定义颜色主题，
                                time: 1000,
                                icon: 'ok'
                            }).show();
                        } else {
                            //浮动消息通知
                            new $.zui.Messager('保存失败！', {
                                icon: 'warning-sign', // 定义消息图标
                                time: 1000
                            }).show();
                        }

                    });

            }
        }
	</script>
	<!-- zui js -->
	<script src="/static/plugins/zui/js/zui.min.js"></script>
	<!-- app js -->
	<script src="/static/js/app.js"></script>
	</body>
	</html>
</#compress>
