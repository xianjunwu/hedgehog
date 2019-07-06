<#compress >
  <!DOCTYPE html>
  <html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>系统设置</title>
    <!-- jquery js -->
    <script src="/static/plugins/zui/lib/jquery/jquery.js"></script>
    <script src="/static/js/hedgehog-admin.js"></script>
    <!-- zui css -->
    <link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
    <link rel="stylesheet" href="/static/theme/blue.css">
    <!-- app css -->
    <link rel="stylesheet" href="/static/css/app.css">

  </head>
  <body>
  <div class="wrapper">
      <#--通用头部-->
      <#include "common/header.ftl">
      <#--通用侧边栏-->
      <#include "common/sider.ftl">

    <div class="content-wrapper">
      <div class="content-header">
        <ul class="breadcrumb">
          <li><a href="#"><i class="icon icon-home"></i></a></li>
          <li><a href="#">系统设置</a></li>
          <li class="active">基础设置</li>
        </ul>
      </div>
      <div class="content-body">
        <div class="container-fluid">
          <div class="alert alert-warning alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <p>基础设置必须小心设置，否则网站将可能无法运行！页面数据将不会进行校验</p>
          </div>
          <div class="panel">
            <div class="panel-heading">
              <div class="panel-title">基础设置</div>
            </div>
            <div class="panel-body">
              <ul class="nav nav-primary">
                <li class="active"><a href="#adminInfoSet" data-toggle="tab">管理员信息设置</a></li>
                <li><a href="#siteInfoSet" data-toggle="tab">网站基本信息设置</a></li>
                <li><a href="#siteSEOSet" data-toggle="tab">网站SEO设置</a></li>
              </ul>
              <div class="tab-content">
                <div class="tab-pane active" id="adminInfoSet">
                  <form action="/admin/systemConfig/saveUser" class="form-horizontal"
                        style="margin-top: 30px">
                    <input type="hidden" name="id" value="${adminUser.id}">
                    <div class="form-group">
                      <label for="phoneNumber" class="col-sm-4 required">管理员账号</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="phoneNumber" placeholder="手机号"
                               value="${adminUser.phoneNumber}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="nickName" class="col-sm-4 required">管理员昵称</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="nickName" placeholder="昵称"
                               value="${adminUser.nickName}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="userEmail" class="col-sm-4 required">邮箱</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="userEmail" placeholder="邮箱"
                               value="${adminUser.userEmail}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="password" class="col-sm-4 required">重置密码</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="password" class="form-control" id="password" placeholder="密码">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class=" text-center">
                        <button type="submit" class=" btn btn-success">保存设置</button>
                      </div>
                    </div>
                  </form>
                </div>
                <div class="tab-pane" id="siteInfoSet">
                  <form action="/admin/systemConfig/saveSiteInfo" class="form-horizontal">
                    <input type="hidden" id="siteInfoId" value="${siteInfo.id}">
                    <div class="form-group">
                      <label for="siteName" class="col-sm-4 required">网站名</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="siteName" placeholder="网站名"
                               value="${siteInfo.siteName}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="slogen" class="col-sm-4 required">网站标语</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="slogen" placeholder="网站标语"
                               value="${siteInfo.slogen}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="copyright" class="col-sm-4 required">页脚版权信息</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="copyright" placeholder="页脚版权信息"
                               value="${siteInfo.copyright}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="logoUrl" class="col-sm-4 required">网站标志</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="logoUrl" placeholder="网站标志"
                               value="${siteInfo.logoUrl}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="faviconUrl" class="col-sm-4 required">网页图标</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="faviconUrl"
                               placeholder="网页图标" value="${siteInfo.faviconUrl}">
                      </div>
                    </div>
                    <input type="hidden" id="siteInfoSetCreateTime" value="${siteInfo.createTime}">
                    <div class="form-group">
                      <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" class="btn btn-success" onclick="saveSiteInfoSet()">
                          保存设置
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
                <div class="tab-pane" id="siteSEOSet">
                  <form action="/admin/systemConfig/saveSeo" class="form-horizontal">
                    <input type="hidden" name="id" value="${seo.id}">
                    <div class="form-group">
                      <label for="keywords" class="col-sm-4 required">网站关键词</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="keywords" placeholder="网站关键词"
                               value="${seo.keywords}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="description" class="col-sm-4 required">网站描述</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="description" placeholder="网站描述"
                               value="${seo.description}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="author" class="col-sm-4 required">作者</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="author" placeholder="作者"
                               value="${seo.author}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="gtoken" class="col-sm-4 required">google推送token</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="gtoken"
                               placeholder="google推送token" value="${seo.gtoken}">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="btoken" class="col-sm-4 required">百度推送token</label>
                      <div class="col-md-6 col-sm-10">
                        <input type="text" class="form-control" id="btoken"
                               placeholder="百度推送token" value="${seo.btoken}">
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" class="btn btn-success "> 提交
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    $.ajaxSettings.contentType = "application/json;charset=UTF-8";

    //更新网站信息
    function saveSiteInfoSet() {

      var params = {
        id: $('#siteInfoId').val(),
        siteName: $('#siteName').val(),
        slogen: $('#slogen').val(),
        copyright: $('#copyright').val(),
        logoUrl: $('#logoUrl').val(),
        faviconUrl: $('#faviconUrl').val()


      };
      $.post("/admin/systemConfig/saveSiteInfo", JSON.stringify(params), function (callback) {
        if (callback.result === 'success') {
          //浮动消息通知
          new $.zui.Messager('更新成功', {
            type: 'success', // 定义颜色主题，
            time: 1000,
            icon: 'ok'
          }).show();

        } else {
          //浮动消息通知
          new $.zui.Messager('更新失败！', {
            icon: 'warning-sign', // 定义消息图标
            time: 1000
          }).show();
        }
      })

    }
  </script>

  <!-- zui js -->
  <script src="/static/plugins/zui/js/zui.min.js"></script>
  <!-- app js -->
  <script src="/static/js/app.js"></script>
  <script>
    $(function () {
      activeSider();
    });
  </script>
  </body>
  </html>
</#compress>
