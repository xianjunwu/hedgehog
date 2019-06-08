<#--freemarker的宏定义-->
<#macro header >
	<!DOCTYPE html>
	<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="baidu-site-verification" content="${webSeo.btoken}"/>
		<meta name="google-site-verification" content="${webSeo.gtoken}"/>
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<meta name="description" content="${webSeo.description}">
		<meta name="author" content="${webSeo.author}">
		<meta name="keywords" content="${webSeo.keywords}"/>
		<link rel="icon" href="${commonInfo.pwebFaviconUrl}">
		<#--<#nested >自定义的表情可以在宏中使用任意次数，用于参数的传递-->
		<title><#nested ></title>
		<!-- Bootstrap -->
		<link href="/static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="/static/plugins/highlightjs/monokai.css" rel="stylesheet">
		<link href="/static/plugins/font-awesome/css/font-awesome.css" type="text/css" rel="stylesheet"/>
		<meta name="apple-mobile-web-app-capable" content="yes"/>
		<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
		<meta name="format-detection" content="telephone=yes"/>
		<meta name="renderer" content="webkit">
		<meta name="theme-color" content="#fff">
		<link rel="alternate" type="application/rss+xml" title="atom 1.0" href="/feed.xml">
		<style>
			html,
			body {
				height: 100%;
				padding: 0;
				margin: 0;
			}
		</style>
	</head>
	<body style="zoom: 1">
	<script src="/static/plugins/jquery/jquery-1.12.4.min.js"></script>
	<script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/static/plugins/paginator/bootstrap-paginator.js"></script>
	<script src="/static/plugins/paginator/bootstrap-paginator.js"></script>
	<script src="/static/plugins/highlightjs/highlight.pack.js"></script>
	<div class="container-fluid"  style="height:100%;padding-right: 0px;padding-left: 0px">
	<div class="row-fluid" style="height: 100%">
</#macro>

<#--公用脚部-->
<#macro footer>
	</div>
	</div>
	</body>
</#macro>