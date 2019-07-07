<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Hedgehog安装页面</title>
  <!-- jquery js -->
  <script src="/static/plugins/zui/lib/jquery/jquery.js"></script>
  <!-- zui css -->
  <link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
  <link rel="stylesheet" href="/static/theme/blue.css">
  <!-- app css -->
  <link rel="stylesheet" href="/static/css/app.css">
  <!-- zui js -->
  <link rel="stylesheet" href="/static/plugins/wizardjs/css/wizard.min.css">
  <script src="/static/plugins/wizardjs/jquery-wizard.min.js"></script>
  <style>

    /* 步骤 */
    .wizard-steps {
      display: table;
      width: 100%;
    }

    .wizard-steps > li.current, .wizard-steps > li.done {
      background: #41b3f9;
      color: #ffffff;
    }

    .wizard-steps > li.done {
      background: #7ace4c;
    }

    .wizard-steps > li {
      display: table-cell;
      padding: 10px 20px;
      background: #f7fafc;
    }

    .wizard-steps > li.current h4, .wizard-steps > li.done h4 {
      color: #ffffff;
    }

    .wizard-steps > li.current span, .wizard-steps > li.done span {
      border-color: #ffffff;
      color: #ffffff;
    }

    .wizard-steps > li span {
      border-radius: 100%;
      border: 1px solid rgba(120, 130, 140, 0.13);
      width: 40px;
      height: 40px;
      display: inline-block;
      vertical-align: middle;
      padding-top: 9px;
      margin-right: 8px;
      text-align: center;
    }

    .wizard-content {
      padding: 25px;
      border-color: rgba(120, 130, 140, 0.13);
      margin-bottom: 30px;
    }
  </style>
