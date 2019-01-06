<#compress >
    <#include "common/public.ftl">
    <@header>dengyi.pro | 教程</@header>
    <#include "common/sidebar.ftl">
<div class="col-md-8" style="height: 100%">
  <#include "common/head.ftl">
  <#--文章列表-->
  <div class="content">
    <div class="post animated fadeInDown">
      <#if page.totalPages !=0>
        <#list page.content as article>
        <#--文章标题-->
          <div class="post-title">
          <h3>
          <a href="/article/detail/${article.id}">${article.title}</a>
          </h3>
          </div>
        <#--文章简介-->
          <div class="post-content">
          <div class="p_part">
          <p>${article.summary}</p>
          </div>
          </div>
        <#--文章发表时间-->
          <div class="post-footer">
          <div class="meta">
          <div class="info">
          <i class="fa fa-sun-o"></i>
          <span class="date">发表时间:${article.lastUpdateTime ! article.createTime}</span>
          <span class="date">阅读数:${article.views}</span>
          </div>
          </div>
          </div>
        </#list>
      <#else >
        <div  style="text-align: center;margin-top: 35%">
          <span style="font-size: 30px;color: lightgrey">分类下不存在文章</span>
        </div>
      </#if>
    </div>
  </div>
</div>
<script type="text/javascript">
  var url = location.href;
  $("nav ul li a").each(function () {
    if ((url + '/').indexOf($(this).attr('href')) > -1 && $(this).attr('href') != '/') {
      $(this).parent().addClass('active');
      urlstatus = true;
    } else {
      $(this).parent().removeClass('active');
    }
  });

</script>
  <@footer></@footer>
</#compress>
