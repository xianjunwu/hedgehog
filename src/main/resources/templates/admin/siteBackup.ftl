<#--compress指令的作用是将页面压缩-->
<#compress >
    <#include "common/marco.ftl">
    <@head ></@head>
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
  <script>
    function doBackUp() {
      $("#myModal").modal('hide');
      window.location.href = "/admin/systemConfig/doBackup";
    }
  </script>
    <@foot></@foot>
</#compress>
