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
					<li class="active">文章分类列表</li>
				</ul>
			</div>
			<div class="content-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div id="datagridExample" class="datagrid">
								<div class="input-control search-box search-box-circle has-icon-left has-icon-right"
									 id="searchboxExample2"
									 style="margin-bottom: 10px; max-width: 300px">

									<!-- 大对话框 -->
									<div class="form-inline">
										<button type="button" class="btn btn-primary" data-toggle="modal"
												data-target="#myLgModal">新增分类
										</button>
										<button type="button" class="btn btn-warning" data-toggle="modal"
												data-target="#myLgModal">编辑分类
										</button>
									</div>
									<div class="modal fade" id="myLgModal">
										<div class="modal-dialog modal-lg">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
														onclick="clearText()"><span
															aria-hidden="true">×</span><span class="sr-only">关闭</span>
												</button>
												<h4 class="modal-title">新增分类</h4>
											</div>
											<div class="modal-body">
												<input type="hidden" id="id">
												<form>
													<div class="form-group">
														<label for="categoryName" class="required">分类名</label>
														<input type="text" class="form-control"
															   id="categoryName"
															   placeholder="分类名" onfocus="removeError()">
													</div>
													<div class="form-group">
														<label for="categoryDesc" class="required">分类描述</label>
														<input type="text" class="form-control"
															   id="categoryDesc" placeholder="分类描述">
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" onclick="clearText()"
														data-dismiss="modal">关闭
												</button>
												<button type="button" class="btn btn-primary" onclick="saveCategory()">
													保存
												</button>
											</div>
										</div>
									</div>
									<div class="modal fade" id="myLgModal">
										<div class="modal-dialog modal-lg">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
														onclick="clearText()"><span
															aria-hidden="true">×</span><span class="sr-only">关闭</span>
												</button>
												<h4 class="modal-title">编辑分类</h4>
											</div>
											<div class="modal-body">
												<input type="hidden" id="id">
												<form>
													<div class="form-group">
														<label for="categoryName" class="required">分类名</label>
														<input type="text" class="form-control"
															   id="categoryName"
															   placeholder="分类名" onfocus="removeError()">
													</div>
													<div class="form-group">
														<label for="categoryDesc" class="required">分类描述</label>
														<input type="text" class="form-control"
															   id="categoryDesc" placeholder="分类描述">
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" onclick="clearText()"
														data-dismiss="modal">关闭
												</button>
												<button type="button" class="btn btn-primary" onclick="saveCategory()">
													保存
												</button>
											</div>
										</div>
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
                        {name: 'id', label: '分类id', width: 80, sort: false},
                        {name: 'categoryName', label: '分类名', width: 150, sort: false},
                        {name: 'categoryDesc', label: '分类描述', width: 134},
                        {name: 'path', label: '分类路径', width: 109}
                    ],
                    remote: function (params) {
                        return {
                            // 原创请求地址
                            url: '/admin/category/pageQuery',
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
                    C5: {
                        // 值转换器仅影响第 2 行第 1 列的单元格
                        valueOperator: {
                            getter: function (dataValue, cell, dataGrid) {
                                return dataValue ? '是' : '否';
                            }
                        }
                    },
                    C8: {
                        // 值转换器仅影响第 2 行第 1 列的单元格
                        valueOperator: {
                            getter: function (dataValue, cell, dataGrid) {
                                return dataValue ? '已发布' : '未发布';
                            }
                        }
                    }
                }
            });
        });

        function deleteItems() {
            var myDataGrid = $('#datagridExample').data('zui.datagrid');
            var selectedItems = myDataGrid.getCheckItems();
            //判断是否选择，没有选择的话给出提示
            if (selectedItems === '') {
                new $.zui.Messager('请先选择数据', {
                    icon: 'bell',// 定义消息图标
                    time: 1000
                }).show();
            }
            console.log(selectedItems);

        }

        /**
         * 保存之前进行校验
         */
        // 当输入框选中，则清除error样式
        function removeError() {
            $("#categoryName").parent().removeClass('has-error');
        }

        function saveCategory() {
            var name = $("#categoryName");
            if (name.val() === '') {
                name.parent().addClass('has-error');
                new $.zui.Messager('必须填写分类名', {
                    type: 'warning', // 定义颜色主题，
                    time: 1000,
                    icon: 'warning-sign'
                }).show();
            } else {
                var truename = name.val().trim();
                if (truename.length > 5) {
                    new $.zui.Messager('分类名最大5位', {
                        type: 'warning', // 定义颜色主题，
                        time: 1000,
                        icon: 'warning-sign'
                    }).show();
                } else {
                    $.post("/admin/category/saveOrUpdate", {
                        id: $("#id").val(),
                        categoryName: truename,
                        categoryDesc: $("#categoryDesc").val()
                    }, function (data) {
                        if (data.result === 'success') {
                            //浮动消息通知
                            new $.zui.Messager('保存成功！', {
                                type: 'success', // 定义颜色主题，
                                time: 1000,
                                icon: 'ok'
                            }).show();
                        }

                    })
                }

			}

        }


        //清空输入框js方法
        function clearText() {
            $("#categoryName").val('');
            $("#id").val('');
            $("#categoryDesc").val('');
        }
	</script>

	<!-- zui js -->
	<script src="/static/plugins/zui/js/zui.min.js"></script>
	<!-- app js -->
	<script src="/static/js/app.js"></script>
	</body>
	</html>
</#compress>
