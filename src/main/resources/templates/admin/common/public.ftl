<#--freemarker的宏定义-->
<#macro header >
<!DOCTYPE html>
  <html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <#--<#nested >自定义的表情可以在宏中使用任意次数，用于参数的传递-->
    <title><#nested ></title>
    <link rel="stylesheet" href="/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/plugins/pace/pace.min.css">
    <link rel="stylesheet" href="/static/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/loader.css">
    <link rel="stylesheet" href="/static/plugins/toast/css/jquery.toast.min.css">
    <link rel="stylesheet" href="/static/plugins/fileinput/fileinput.min.css">
    <link rel="stylesheet" href="/static/plugins/OwO/OwO.min.css">
    <link rel="stylesheet" href="/static/plugins/pretty-checkbox/pretty-checkbox.min.css">
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  <script src="/static/plugins/jquery/jquery-1.12.4.min.js"></script>
    <script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="/static/plugins/OwO/OwO.min.js"></script>
    <script src="https://cdn.jsdelivr.net/highlight.js/latest/highlight.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/highlight.js/latest/styles/github.min.css">
</head>
<body class="hold-transition sidebar-mini skin-blue" >
</#macro>

<#--脚的宏定义-->
<#macro footer>
<script src="/static/plugins/pjax/jquery.pjax.js"></script>
<script src="/static/plugins/pace/pace.min.js"></script>
<script src="/static/js/adminlte.min.js"></script>
<script src="/static/plugins/toast/js/jquery.toast.min.js"></script>
<script src="/static/plugins/layer/layer.js"></script>
<script src="/static/plugins/fileinput/fileinput.min.js"></script>
<script src="/static/plugins/fileinput/zh.min.js"></script>
<script src="/static/js/app.js"></script>
<script>
    Pace.pwebOptions = {
        restartOnRequestAfter: false
    };
    $(document).ajaxStart(function () {
        Pace.restart();
    });

    $(document).pjax('a[data-pjax=true]', '.content-wrapper',
            {fragment: '.content-wrapper', timeout: 8000});

    $(window).on('load', function () {
        $('body').addClass('loaded');
        setTimeout(function () {
            $('#loading').remove();
        }, 500);
    });

</script>
</body>
</html>
</#macro>