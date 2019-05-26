<#compress >
  <#include "common/public.ftl">
  <@header>dengyi.pro | 搜索结果</@header>
  <nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse"
              data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">导航按钮</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/">dengyi.pro</a>
    </div>

    <#--<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">-->
    <#--<ul class="nav navbar-nav">-->
    <#--<li class="active">-->
    <#--<a href="#">Link</a>-->
    <#--</li>-->
    <#--<li>-->
    <#--<a href="#">Link</a>-->
    <#--</li>-->
    <#--<li class="dropdown">-->
    <#--<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong-->
    <#--class="caret"></strong></a>-->
    <#--<ul class="dropdown-menu">-->
    <#--<li>-->
    <#--<a href="#">Action</a>-->
    <#--</li>-->
    <#--<li>-->
    <#--<a href="#">Another action</a>-->
    <#--</li>-->
    <#--<li>-->
    <#--<a href="#">Something else here</a>-->
    <#--</li>-->
    <#--<li class="divider">-->
    <#--</li>-->
    <#--<li>-->
    <#--<a href="#">Separated link</a>-->
    <#--</li>-->
    <#--<li class="divider">-->
    <#--</li>-->
    <#--<li>-->
    <#--<a href="#">One more separated link</a>-->
    <#--</li>-->
    <#--</ul>-->
    <#--</li>-->
    <#--</ul>-->
    <#--<form class="navbar-form navbar-left" role="search">-->
    <#--<div class="form-group">-->
    <#--<input type="text" class="form-control"/>-->
    <#--</div>-->
    <#--<button type="submit" class="btn btn-default">Submit</button>-->
    <#--</form>-->
    <#--<ul class="nav navbar-nav navbar-right">-->
    <#--<li>-->
    <#--<a href="#">Link</a>-->
    <#--</li>-->
    <#--<li class="dropdown">-->
    <#--<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong-->
    <#--class="caret"></strong></a>-->
    <#--<ul class="dropdown-menu">-->
    <#--<li>-->
    <#--<a href="#">Action</a>-->
    <#--</li>-->
    <#--<li>-->
    <#--<a href="#">Another action</a>-->
    <#--</li>-->
    <#--<li>-->
    <#--<a href="#">Something else here</a>-->
    <#--</li>-->
    <#--<li class="divider">-->
    <#--</li>-->
    <#--<li>-->
    <#--<a href="#">Separated link</a>-->
    <#--</li>-->
    <#--</ul>-->
    <#--</li>-->
    <#--</ul>-->
    <#--</div>-->

  </nav>
<#--搜索页面头-->
  <div class="row-fluid" style="margin-top: 60px">
    <div class="col-md-4"></div>
    <div class="col-md-4">
      <form action="/search" method="get" id="searchForm">
        <div class="input-group inner cover">
          <form action="/search" id="searchForm">
            <input name="key" type="text" class="form-control" id="searchContent" value="${key}">
            <span class="input-group-btn">
             <button class="btn btn-primary" type="button" onclick="doSubmit()">搜索</button>
          </span>
        </div>
      </form>
      </form>
    </div>
  </div>
  <div class="row-fluid">
    <div class="col-md-12">
      <#--文章列表-->
      <div class="content">
        <div class="post animated fadeInDown">
          <#if articles??>
            <#list articles as article>
            <#--文章标题-->
              <div class="post-title">
                <h3>
                  <a href="/article/detail/${article.id}"
                     style="text-decoration: none">${article.title}</a>
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
          <#else>
            <div style="text-align: center;padding-top: 20%">
              <span style="font-size: 30px;color: lightgrey">未搜索到相关信息</span>
            </div>
          </#if>
          <div id="Paginator" style="text-align: center">
            <ul id="pageLimit"></ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    function doSubmit() {
      if ($("#searchContent").val() != "") {
        $("#searchForm").submit();
      }
    }
  </script>
  <@footer></@footer>
</#compress>