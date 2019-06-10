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
          <li class="active">系统备份</li>
        </ul>
      </div>
      <div class="content-body">
        <div class="container-fluid">
          <div class="panel">
            <div class="panel-heading">
              <div class="panel-title">系统备份</div>
            </div>
            <div class="panel-body">
              <div class="col-md-12">
                <!-- 对话框HTML -->
                <div class="modal modal-for-page fade in" id="myModal" aria-hidden="false"
                     style="display: none;">
                  <div class="modal-dialog" style="top: 235px;">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title">备份系统</h4>
                      </div>
                      <div class="modal-footer">
                        <div class="row">
                          <div class="col-md-6">
                            <button type="button" class="btn btn-warning btn-block"
                                    data-dismiss="modal">取消
                            </button>
                          </div>
                          <div class="col-md-6">
                            <button type="button" class="btn btn-success btn-block"
                                    onclick="doBackUp()">确定
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <button type="button" class="btn btn-primary btn-block" data-position="center"
                        data-toggle="modal" data-target="#myModal">备份系统
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <!-- zui js -->
  <script src="/static/plugins/zui/js/zui.min.js"></script>
  <!-- app js -->
  <script src="/static/js/app.js"></script>
  <script>
    $(function () {
      activeSider();
    });

    function doBackUp() {
      $("#myModal").modal('hide');
      window.location.href = "/admin/systemConfig/doBackup";
    }
  </script>
  </body>
  </html>
</#compress>
