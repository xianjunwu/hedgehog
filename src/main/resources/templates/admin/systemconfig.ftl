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
		<#include "common/sider.ftl">

		<div class="content-wrapper">
			<div class="content-header">
				<ul class="breadcrumb">
					<li><a href="#"><i class="icon icon-home"></i></a></li>
					<li><a href="#">系统设置</a></li>
					<li class="active">基础设置</li>
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
							<div class="panel-title">基础设置</div>
						</div>
						<div class="panel-body">
							<ul class="nav nav-tabs" style="margin-bottom: 20px;">
								<li class="active"><a href="#">网站基本信息设置</a></li>
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
