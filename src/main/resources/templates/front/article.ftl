<#compress >
  <#include "common/public.ftl">
  <@header>dengyi.pro | 博客</@header>
  <#include "common/sidebar.ftl">
<div class="col-md-8" style="height: 100%">
  <#include "common/head.ftl">
  <#--文章列表-->
  <div class="content" style="padding-left: 20px">
    <div class="post animated fadeInDown">
      <#if page.totalPages !=0>
        <#list page.content as article>
        <#--文章标题-->
          <div class="post-title">
          <h3>
          <a href="/article/detail/${article.id}" style="text-decoration: none">${article.title}</a>
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
        <#if page.totalPages gt 1>
          <div id="Paginator" style="text-align: center">
            <ul id="pageLimit"></ul>
          </div>
        </#if>
      <#else >
        <div style="text-align: center">
          <span style="font-size: 30px;color: lightgrey">分类下不存在文章</span>
        </div>
      </#if>
      <#--<div id="Paginator" style="position: absolute;bottom: 20px">-->
      <#--<ul id="pageLimit"></ul>-->
      <#--</div>-->
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

  $('#pageLimit').bootstrapPaginator({
    currentPage: 1,//当前的请求页面。
    totalPages: 20,//一共多少页。
    size: "normal",//应该是页眉的大小。
    bootstrapMajorVersion: 3,//bootstrap的版本要求。
    alignment: "right",
    numberOfPages: 5,//一页列出多少数据。
    itemTexts: function (type, page, current) {//如下的代码是将页眉显示的中文显示我们自定义的中文。
      switch (type) {
        case "first":
          return "首页";
        case "prev":
          return "上一页";
        case "next":
          return "下一页";
        case "last":
          return "末页";
        case "page":
          return page;
      }
    },
    //给每个页眉绑定一个事件，其实就是ajax请求，其中page变量为当前点击的页上的数字。
    onPageClicked: function (event, originalEvent, type, page) {
      console.log(page);
      $.ajax({
        url: '/article/page',
        type: 'GET',
        data: {'page': page},
        dataType: 'JSON',
        success: function (callback) {
          //回调成功，将数据
          if (callback.status) {
            console.log(111111111111);
          } else {

          }
          $('tbody').empty();
          var page_count = callback.page_count;
          var page_cont = callback.page_content;
          $('tbody').append(page_cont);
          $('#last_page').text(page_count)
        }
      })
    }
  });
</script>
  <@footer></@footer>
</#compress>
