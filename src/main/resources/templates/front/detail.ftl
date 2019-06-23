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
  <script src="/static/plugins/zui/js/zui.min.js"></script>
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
      <dt>最后修订：</dt>
      <dd>${article.updateTime! article.createTime}</dd>
      <dt></dt>
      <dd class="pull-right">
        <a class="label label-danger" onclick="ilike()"><i class="icon-heart"></i>11</a>
        <span class="label label-info"><i class="icon-eye-open"></i> 235</span>
      </dd>
    </dl>
    <section class="abstract">
      <p><strong>摘要：</strong>${article.summary}</p>
    </section>
    <input type="hidden" id="articleId" value="${article.id}">
  </header>
    <#--文章内容-->
  <section class="content">
      ${article.content}
  </section>

    <#--评论-->
    <#if article.allowComment ! false>
      <div class="comments">
        <header>
          <div class="pull-right"><a href="#commentReplyForm2" class="btn btn-primary"><i
                  class="icon-comment-alt" ></i> 发表评论</a></div>
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
              <div class="form-group comment-user">

                <div class="input-group">
                  <span class="input-group-addon"><i class="icon-user"></i></span>
                  <input type="text" id="userName" class="form-control" placeholder="评论用户名">
                  <span class="input-group-addon fix-border"><i class="icon-envelope"></i></span>
                  <input type="text" id="userEmail" class="form-control"
                         placeholder="邮箱(做通知用，不会在评论中显示)">
                </div>

              </div>
              <div class="form-group">
							<textarea class="form-control new-comment-text" rows="2" id="content"
                        placeholder="撰写评论..."></textarea>
              </div>
              <button type="button" class="btn btn-block btn-primary" onclick="submitComment()">
                提交评论
              </button>
            </form>
          </div>
        </footer>
      </div>
    </#if>

</article>
<script>
  //页面加载生成目录
  $(function () {
    addCategoryAndActiveOne();
    headerSearchFormCanshow();
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

  function submitComment() {
    var param = {
      userName: $("#userName").val().trim(),
      userEmail: $("#userEmail").val().trim(),
      content: $("#content").val().trim(),
      article: {
        id: $("#articleId").val()
      }
    };
    $.ajaxSettings.contentType = "application/json;charset=UTF-8";
    $.post("/commont/save", JSON.stringify(param), function (data) {
      if (data.result === 'success') {
        new $.zui.Messager('发布评论成功，等待同意后即可显示！', {
          type: 'success', // 定义颜色主题，
          time: 2000,
          icon: 'ok'
        }).show();
      } else {
        //浮动消息通知
        new $.zui.Messager('发表评论失败！', {
          icon: 'warning-sign', // 定义消息图标
          time: 1000
        }).show();
      }

    });
  }
</script>
</body>
</html>
