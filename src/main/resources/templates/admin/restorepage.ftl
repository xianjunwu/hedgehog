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
		<link rel="stylesheet" href="/static/plugins/zui/lib/uploader/zui.uploader.min.css">
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
					<li class="active">恢复系统</li>
				</ul>
			</div>
			<div class="content-body">
				<div class="container-fluid">
					<div class="alert alert-warning alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
						<p>系统恢复后，安装时设置的所有数据将会被重置成恢复包内容</p>
					</div>
					<div class="panel">
						<div class="panel-heading">
							<div class="panel-title">恢复系统</div>
						</div>
						<div class="panel-body">
              <div id="tableUploader" class="uploader">
                <div class="uploader-message text-center">
                  <div class="content"></div>
                  <button type="button" class="close">×</button>
                </div>
                <table class="table table-bordered">
                  <thead>
                  <tr>
                    <th colspan="2">文件名</th>
                    <th style="width: 100px">大小</th>
                    <th style="width: 160px; text-align: center;">状态/操作</th>
                  </tr>
                  </thead>
                  <tbody class="uploader-files">
                  <tr class="file template">
                    <td style="width: 38px; padding: 3px"><div class="file-icon"></div></td>
                    <td style="padding: 0">
                      <div style="position: relative; padding: 8px;">
                        <strong class="file-name"></strong>
                        <div class="file-progress-bar"></div>
                      </div>
                    </td>
                    <td><span class="file-size text-muted"></span></td>
                    <td class="actions text-right" style="padding: 0 4px;">
                      <div class="file-status" data-toggle="tooltip" style="margin: 8px;"><i class="icon"></i> <span class="text"></span></div>
                      <a data-toggle="tooltip" class="btn btn-link btn-download-file" target="_blank"><i class="icon icon-download-alt"></i></a>
                      <button type="button" data-toggle="tooltip" class="btn btn-link btn-reset-file" title="Repeat"><i class="icon icon-repeat"></i></button>
                      <button type="button" data-toggle="tooltip" class="btn btn-link btn-rename-file" title="Rename"><i class="icon icon-pencil"></i></button>
                      <button type="button" data-toggle="tooltip" title="Remove" class="btn btn-link btn-delete-file"><i class="icon icon-trash text-danger"></i></button>
                    </td>
                  </tr>
                  </tbody>
                  <tfoot>
                  <tr>
                    <td colspan="4" style="padding: 4px 0">
                      <div style="position: relative;">
                        <div class="uploader-status pull-right text-muted" style="margin-top: 5px;"></div>
                        <button type="button" class="btn btn-link uploader-btn-browse"><i class="icon icon-plus"></i> 选择文件</button>
                        <button type="button" class="btn btn-link uploader-btn-start"><i class="icon icon-cloud-upload"></i> 开始上传</button>
                      </div>
                    </td>
                  </tr>
                  </tfoot>
                </table>
              </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- zui js -->
	<script src="/static/plugins/zui/js/zui.min.js"></script>
  <script src="/static/plugins/zui/lib/uploader/zui.uploader.min.js"></script>
	<!-- app js -->
	<script src="/static/js/app.js"></script>
	<script>
		$(function () {
			activeSider();

		});
    $('#tableUploader').uploader({
      url: '/admin/file/uploadRestorePackage'
    });
	</script>
	</body>
	</html>
</#compress>
