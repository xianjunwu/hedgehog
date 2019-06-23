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
  <script src="/static/plugins/zui/js/zui.js"></script>
  <!-- zui css -->
  <link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
  <link rel="stylesheet" href="/static/theme/blue.css">
  <!-- app css -->
  <link rel="stylesheet" href="/static/css/app.css">
  <link rel="stylesheet" href="/static/css/articledetail.css">

</head>
<body>
<#include "common/header.ftl">
<article class="article">
    <#--文章页面头部-->
  <header>
    <h1 class="text-center">
        ${article.title}
    </h1>
    <dl class="dl-inline">
      <dt>来源：</dt>
      <dd>dengyi.pro</dd>
      <dt>最后修订：</dt>
      <dd>2016年8月12日 (星期五) 12:53</dd>
      <dt></dt>
      <dd class="pull-right">
        <a class="label label-danger" onclick="ilike()"><i class="icon-heart"></i>11</a>
        <span class="label label-info"><i class="icon-eye-open"></i> 235</span>
      </dd>
    </dl>
    <section class="abstract">
      <p><strong>摘要：</strong>${article.summary}</p>
    </section>
  </header>
    <#--文章内容-->
    <#--	<div class="container-fluid">-->
    <#--		<div class="row">-->
    <#--附加导航存在问题-->
    <#--			<div class="col-md-2  visible-lg visible-md" data-spy="affix">-->
    <#--				<ul class="nav nav-tabs nav-stacked menu" id="myScrollspy"></ul>-->
    <#--			</div>-->
    <#--			<div class="col-md-10 col-xs-12 col-sm-12">-->
  <section class="content">
      ${article.content}
  </section>
    <#--			</div>-->
    <#--		</div>-->
    <#--	</div>-->


    <#--评论-->
    <#if article.allowComment ! false>
      <div class="comments">
        <header>
          <div class="pull-right"><a href="#commentReplyForm2" class="btn btn-primary"><i
                  class="icon-comment-alt"></i> 发表评论</a></div>
          <h3>所有评论</h3>
        </header>
        <section class="comments-list">
          <div class="comment">
            <a href="###" class="avatar">
              <i class="icon-camera-retro icon-2x"></i>
            </a>
            <div class="content">
              <div class="pull-right text-muted">3 个小时前</div>
              <div><a href="###"><strong>张士超</strong></a></div>
              <div class="text">今天玩的真开心！~~~~~~</div>
              <div class="actions">
                <a href="##">回复</a>
              </div>
            </div>
            <div class="comments-list">
              <div class="comment">
                <a href="###" class="avatar">
                  <i class="icon-user icon-2x"></i>
                </a>
                <div class="content">
                  <div class="pull-right text-muted">2 个小时前</div>
                  <div><a href="###"><strong>Catouse</strong></a> <span class="text-muted">回复</span>
                    <a
                        href="###">张士超</a></div>
                  <div class="text">你到底把我家钥匙放哪里了...</div>
                  <div class="actions">
                    <a href="##">回复</a>
                    <a href="##">编辑</a>
                    <a href="##">删除</a>
                  </div>
                </div>
                <div class="comments-list">
                  <div class="comment">
                    <a href="###" class="avatar">
                      <i class="icon-yinyang icon-2x"></i>
                    </a>
                    <div class="content">
                      <div class="pull-right text-muted">1 个小时前</div>
                      <div><a href="###"><strong>门口大爷</strong></a> <span
                            class="text-muted">回复</span>
                        <a href="###">Catouse</a></div>
                      <div class="text">不在我这儿...</div>
                      <div class="actions">
                        <a href="##">回复</a>
                      </div>
                    </div>
                  </div>
                  <div class="comment">
                    <a href="###" class="avatar">
                      <i class="icon-cube-alt icon-2x"></i>
                    </a>
                    <div class="content">
                      <div class="pull-right text-muted">1 个小时前</div>
                      <div><a href="###"><strong>队长</strong></a> <span class="text-muted">回复</span>
                        <a
                            href="###">Catouse</a></div>
                      <div class="text">也不在我这儿...</div>
                      <div class="actions">
                        <a href="##">回复</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="comment">
                <a href="###" class="avatar">
                  <i class="icon-heart-empty icon-2x"></i>
                </a>
                <div class="content">
                  <div class="pull-right text-muted">30 分钟前</div>
                  <div><a href="###"><strong>华师大第一美女</strong></a> <span class="text-muted">回复</span>
                    <a
                        href="###">张士超</a></div>
                  <div class="text">很开心~~~</div>
                  <div class="actions">
                    <a href="##">回复</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <footer>
          <div class="reply-form" id="commentReplyForm2">
            <a href="###" class="avatar"><i class="icon-user icon-2x"></i></a>
            <form class="form">
              <div class="form-group">
                <textarea class="form-control new-comment-text" rows="2"
                          placeholder="撰写评论..."></textarea>
              </div>
              <div class="form-group comment-user">
                <div class="row">
                  <div class="col-md-3">
                    <span class="pull-right">或者</span>
                    <a href="#">登录</a> &nbsp;<a href="##">注册</a>
                  </div>
                  <div class="col-md-7">
                    <div class="form-group">
                      <input type="text" class="form-control" id="nameInputEmail1"
                             placeholder="输入评论显示名称">
                    </div>
                    <div class="form-group">
                      <input type="email" class="form-control" id="exampleInputEmail1"
                             placeholder="输入电子邮件（不会在评论显示）">
                    </div>
                  </div>
                  <div class="col-md-2">
                    <button type="submit" class="btn btn-block btn-primary"><i class="icon-ok"></i>
                    </button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </footer>
      </div>
    </#if>

</article>
<script>
  //页面加载生成目录
  $(function () {
    var i = 0;
    $(".content").children().each(function (index, element) {
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

  function ilike() {
    alert('我喜欢')
  }
</script>
</body>
</html>
