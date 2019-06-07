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
		<link rel="stylesheet" href="/static/plugins/zui/lib/calendar/zui.calendar.min.css">
		<script src="/static/plugins/zui/lib/calendar/zui.calendar.min.js"></script>
		<!-- zui css -->
		<link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
		<link rel="stylesheet" href="/static/theme/blue.css">
		<!-- app css -->
		<link rel="stylesheet" href="/static/css/app.css">


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
					<li class="active">仪表盘</li>
				</ul>
			</div>
			<div class="content-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-2 col-sm-6 col-xs-12">
							<div class="info-box bg-info" onclick="location.href='/admin/article/list/' ">
								<div class="info-box-icon">
									<i class="icon icon-file-text"></i>
								</div>
								<div class="info-box-content">
									<span class="info-box-text">文章总量</span>
									<span class="info-box-number">${articleNumber}
                                        <small>篇</small>
                                    </span>
								</div>
							</div>
						</div>
						<div class="col-md-2 col-sm-6 col-xs-12">
							<div class="info-box bg-primary" onclick="location.href='/admin/article/list/' ">
								<div class="info-box-icon">
									<i class="icon icon-user"></i>
								</div>
								<div class="info-box-content">
									<span class="info-box-text">评论总量</span>
									<span class="info-box-number">${commontNumber}
                                        <small>条</small>
                                    </span>
								</div>
							</div>
						</div>
						<div class="col-md-2 col-sm-6 col-xs-12">
							<div class="info-box bg-warning" onclick="location.href='/admin/category/' ">
								<div class="info-box-icon">
									<i class="icon icon-bars"></i>
								</div>
								<div class="info-box-content">
									<span class="info-box-text">栏目总量</span>
									<span class="info-box-number">${categoryNumber}
                                        <small>个</small>
                                    </span>
								</div>
							</div>
						</div>
						<div class="col-md-2 col-sm-6 col-xs-12">
							<div class="info-box bg-green">
								<div class="info-box-icon">
									<i class="icon icon-eye-open"></i>
								</div>
								<div class="info-box-content">
									<span class="info-box-text">PV总量</span>
									<span class="info-box-number">18953
                                        <small>次</small>
                                    </span>
								</div>
							</div>
						</div>
						<div class="col-md-2 col-sm-6 col-xs-12">
							<div class="info-box bg-danger">
								<div class="info-box-icon">
									<i class="icon icon-time"></i>
								</div>
								<div class="info-box-content">
									<span class="info-box-text">异常日志数</span>
									<span class="info-box-number">${logNum}
                                        <small>条</small>
                                    </span>
								</div>
							</div>
						</div>
						<div class="col-md-2 col-sm-6 col-xs-12">
							<div class="info-box bg-default">
								<div class="info-box-icon">
									<i class="icon icon-time"></i>
								</div>
								<div class="info-box-content">
									<span class="info-box-text">系统运行天数</span>
									<span class="info-box-number">${days}
                                        <small>天</small>
                                    </span>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12">
							<!-- HTML 代码 -->
							<div id="calendar" class="calendar"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="panel">
								<div class="panel-heading">
									<div class="panel-title">产品信息</div>
								</div>
								<div class="panel-body">
									<table class="table table-info">
										<tr>
											<td>产品名称</td>
											<td>hedgehog(刺猬)</td>
										</tr>
										<tr>
											<td>核心框架</td>
											<td>zui bootstrap springboot springdatajpa solr mysql</td>
										</tr>
										<tr>
											<td>开发作者</td>
											<td>大熊</td>
										</tr>
										<tr>
											<td>联系方式</td>
											<td>
												<a class="icon icon-envelope" href="mailto:dengyi@dengyi.pro">
													dengyi@dengyi.pro
												</a>
											</td>
										</tr>
										<tr>
											<td>交流讨论</td>
											<td><a target="_blank"
												   href="http://shang.qq.com/wpa/qunwpa?idkey=65deab2f8ea1e9d2445c3262d133da48fe9de53bd90a3146c3f7bb6fb9d63ead"><img
															border="0" src="http://pub.idqqimg.com/wpa/images/group.png"
															alt="zui-admin后台模板交流"
															title="zui-admin后台模板交流"></a></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="panel">
								<div class="panel-heading">
									<div class="panel-title">服务器信息</div>
								</div>
								<div class="panel-body">
									<table class="table table-info">
										<tr>
											<td>操作系统</td>
											<td>${systemInfo.systemType}</td>
										</tr>
										<tr>
											<td>JDK版本</td>
											<td>${systemInfo.javaVersion}</td>
										</tr>
										<tr>
											<td>容器类型</td>
											<td>${systemInfo.containerTypeAndVersion}</td>
										</tr>
										<tr>
											<td>数据库类型</td>
											<td>${systemInfo.databaseTypeAndVersion}</td>
										</tr>
										<tr>
											<td>系统时间</td>
											<td>${systemInfo.systemTime}</td>
										</tr>
									</table>
								</div>
							</div>
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

	<script>
        /* JS 代码 */
        $('#calendar').calendar();
	</script>
	</body>
	</html>
</#compress>
