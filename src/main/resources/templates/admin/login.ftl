<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hegehog-登录</title>
    <!-- zui css -->
    <link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
    <link rel="stylesheet" href="/static/theme/blue.css">
    <!-- app css -->
    <link rel="stylesheet" href="/static/css/app.css">
    <!-- jquery js -->
    <script src="/static/plugins/zui/lib/jquery/jquery.js"></script>
    <#--添加formvalid-->
    <link rel="stylesheet" href="/static/plugins/formvalidator/css/bootstrapValidator.css">
    <script src="/static/plugins/formvalidator/js/bootstrapValidator.js"></script>
    <script src="/static/plugins/formvalidator/js/language/zh_CN.js"></script>

</head>
<body class="bg-primary">
<div class="page page-login text-center">
    <div class="panel">
        <div class="panel-body">
            <div class="logo">
                <a href="#">Hedgehog</a>
            </div>
            <form id="myForm" action="/admin/system/doLogin" method="post">
                <div class="form-group">
                    <input name="phoneNumber" type="text" class="form-control" placeholder="手机号">
                </div>
                <div class="form-group">
                    <input name="passWord" type="password" class="form-control" placeholder="密码">
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <input type="text" name="verificationCode" class="form-control" placeholder="验证码">
                        <a class="input-group-addon">获取验证码</a>
                    </div>
                </div>
                <button type="submit" class="btn btn-lg btn-primary btn-block">登录</button>
            </form>
        </div>
    </div>
    <footer class="page-copyright page-copyright-inverse">
        <p>WEBSITE BY 大熊</p>
        <p>© 2019. All RIGHT RESERVED.</p>
    </footer>
</div>


<!-- zui js -->
<script src="/static/plugins/zui/js/zui.min.js"></script>
<!-- app js -->
<script src="/static/js/app.js"></script>
<script>
    $(function () {
        $("form").bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid:
                    'glyphicon glyphicon-remove',
                validating:
                    'glyphicon glyphicon-refresh'
            }, fields: {
                phoneNumber: {
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        },
                        regexp: {
                            regexp: /^1[34578]\d{9}$/,
                            message: '手机号格式不正确'
                        }
                    }
                }, passWord: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                }, verificationCode: {
                    validators: {
                        notEmpty: {
                            message: '验证码不能为空'
                        },
                        threshold: 6,//有2字符以上才发送ajax请求
                        remote: {//ajax验证。server result:{"valid",true or false}
                            url: "/admin/system/checkVerificationCode",
                            message: '验证码错误',
                            delay: 1000,//ajax刷新的时间是1秒一次
                            type: 'POST',
                            //自定义提交数据，默认值提交当前input value
                            data: function(validator) {
                                return {
                                    code : $("input[name=verificationCode]").val()
                                };
                            }
                        }
                    }
                }
            }
        })
    })
</script>

</body>
</html>