</head>
<body>
<div class="indexCenter">
  <div class="text-center" style="margin-bottom: 40px">
    <h1>Hedgehog
      <small>网站安装</small>
    </h1>
  </div>
  <div class="wizard" id="installstep">
    <ul class="wizard-steps" role="tablist">
      <li class="active" role="tab">
        <h4>
          第一步:管理员信息
        </h4>
      </li>
      <li role="tab">
        <h4>
          第二步:网站基本信息设置
        </h4>
      </li>
      <li role="tab">
        <h4>
          第三步:网站SEO设置
        </h4>
      </li>
    </ul>
    <div class="wizard-content">
      <div class="wizard-pane" role="tabpanel">
        <div class="form-horizontal">
          <input type="hidden" id="userId">
          <div class="form-group">
            <label for="phoneNumber" class="col-sm-4 required">管理员账号</label>
            <div class="col-md-6 col-sm-10">
              <input type="text" class="form-control" id="phoneNumber" placeholder="手机号">
            </div>
          </div>
          <div class="form-group">
            <label for="nickName" class="col-sm-4 required">管理员昵称</label>
            <div class="col-md-6 col-sm-10">
              <input type="text" class="form-control" id="nickName" placeholder="昵称">
            </div>
          </div>
          <div class="form-group">
            <label for="userEmail" class="col-sm-4 required">邮箱</label>
            <div class="col-md-6 col-sm-10">
              <input type="text" class="form-control" id="userEmail" placeholder="邮箱">
            </div>
          </div>
          <div class="form-group">
            <label for="password" class="col-sm-4 required">密码</label>
            <div class="col-md-6 col-sm-10">
              <input type="password" class="form-control" id="password" placeholder="密码">
            </div>
          </div>
          <div class="form-group">
            <label for="repassword" class="col-sm-4 required">再次输入密码</label>
            <div class="col-md-6 col-sm-10">
              <input type="password" class="form-control" id="repassword">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button type="button" class="btn btn-primary pull-right" onclick="toNext(0)"> 下一步
              </button>
            </div>
          </div>
        </div>
      </div>
      <div class="wizard-pane" role="tabpanel">
        <div class="form-horizontal">
          <input type="hidden" id="websiteid">
          <div class="form-group">
            <label for="siteName" class="col-sm-4 required">网站名</label>
            <div class="col-md-6 col-sm-10">
              <input type="text" class="form-control" id="siteName" placeholder="网站名">
            </div>
          </div>
          <div class="form-group">
            <label for="siteUrl" class="col-sm-4 required">域名</label>
            <div class="col-md-6 col-sm-10">
              <input type="text" class="form-control" id="siteUrl" placeholder="域名">
            </div>
          </div>
          <div class="form-group">
            <label for="slogen" class="col-sm-4 required">网站标语</label>
            <div class="col-md-6 col-sm-10">
              <input type="text" class="form-control" id="slogen" placeholder="网站标语">
            </div>
          </div>
          <div class="form-group">
            <label for="copyright" class="col-sm-4 required">页脚版权信息</label>
            <div class="col-md-6 col-sm-10">
              <input type="text" class="form-control" id="copyright" placeholder="页脚版权信息">
            </div>
          </div>
          <div class="form-group">
            <label for="logoUrlUpload" class="col-sm-4 required">网站标志</label>
            <div class="col-md-6 col-sm-10">
              <div id="logoUrlUpload" class="uploader">
                <div class="file-list" data-drag-placeholder="请拖拽文件到此处"></div>
                <button type="button" class="btn btn-primary uploader-btn-browse"><i
                      class="icon icon-cloud-upload"></i> 选择文件
                </button>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="faviconUrlUpload" class="col-sm-4 required">网页图标</label>
            <div class="col-md-6 col-sm-10">
              <div id="faviconUrlUpload" class="uploader">
                <div class="file-list" data-drag-placeholder="请拖拽文件到此处"></div>
                <button type="button" class="btn btn-primary uploader-btn-browse"><i
                      class="icon icon-cloud-upload"></i> 选择文件
                </button>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button type="button" class="btn btn-success pull-left" onclick="toNext(-1)"> 上一步
              </button>
              <button type="button" class="btn btn-primary pull-right" onclick="toNext(1)"> 下一步
              </button>
            </div>
          </div>
        </div>
      </div>
      <div class="wizard-pane" role="tabpanel">
        <div class="form-horizontal">
          <input type="hidden" id="seoid">
          <div class="form-group">
            <label for="keywords" class="col-sm-4 required">网站关键词</label>
            <div class="col-md-6 col-sm-10">
              <input type="text" class="form-control" id="keywords" placeholder="网站关键词">
            </div>
          </div>
          <div class="form-group">
            <label for="description" class="col-sm-4 required">网站描述</label>
            <div class="col-md-6 col-sm-10">
              <input type="text" class="form-control" id="description" placeholder="网站描述">
            </div>
          </div>
          <div class="form-group">
            <label for="author" class="col-sm-4 required">作者</label>
            <div class="col-md-6 col-sm-10">
              <input type="text" class="form-control" id="author" placeholder="作者">
            </div>
          </div>
          <div class="form-group">
            <label for="gtoken" class="col-sm-4 required">google推送token</label>
            <div class="col-md-6 col-sm-10">
              <input type="text" class="form-control" id="gtoken" placeholder="google推送token">
            </div>
          </div>
          <div class="form-group">
            <label for="btoken" class="col-sm-4 required">百度推送token</label>
            <div class="col-md-6 col-sm-10">
              <input type="text" class="form-control" id="btoken" placeholder="百度推送token">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <button type="button" class="btn btn-success pull-left" onclick="toNext(-1)"> 上一步
              </button>
              <button type="button" class="btn btn-primary pull-right" onclick="toNext(2)">保存
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="alert alert-primary with-icon">
    <i class="icon-inbox"></i>
    <div class="content">
      <span>提示:带星号的内容为必填项</span>
    </div>
  </div>
