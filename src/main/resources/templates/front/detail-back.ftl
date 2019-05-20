<#include "common/public.ftl">
<@header>dengyi.pro | ${article.title}</@header>
<#include "common/head.ftl">
<style>
  pre {
    position: relative;
    margin-bottom: 24px;
    border-radius: 3px;
    border: 1px solid #C3CCD0;
    background: #FFF;
    overflow: hidden;
  }

  code {
    display: block;
    padding: 12px 24px;
    overflow-y: auto;
    font-weight: 300;
    font-family: Menlo, monospace;
    font-size: 0.8em;
  }

  code.has-numbering {
    margin-left: 21px;
  }

  .pre-numbering {
    position: absolute;
    top: 0;
    left: 0;
    width: 20px;
    padding: 12px 2px 12px 0;
    border-right: 1px solid #C3CCD0;
    border-radius: 3px 0 0 3px;
    background-color: #EEE;
    text-align: right;
    font-family: Menlo, monospace;
    font-size: 1.0em;
    color: #AAA;
  }

  ul.nav-tabs {
    width: 240px;
    margin-top: 20px;
    margin-left: 30px;
    border-radius: 4px;
    border: 1px solid #ddd;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
  }

  ul.nav-tabs li {
    margin: 0;
    border-top: 1px solid #ddd;
  }

  ul.nav-tabs li:first-child {
    border-top: none;
  }

  ul.nav-tabs li a {
    margin: 0;
    padding: 8px 16px;
    border-radius: 0;
  }

  ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover {
    color: #fff;
    background: #0088cc;
    border: 1px solid #0088cc;
  }

  ul.nav-tabs li:first-child a {
    border-radius: 4px 4px 0 0;
  }

  ul.nav-tabs li:last-child a {
    border-radius: 0 0 4px 4px;
  }

  ul.nav-tabs.affix {
    top: 60px; /* Set the top position of pinned element */
  }
</style>
<div class="row-fluid">
  <div class="col-md-12">
    <ul class="breadcrumb">
      <li>
        <#switch  article.type>
          <#case 0>
            <a href="/article">博客</a>
            <#break>
          <#case 1>
            <a href="/teach">教程</a>
            <#break>
          <#case 2>
            <a href="/readBook">读书</a>
            <#break>
          <#case 3>
            <a href="/openSource">开源项目</a>
            <#break>
        </#switch>
      </li>
      <li class="active">
        ${article.title}
      </li>
    </ul>
  </div>
</div>
<div class="col-md-2  visible-lg visible-md" id="myScrollspy" role="complementary">
  <ul class="nav nav-tabs nav-stacked hidden-sm hidden-xs menu" data-spy="affix"
      data-offset-top="10"></ul>
</div>
<div class="col-md-10">
  <#--文章头部-->
  <div class="page-header" style="padding-bottom: 20px">
    <h1 class="text-center" style="font-weight: bold">${article.title}</h1>
    <div class="form-inline">
      <i class="fa fa-clock-o fa-lg hidden-sm hidden-xs"><span
            style="color: lightgrey;font-size: 16px;padding-left: 5px">发布于${article.lastUpdateTime ! article.createTime}</span></i>
      <div class="pull-right" style="padding-right: 30px">
        <#--发送邮件-->
        <a class="fa fa-envelope fa-lg" title="联系" style="padding-right: 10px"
           href="mailto:dengyi@dengyi.pro"></a>
        <i class="fa fa-heart fa-lg" style="padding-right: 10px;color: red"> <span
              style="color: lightgrey;font-size: 16px;padding-left: 0px">${article.hearts}</span></i>
        <#--评论数-->
        <#if article.allowComment >
          <#if article.pwebArticleComments??>
            <i class="fa fa-comments-o fa-lg"></i>
          <#else>
            <i class="fa fa-comments fa-lg"><span
                  style="color: lightgrey;font-size: 16px;padding-left: 5px">11</span></i>
          </#if>
        </#if>
      </div>
    </div>
  </div>
  <#--文章内容-->
  <div style="margin-top: 20px">
    <div style="background-color: whitesmoke; padding: 20px 10px 10px;border-radius: 5px">
      <span style="font-weight: bold">摘要: &nbsp;</span>${article.summary}
    </div>
    <div id="content" style="margin-top: 20px">
      ${article.content}
    </div>
    <#--文章评论-->
    <#--<div style="border-top: solid red 1px" class="clearfix">-->
    <#--<div class="inline">-->
    <#--<i class="fa fa-user fa-lg"></i>-->
    <#--<span>测试评论</span>-->
    <#--<span class="pull-right">2018年12月20</span>-->
    <#--</div>-->
    <#--</div>-->
  </div>
  <#--<div class="row" style="margin-top: 30px">-->
  <#--<div class="col-md-12">-->
  <#--<div style="position: absolute;bottom: 10px;left: 40%; font-size: 10px;text-align: center">-->
  <#--<span>-->
  <#--<span style="color: gray">Designed by</span>-->
  <#--<a href="https://www.dengyi.pro" style="text-decoration: none">dengyi</a>-->
  <#--<div class="by_halo" style="color: gray">-->
  <#--Copyright ©2017-2018 dengyi.pro 版权所有 备案号:浙ICP备17049324号-->
  <#--</div>-->
  <#--</span>-->
  <#--</div>-->
  <#--</div>-->
  <#--</div>-->
</div>

<script>
  //取巧返回顶部
  function backToTop(element) {
    $(element).attr('href', '#top');
  }

  //页面加载生成目录
  $(function () {
    var i = 0;
    $("#content").children().each(function (index, element) {
      var tagName = $(this).get(0).tagName;
      if (tagName.substr(0, 1).toUpperCase() === "H") {
        var contentH = $(this).html();//获取内容
        var markid = "mark-" + tagName + "-" + index.toString();
        $(this).attr("id", markid);//为当前h标签设置id
        //添加目录
        if (index === 0) {
          $(".menu").append(
              "<li class='active'><a href='#" + markid + "'>" + contentH + "</a></li>");//在目标DIV中添加内容
        } else {
          $(".menu").append("<li><a href='#" + markid + "'>" + contentH + "</a></li>");//在目标DIV中添加内容
        }
        i++;
      }
    });
    var j = 0;
    //统计出最大出现次数，方便添加回到顶部
    $("#content").children().each(function (index, element) {
      var tagName = $(this).get(0).tagName;
      if (tagName.substr(0, 1).toUpperCase() === "H") {
        j++;
      }
    });
    if (i === j) {
      $(".menu").append("<li><a onclick='backToTop(this)'style='color: gray'>返回顶部</a></li>");
    }
  });
  //添加行号
  $('pre code').each(function () {
    var lines = $(this).text().split('\n').length - 1;
    var $numbering = $('<ul/>').addClass('pre-numbering');
    $(this)
    .addClass('has-numbering')
    .parent()
    .append($numbering);
    for (i = 1; i <= lines; i++) {
      $numbering.append($('<li/>').text(i));
    }
  });
  //加载hi
  hljs.initHighlightingOnLoad();
</script>
<@footer></@footer>