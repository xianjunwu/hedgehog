<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="baidu-site-verification" content="${webSeo.btoken}"/>
  <meta name="google-site-verification" content="${webSeo.gtoken}"/>
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <meta name="description" content="${webSeo.description}">
  <meta name="author" content="${webSeo.author}">
  <meta name="keywords" content="${webSeo.keywords}"/>
  <link rel="icon" href="${commonInfo.pwebFaviconUrl}">
  <title>dengyi.pro</title>
  <!-- Bootstrap core CSS -->
  <script src="/static/plugins/jquery/jquery-1.12.4.min.js"></script>
  <script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
  <link href="/static/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/static/css/cover.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
<div class="site-wrapper">
  <div class="site-wrapper-inner">
    <div class="cover-container">
      <div class="masthead clearfix">
        <div class="inner">
          <h3 class="masthead-brand hidden-xs hidden-sm">dengyi.pro</h3>
          <nav>
            <ul class="nav masthead-nav">
              <li class="active"><a href="/">首页</a></li>
              <li><a href="/article">博客</a></li>
              <li><a href="/teach">教程</a></li>
              <li><a href="/readBook">读书</a></li>
              <li><a href="/openSource">开源项目</a></li>
              <#--<li><a href="mailto:dengyi@dengyi.pro">联系</a></li>-->
            </ul>
          </nav>
        </div>
      </div>
      <div class="inner cover">
        <h1 class="cover-heading">${commonInfo.pwebName}</h1>
        <p class="lead" style="margin-top: 40px">${commonInfo.pwebSlogen}</p>
      </div>
      <form action="/search" method="get" id="searchForm">
        <div class="input-group inner cover">
          <input name="key" type="text" class="form-control" id="searchContent">
          <span class="input-group-btn">
             <button class="btn btn-success" type="button" onclick="doSubmit()">搜索</button>
          </span>
        </div>
      </form>
      <div class="mastfoot" style="position: absolute;bottom: 10px">
        <div class="inner">
          <p style="color: gray"> ${commonInfo.pwebCopyright}</p>
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
</body>
</html>
