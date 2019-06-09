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
<body class=" bg-primary">
<div class="indexCenter">
  <div style="max-width: 500px ; max-height: 500px;background-color: black;padding: 15px;">
    <div class="text-center" style="margin-bottom: 30px">
      <h1>Hedgehog
        <small>管理员登录</small>
      </h1>
    </div>
    <form class="form-horizontal" id="myForm" action="/admin/system/doLogin" method="post">
      <div class="form-group">
        <label for="phoneNumber" class="col-sm-3">手机号</label>
        <div class="col-md-7">
          <input name="phoneNumber" id="phoneNumber" type="text" class="form-control"
                 placeholder="手机号">
        </div>
      </div>
      <div class="form-group">
        <label for="password" class="col-sm-3">密码</label>
        <div class="col-md-7">
          <input name="passWord" type="password" id="passWord" class="form-control"
                 placeholder="密码">
        </div>
      </div>
      <div class="form-group">
        <label for="verificationCode" class="col-sm-3">验证码</label>
        <div class="col-sm-7">
          <div class="input-group">
            <input type="text" id="verificationCode" name="verificationCode" class="form-control"
                   placeholder="输入图片中验证码">
            <img src="/admin/system/getVerificationCode" id="imgObj" alt="验证码">
            <a href="#" onclick="changeImg()">看不清，换一张</a></span>
          </div>

        </div>
      </div>

      <div class="form-group">
        <div class="col-md-12">
          <button type="submit" class="btn btn-lg btn-primary btn-block">登录</button>
        </div>
      </div>
    </form>

    <div class="alert alert-danger with-icon ">
      <i class="icon-remove-sign"></i>
      <div class="content">
        <span>用户名或密码错误</span>
      </div>
    </div>
  </div>

  <#--    <footer class="page-copyright page-copyright-inverse">-->
  <#--        <p>WEBSITE BY 大熊</p>-->
  <#--        <p>© 2019. All RIGHT RESERVED.</p>-->
  <#--    </footer>-->
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
              data: function (validator) {
                return {
                  code: $("input[name=verificationCode]").val()
                };
              }
            }
          }
        }
      }
    })

  });

  function changeImg() {
    $("#verificationCode").val("");
    var imgSrc = $("#imgObj");
    var src = imgSrc.attr("src");
    imgSrc.attr("src", chgUrl(src));
  }

  function chgUrl(url) {
    var timestamp = (new Date()).valueOf();
    url = url.substring(0, 33);
    if ((url.indexOf("&") >= 0)) {
      url = url + "×tamp=" + timestamp;
    } else {
      url = url + "?timestamp=" + timestamp;
    }
    return url;
  }

</script>

</body>
</html>
