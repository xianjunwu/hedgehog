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
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="list">
          <#if (articles.data?size>0)>
            <div class="items items-hover">
                <#list  articles.data as article>
                  <div class="item">
                    <div class="item-heading">
                      <h4>
                          <#if article.isRecommend>
                            <span class="label label-success">推荐</span>
                          </#if>
                        <a href="/article/detail/${article.id}">${article.title}</a>
                      </h4>
                    </div>
                    <div class="item-content">
                      <div class="text ">${article.summary!""}</div>
                    </div>
                    <div class="item-footer">
                        <#if article.allowComment>
                          <a href="#" class="text-muted">
                            <i class="icon-comments"></i> 243</a>
                        </#if>
                      <span class="text-muted">${article.createTime}</span>
                    </div>
                  </div>
                </#list>
            </div>
              <#if (articles.totalPages>1)>
                <ul id="myPager" class="pager" data-ride="pager" data-max-nav-count="10"
                    data-page="${articles.pageNumber}" data-rec-total="${articles.totalElements}"
                    data-elements="first_icon,prev_icon,nav,next_icon,last_icon"></ul>
              </#if>
          <#else>
            <div class="alert alert-warning with-icon">
              <i class="icon-frown"></i>
              <div class="content">
                <span>分类下不存在文章</span>
              </div>
            </div>
          </#if>

      </div>
    </div>
  </div>

</div>

<#--<footer class="footer">-->
<#--  <div class="text-center">-->
<#--    <span>${(siteInfo.copyright)!'Copyright © 2019-2019 hedgehog  All Rights Reserved. 备案号：浙ICP备17049324号-1'}</span>-->
<#--  </div>-->
<#--</footer>-->
<script>
  $(function () {
    addCategoryAndActiveOne();
    headerSearchFormCanshow();
  });

  function doSearch() {
    var searchContent = $("#searchInput").val().trim();
    alert(searchContent);

  }

  //监听页码改变
  $('#myPager').on('onPageChange', function (e, state, oldState) {
    if (state.page !== oldState.page) {
      location.href = "/article/list/" + location.pathname.split("/")[3] + "?pageNumber="
          + state.page;
    }
  });

</script>
<!-- zui js -->
<script src="/static/plugins/zui/js/zui.min.js"></script>
<!-- app js -->
<script src="/static/js/app.js"></script>
</body>
</html>
