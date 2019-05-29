<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<#--<meta name="baidu-site-verification" content="${webSeo.btoken}"/>-->
	<#--<meta name="google-site-verification" content="${webSeo.gtoken}"/>-->
	<#--<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ &ndash;&gt;-->
	<#--<meta name="description" content="${webSeo.description}">-->
	<#--<meta name="author" content="${webSeo.author}">-->
	<#--<meta name="keywords" content="${webSeo.keywords}"/>-->
	<#--<link rel="icon" href="${commonInfo.pwebFaviconUrl}">-->
	<title>dengyi.pro</title>
	<!-- jquery js -->
	<script src="/static/plugins/zui/lib/jquery/jquery.js"></script>
	<!-- zui css -->
	<link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
	<link rel="stylesheet" href="/static/theme/blue.css">
	<!-- app css -->
	<link rel="stylesheet" href="/static/css/app.css">
</head>
<body>
<#include "common/header.ftl">
<div class="indexCenter">
	<div class="text-center">
		<img src="http://zui.sexy/docs/img/img2.jpg" width="200px" height="200px" class="img-circle" alt="圆形图片">
	</div>
	<div  class="text-center" style="margin: 20px">
		<span class="text-info">不断学习，不断提高</span>
	</div>
	<form id="searchForm" action="/search/doSearch" method="get">
		<div class="input-group">
			<div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example"
				 id="searchboxExample">
				<input id="searchInput" type="search" name="key" class="form-control search-input input-lg"
					   placeholder="搜索">
				<label for="searchInput" class="input-control-icon-left search-icon "></label>
			</div>
			<span class="input-group-btn">
                <button class="btn btn-primary btn-lg" type="button" onclick="doSearch()">搜索</button>
        </span>
		</div>
	</form>
</div>
<footer class="navbar-fixed-bottom">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="text-center" style="padding-bottom: 20px">
					<span style="color: #999">Copyright © 2019-2019 hedgehog  All Rights Reserved. 备案号：闽ICP备15012807号-1</span>
				</div>
			</div>
		</div>

	</div>
</footer>
<script>
    /**
     * 加载分类
     */
    $(function () {
        $.get("/category/findAllCategory", function (data) {
            if (data.result === 'success') {
                data.data.forEach(function (value, i) {
                    $("#category").append("<li><a href='/article/list/" + value.path + "'>" + value.categoryName + "</a></li>");
                });
            } else {
                console.log("查询分类失败");
            }
        })
    });

    function doSearch() {
        var searchContent = $("#searchInput").val().trim();
        $("#searchForm").submit();

    }
</script>
<!-- zui js -->
<script src="/static/plugins/zui/js/zui.min.js"></script>
<!-- app js -->
<script src="/static/js/app.js"></script>
</body>
</html>
