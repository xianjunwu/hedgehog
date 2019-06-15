<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <#if seo??>
    <meta name="baidu-site-verification" content="${seo.btoken}"/>
    <meta name="google-site-verification" content="${seo.gtoken}"/>
    <meta name="description" content="${seo.description}">
    <meta name="author" content="${seo.author}">
    <meta name="keywords" content="${seo.keywords}"/>
  <#--		<link rel="icon" href="${}">-->
  <#else>
    <meta name="author" content="邓艺">
    <meta name="description" content="邓艺的个人网站">
    <meta name="keywords" content="邓艺，学习，成长"/>
  </#if>
  <title>dengyi.pro | 首页</title>
  <!-- jquery js -->
  <script src="/static/plugins/zui/lib/jquery/jquery.js"></script>
  <script src="/static/js/hedgehog.js"></script>
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
    <img src="/static/images/img2.jpg" width="200px" height="200px" class="img-circle"
         alt="圆形图片">
  </div>
  <div class="text-center" style="margin: 20px">
    <span class="text-info">${(siteInfo.slogen)!'好好学习，天天向上'}</span>
  </div>
  <form id="searchForm" action="/search" method="get">
    <div class="input-group">
      <div
          class="input-control search-box search-box-circle has-icon-left has-icon-right search-example"
          id="searchboxExample">
        <input id="searchInput" type="search" name="key" class="form-control search-input input-lg"
               placeholder="搜索">
        <label for="searchInput" class="input-control-icon-left search-icon "></label>
      </div>
      <span class="input-group-btn">
                <button class="btn btn-primary btn-lg" type="button"
                        onclick="doSearch()">搜索</button>
        </span>
    </div>
  </form>
</div>

<div style="bottom: 0">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="text-center" style="padding-bottom: 10px">
          <span style="color: #999">${(siteInfo.copyright)!'Copyright © 2019-2019 hedgehog  All Rights Reserved. 备案号：浙ICP备17049324号-1'}</span>
        </div>
      </div>
    </div>

  </div>
</div>
<script>
  $(function () {
    addCategory();
    headerSearchFormCanshow();
  });

  function doSearch() {
    var searchContent = $("#searchInput").val().trim();
    //不为空时发请求
    if (searchContent !== '') {
      $("#searchForm").submit();
    }
  }
</script>
<!-- zui js -->
<script src="/static/plugins/zui/js/zui.min.js"></script>
<!-- app js -->
<script src="/static/js/app.js"></script>
</body>
</html>
