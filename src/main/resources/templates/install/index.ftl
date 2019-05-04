<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
          name="viewport">
    <title>网站安装</title>
    <link rel="stylesheet" href="/static/css/bootstrap.css">
    <link rel="stylesheet" href="/static/plugins/bootstrapvalidator/css/bootstrapValidator.min.css">
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        body {
            background-color: #f5f5f5;
        }

        .container {
            max-width: 850px;
        }

        .form-horizontal .control-label {
            text-align: left;
        }

        .logo {
            font-size: 56px;
            text-align: center;
            margin-bottom: 25px;
            font-weight: 500;
            color: #444;
            text-shadow: #b2baba .1em .1em .2em;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row" style="padding-top: 50px">
        <div class="col-lg-12 col-xs-12">
            <div class="logo animated fadeInUp">
                dengyi.pro
                <small style="font-size: 14px;">安装向导</small>
            </div>
            <form method="post" action="/install/doInstall" class="form-horizontal"
                  id="installForm">
                <div class="box box-solid animated" id="installFirst">
                        <div class="form-group animated fadeInUp"
                             style="animation-delay: 0.2s">
                            <label for="blogTitle"
                                   class="col-sm-4 control-label">网站名称</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="blogTitle"
                                       name="blogTitle" value="dengyi.pro">
                            </div>
                        </div>
                        <#--<div class="form-group animated fadeInUp"-->
                             <#--style="animation-delay: 0.3s">-->
                            <#--<label for="blogUrl"-->
                                   <#--class="col-sm-4 control-label"><@spring.message code='install.form.blogUrl'/></label>-->
                            <#--<div class="col-sm-8">-->
                                <#--<input type="text" class="form-control" id="blogUrl"-->
                                       <#--name="blogUrl">-->
                            <#--</div>-->
                        <#--</div>-->
                        <div class="form-group animated fadeInUp"
                             style="animation-delay: 0.4s">
                            <label for="userEmail"
                                   class="col-sm-4 control-label">邮箱</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="userEmail"
                                       name="userEmail">
                            </div>
                        </div>
                        <div class="form-group animated fadeInUp"
                             style="animation-delay: 0.5s">
                            <label for="userName"
                                   class="col-sm-4 control-label">用户名</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="userName" name="userName">
                            </div>
                        </div>
                        <div class="form-group animated fadeInUp"
                             style="animation-delay: 0.6s">
                            <label for="userDisplayName"
                                   class="col-sm-4 control-label">昵称</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="userDisplayName" name="userDisplayName">
                            </div>
                        </div>
                        <div class="form-group animated fadeInUp"
                             style="animation-delay: 0.7s">
                            <label for="userPwd"
                                   class="col-sm-4 control-label">密码</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="userPwd" name="password">
                            </div>
                        </div>
                        <div class="form-group animated fadeInUp"
                             style="animation-delay: 0.8s">
                            <label for="userRePwd"
                                   class="col-sm-4 control-label">重新输入密码</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="userRePwd" name="userRePwd">
                            </div>
                        </div>
                    </div>
                    <div class="box-footer" style="padding-right: 30px;">
                        <button type="submit"
                                class="btn btn-primary btn-sm btn-flat pull-right animated fadeInUp" style="animation-delay: 1s">提交</button>
                    </div>
                </div>
                <div class="box box-solid animated fadeInUp" style="display: none"
                     id="installSuccess">
                    <div class="box-body">
                        <h2>提示</h2>
                        <h4>信息</h4>
                    </div>
                    <#--<div class="box-footer" style="padding-right: 30px;">-->
                        <#--<a class="btn btn-primary btn-sm btn-flat"-->
                           <#--href="/"><@spring.message code='install.success.btn.front'/></a>-->
                        <#--<a class="btn btn-primary btn-sm btn-flat"-->
                           <#--href="/admin/login"><@spring.message code='install.success.btn.dashboard'/></a>-->
                    <#--</div>-->
                </div>
                <div class="box box-solid animated fadeInUp" style="display: none"
                     id="installError">
                    <#--<div class="box-body">-->
                        <#--<h2><@spring.message code='install.error.title'/></h2>-->
                        <#--<h4><@spring.message code='install.error.message'/></h4>-->
                    <#--</div>-->
                    <#--<div class="box-footer" style="padding-right: 30px;">-->
                        <#--<a class="btn btn-primary btn-sm btn-flat"-->
                           <#--href="/install"><@spring.message code='install.error.btn.return'/></a>-->
                    <#--</div>-->
                </div>
            </form>

        </div>
    </div>
</div>
</body>
<script src="/static/plugins/jquery/jquery.min.js"></script>
<script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/plugins/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script src="/static/plugins/bootstrapvalidator/js/language/zh_CN.js"></script>
    <#--<script>-->
        <#--var domain = window.location.host;-->
        <#--$(function () {-->
            <#--$('[data-toggle="tooltip"]').tooltip()-->
        <#--});-->
        <#--$(document).ready(function () {-->
            <#--$('#blogUrl').val("http://" + domain);-->
            <#--$('#installForm')-->
                    <#--.bootstrapValidator({-->
                                            <#--message: '安装表单验证失败',-->
                                            <#--feedbackIcons: {-->
                                                <#--valid: 'glyphicon glyphicon-ok',-->
                                                <#--invalid: 'glyphicon glyphicon-remove',-->
                                                <#--validating: 'glyphicon glyphicon-refresh'-->
                                            <#--},-->
                                            <#--fields: {-->
                                                <#--blogTitle: {-->
                                                    <#--message: '网站标题验证失败',-->
                                                    <#--validators: {-->
                                                        <#--notEmpty: {-->
                                                            <#--message: '网站标题不能为空'-->
                                                        <#--}-->
                                                    <#--}-->
                                                <#--},-->
                                                <#--userEmail: {-->
                                                    <#--message: '邮箱验证失败',-->
                                                    <#--validators: {-->
                                                        <#--notEmpty: {-->
                                                            <#--message: '邮箱不能为空'-->
                                                        <#--},-->
                                                        <#--emailAddress: {-->
                                                            <#--message: '邮箱格式有误'-->
                                                        <#--}-->
                                                    <#--}-->
                                                <#--},-->
                                                <#--userName: {-->
                                                    <#--message: '用户名验证失败',-->
                                                    <#--validators: {-->
                                                        <#--notEmpty: {-->
                                                            <#--message: '用户名不能为空'-->
                                                        <#--},-->
                                                        <#--stringLength: {-->
                                                            <#--min: 1,-->
                                                            <#--max: 24,-->
                                                            <#--message: '用户名超出长度限制'-->
                                                        <#--}-->
                                                    <#--}-->
                                                <#--},-->
                                                <#--userPwd: {-->
                                                    <#--message: '密码验证失败',-->
                                                    <#--validators: {-->
                                                        <#--notEmpty: {-->
                                                            <#--message: '密码不能为空'-->
                                                        <#--},-->
                                                        <#--stringLength: {-->
                                                            <#--min: 6,-->
                                                            <#--max: 18,-->
                                                            <#--message: '密码长度必须在6到18位之间'-->
                                                        <#--}-->
                                                    <#--}-->
                                                <#--},-->
                                                <#--userRePwd: {-->
                                                    <#--message: '密码验证失败',-->
                                                    <#--validators: {-->
                                                        <#--notEmpty: {-->
                                                            <#--message: '确认密码不能为空'-->
                                                        <#--},-->
                                                        <#--identical: {-->
                                                            <#--field: 'userPwd',-->
                                                            <#--message: '两次输入的密码不相符'-->
                                                        <#--}-->
                                                    <#--}-->
                                                <#--}-->
                                            <#--}-->
                                        <#--})-->
                    <#--.on('success.form.bv', function (e) {-->
                        <#--e.preventDefault();-->
                        <#--var $form = $(e.target);-->
                        <#--var bv = $form.data('bootstrapValidator');-->
                        <#--$.post($form.attr('action'), $form.serialize(), function (result) {-->
                            <#--if (result == true) {-->
                                <#--$('#installFirst').hide();-->
                                <#--$('#installSuccess').show();-->
                            <#--} else {-->
                                <#--$('#installFirst').hide();-->
                                <#--$('#installError').show();-->
                            <#--}-->
                        <#--}, 'json');-->
                    <#--});-->
        <#--});-->
    <#--</script>-->
</html>