</div>
<script>
  //初始化wizard
  $(function () {
    $("#installstep").wizard({
      templates: {
        buttons: function buttons() {// 去掉前后的button
          return '';
        }
      }
    });
  });

  function toNext(i) {
    if (i === 0) {
      var inputArray = [
        'phoneNumber',
        'nickName',
        'password',
        'userEmail'
      ];
      //页面校验
      if (validInputNotNull(inputArray)) {
        //重新输入密码是否和第一次密码相同
        if ($('#password').val() === $('#repassword').val()) {
          //保存用户设置
          $.post("/install/saveUser", {
            phoneNumber: $("#phoneNumber").val(),
            id: $("#userId").val(),
            nickName: $("#nickName").val(),
            password: $("#password").val(),
            userEmail: $("#userEmail").val()
          }, function (data) {
            if (data.result === 'success') {
              //新增成功
              new $.zui.Messager('保存管理员成功！', {
                type: 'success', // 定义颜色主题，
                time: 1000,
                icon: 'ok'
              }).show();
              //将id存回来，防止倒回来修改
              $("#userId").val(data.data.id);
              //跳转到下一项
              $("#installstep").wizard('goTo', i + 1);
            } else {
              //浮动消息通知
              new $.zui.Messager('保存管理员失败！', {
                icon: 'warning-sign', // 定义消息图标
                time: 1000
              }).show();
              //重新跳回去
              $("#installstep").wizard('goTo', i);
            }
          })

        } else {
          new $.zui.Messager('两次输入密码不相同', {
            icon: 'warning-sign', // 定义消息图标
            type: 'danger',
            time: 1000
          }).show();
        }
      } else {
        new $.zui.Messager('必填项必须填写', {
          icon: 'warning-sign', // 定义消息图标
          type: 'danger',
          time: 1000
        }).show();
      }
    } else if (i === 1) {
      var inputArray = [
        'siteName',
        'slogen',
        'copyright',
        'siteUrl'
      ];
      if (validInputNotNull(inputArray)) {
        //保存网站基本信息
        $.post("/install/saveSiteInfo", {
          siteName: $("#siteName").val(),
          id: $("#websiteid").val(),
          slogen: $("#slogen").val(),
          copyright: $("#copyright").val(),
          siteUrl: $("#siteUrl").val()
        }, function (data) {
          if (data.result === 'success') {
            //新增成功
            new $.zui.Messager('保存网站信息成功！', {
              type: 'success', // 定义颜色主题，
              time: 1000,
              icon: 'ok'
            }).show();
            //将id存回来，防止倒回来修改
            $("#websiteid").val(data.data.id);
            //跳转到下一项
            $("#installstep").wizard('goTo', i + 1);
          } else {
            //浮动消息通知
            new $.zui.Messager('保存网站信息失败!', {
              icon: 'warning-sign', // 定义消息图标
              type: 'danger',
              time: 1000
            }).show();
            //重新跳回去
            $("#installstep").wizard('goTo', i);
          }

        })
      } else {
        new $.zui.Messager('必填项必须填写', {
          icon: 'warning-sign', // 定义消息图标
          type: 'danger',
          time: 1000
        }).show();
      }
    } else {
      var inputArray = [
        'keywords',
        'description',
        'author',
        'gtoken',
        'btoken'
      ];
      if (validInputNotNull(inputArray)) {}else{
        new $.zui.Messager('必填项必须填写', {
          icon: 'warning-sign', // 定义消息图标
          type: 'danger',
          time: 1000
        }).show();
      }
      //保存seo信息
      $.post("/install/saveSeo", {
        keywords: $("#keywords").val(),
        id: $("#seoid").val(),
        description: $("#description").val(),
        author: $("#author").val(),
        gtoken: $("#gtoken").val(),
        btoken: $("#btoken").val()
      }, function (data) {
        if (data.result === 'success') {
          //新增成功
          new $.zui.Messager('保存seo信息成功！', {
            type: 'success', // 定义颜色主题，
            time: 1000,
            icon: 'ok'
          }).show();
          //不用存id这一步是最后一步，不能在安装也修改了
          //重定向到管理主页
          window.location.replace("/admin")
        } else {
          //浮动消息通知
          new $.zui.Messager('保存seo信息失败', {
            icon: 'warning-sign', // 定义消息图标
            type: 'danger',
            time: 1000
          }).show();
          //重新跳回去
          $("#installstep").wizard('goTo', i);
        }

      })
    }

    //校验不能为空
    function validInputNotNull(inputArray) {
      var validFlag = true;
      for (var j = 0; j < inputArray.length; j++) {
        if ($('#' + inputArray[i]).val() === '') {
          validFlag = false;
        }
      }
      return validFlag;
    }

    //
    $('#logoUrlUpload').uploader({
      autoUpload: true,            // 当选择文件后立即自动进行上传操作
      url: '/admin/file/uploadLogo'  // 文件上传提交地址
    });
    $('#faviconUrlUpload').uploader({
      type: 'image/x-icon',
      autoUpload: true,            // 当选择文件后立即自动进行上传操作
      url: '/admin/file/uploadFavicon'  // 文件上传提交地址
    });

  }
</script>
<!-- zui js -->
<script src="/static/plugins/zui/js/zui.min.js"></script>
<link rel="stylesheet" href="/static/plugins/zui/lib/uploader/zui.uploader.min.css">
<script src="/static/plugins/zui/lib/uploader/zui.uploader.min.js"></script>
<!-- app js -->
<script src="/static/js/app.js"></script>
</body>
</html>
