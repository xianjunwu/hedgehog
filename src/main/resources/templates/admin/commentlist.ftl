<#--compress指令的作用是将页面压缩-->
<#compress >
	<!DOCTYPE html>
	<html lang="zh-CN">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>后台管理页面</title>
		<!-- jquery js -->
		<script src="/static/plugins/zui/lib/jquery/jquery.js"></script>
		<!-- zui css -->
		<link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
		<link rel="stylesheet" href="/static/theme/blue.css">
		<!-- app css -->
		<link rel="stylesheet" href="/static/css/app.css">
		<link href="/static/plugins/zui/lib/datagrid/zui.datagrid.min.css" rel="stylesheet">
		<script src="/static/plugins/zui/lib/datagrid/zui.datagrid.min.js"></script>


	</head>
	<body>
	<div class="wrapper">
		<#--通用头部-->
		<#include "common/header.ftl">
		<#--通用侧边栏-->
		<#include "common/sider.ftl">
		<#--内容体-->
		<div class="content-wrapper">
			<div class="content-header">
				<ul class="breadcrumb">
					<li><a href="/admin/index"><i class="icon icon-home"></i></a></li>
					<li class="active">文章列表</li>
				</ul>
			</div>
			<div class="content-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div id="datagridExample" class="datagrid">
								<div class="form-inline">
									<div class="input-control search-box search-box-circle has-icon-left has-icon-right"
										 id="searchboxExample2"
										 style="margin-bottom: 10px; max-width: 300px">
										<input id="inputSearchExample2" type="search" class="form-control search-input"
											   placeholder="搜索">
										<label for="inputSearchExample2" class="input-control-icon-left search-icon"><i
													class="icon icon-search"></i></label>
										<a href="#" class="input-control-icon-right search-clear-btn"><i
													class="icon icon-remove"></i></a>
										<button class="btn btn-danger" onclick="deleteItems()">删除</button>
										<button class="btn btn-success" onclick="deleteItems()">编辑</button>
									</div>
								</div>
								<div class="datagrid-container"></div>
								<div class="pager"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>

        $(function () {
            $('#datagridExample').datagrid({
                dataSource: {
                    cols: [
                        {name: 'id', label: '评论id', width: 80, sort: false},
                        {name: 'content', label: '评论内容', width: 0.7, sort: false},
                        {name: 'article', label: '关联文章标题', width: 160, sort: false},
                        {name: 'userName', label: '评论者名', width: 134},
                        {name: 'userEmail', label: '评论者email', width: 134},
                        {name: 'allowDisplay', label: '是否允许显示', width: 109},
                        {name: 'method', label: '操作', width: 109, sort: false}
                    ],
                    remote: function (params) {
                        return {
                            // 原创请求地址
                            url: '/admin/comment/pageQuery',
                            // 请求类型
                            type: 'GET',
                            // 数据类型
                            dataType: 'json'
                        };
                    }
                },
                sortable: true,
                checkable: true,
                checkByClickRow: true,
                states: {
                    pager: {page: 1, recPerPage: 10}
                },
                configs: {
                    C3: {
                        valueOperator: {
                            getter: function (dataValue, cell, dataGrid) {
                                return dataValue.title;
                            }
                        }
                    },
                    C5: {
                        html: true,
                        valueOperator: {
                            getter: function (dataValue, cell, dataGrid) {
                                return dataValue ? '<span style="color: green">允许显示</span>' : '<span style="color: red">不允许显示</span>';
                            }
                        }
                    }
                }
            });
        });

        function deleteItems() {
            // 获取数据表格实例
            var myDataGrid = $('#datagridExample').data('zui.datagrid');
            var selectedItems = myDataGrid.getCheckItems();
            //判断是否选择，没有选择的话给出提示
            if (selectedItems.length === 0) {
                new $.zui.Messager('请先选择数据', {
                    icon: 'bell',// 定义消息图标
                    time: 1000
                }).show();
            } else {
                selectedItems.forEach(function (value) {
                    $.ajax({
                        url: '/admin/comment/deleteById/' + value.id,
                        type: 'DELETE',
                        success: function (result) {
                            //要重新刷新表格
                            myDataGrid.dataSource.data = null;
                            myDataGrid.render();
                            if (result.result === 'success') {
                                new $.zui.Messager('删除成功！', {
                                    type: 'success', // 定义颜色主题，
                                    time: 1000,
                                    icon: 'ok'
                                }).show();

                            } else {
                                //浮动消息通知
                                new $.zui.Messager('删除失败！', {
                                    icon: 'warning-sign', // 定义消息图标
                                    time: 1000
                                }).show();
                            }
                        }
                    });

                })
            }

        }
	</script>

	<!-- zui js -->
	<script src="/static/plugins/zui/js/zui.min.js"></script>
	<!-- app js -->
	<script src="/static/js/app.js"></script>
	</body>
	</html>
</#compress>
