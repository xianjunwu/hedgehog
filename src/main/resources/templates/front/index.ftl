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
  <link rel="stylesheet" href="/static/css/pagecommon.css">
</head>
<body>
<#include "common/header.ftl">
<div class="indexCenter">
  <div class="text-center">
    <img src="/static/images/img2.jpg" width="200px" height="200px" class="img-circle"
         alt="圆形图片">
  </div>
  <div class="text-center" style="margin: 20px">
    <span class="text-muted text-ellipsis" style="font-size: 20px">${(siteInfo.slogen)!'好好学习，天天向上'}</span>
  </div>
  <div style="margin: 20px" class="hidden-xs">
    <form action="/search" method="get">
      <div class="input-group">
        <div
            class="input-control search-box search-box-circle has-icon-left has-icon-right search-example"
            id="searchboxExample">
          <input id="searchInput" type="search" name="key" class="form-control search-input input-lg">
          <label for="searchInput" class="input-control-icon-left search-icon "></label>
        </div>
        <span class="input-group-btn">
                <button class="btn  btn-lg" type="submit">搜索</button>
        </span>
      </div>
    </form>
  </div>
</div>
<footer class="footer">
  <div class="text-center">
    <span>${(siteInfo.copyright)!'Copyright © 2019-2019 hedgehog  All Rights Reserved. 备案号：浙ICP备17049324号-1'}</span>
  </div>
</footer>
<script>
  $(function () {
    addCategoryAndActiveOne();
    headerSearchFormCanshow();
  });
</script>
<!-- zui js -->
<script src="/static/plugins/zui/js/zui.min.js"></script>
<!-- app js -->
<script src="/static/js/app.js"></script>
</body>
</html>
