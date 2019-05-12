<#--freemarker的宏定义-->
<#macro header >
    <!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <#--<#nested >标签可以在宏中使用任意次数，用于参数的传递-->
    <title><#nested ></title>
    <script src="/static/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/highlight.js/latest/styles/github.min.css">
</head>
<body class="">
</#macro>

<#--脚的宏定义-->
<#macro footer>
<script>

</script>
</body>
</html>
</#macro>
