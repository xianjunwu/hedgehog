<#--compress指令的作用是将页面压缩-->
<#compress >
    <#include "common/marco.ftl">
    <@head ></@head>
<#--内容体-->
  <div class="content-wrapper">
    <div class="content-header">
      <ul class="breadcrumb">
        <li><a href="/admin"><i class="icon icon-home"></i></a></li>
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
                          data-target="#addcategoryModal">新增分类
                  </button>
                  <button type="button" class="btn btn-warning" onclick="activeEditModel()">编辑分类
                  </button>
                  <button type="button" class="btn btn-danger" onclick="deleteItems()">删除分类
                  </button>
                </div>
                <div class="modal fade" id="addcategoryModal">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal"
                              onclick="clearModel('addcategoryModal')"><span
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
                      <button type="button" class="btn btn-default"
                              onclick="clearModel('addcategoryModal')"
                              data-dismiss="modal">关闭
                      </button>
                      <button type="button" class="btn btn-primary" onclick="saveCategory()">
                        保存
                      </button>
                    </div>
                  </div>
                </div>
                <div class="modal fade" id="editModal">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal"
                              onclick="clearModel('editModal')"><span
                            aria-hidden="true">×</span><span class="sr-only">关闭</span>
                      </button>
                      <h4 class="modal-title">编辑分类</h4>
                    </div>
                    <div class="modal-body">
                      <input type="hidden" id="idEdit">
                      <form>
                        <div class="form-group">
                          <label for="categoryName" class="required">分类名</label>
                          <input type="text" class="form-control"
                                 id="categoryNameEdit"
                                 placeholder="分类名" onfocus="removeError()">
                        </div>
                        <div class="form-group">
                          <label for="categoryDesc" class="required">分类描述</label>
                          <input type="text" class="form-control"
                                 id="categoryDescEdit" placeholder="分类描述">
                        </div>
                      </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default"
                              onclick="clearModel('addcategoryModal')"
                              data-dismiss="modal">关闭
                      </button>
                      <button type="button" class="btn btn-primary" onclick="saveEditCategory()">
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
  <script>
    $(function () {
      //2. 初始化datagrid
      $('#datagridExample').datagrid({
        dataSource: {
          cols: [
            {name: 'id', label: '分类id', width: 80, sort: false},
            {name: 'categoryName', label: '分类名', width: 0.3, sort: false},
            {name: 'categoryDesc', label: '分类描述', width: 0.5, sort: false},
            {name: 'path', label: '分类路径', width: 0.2, sort: false}
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

    //3. 保存分类
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
              $('#addcategoryModal').modal('hide');
              clearModel('addcategoryModal');
              //刷新数据表格
              reflashdatagrid();
            }

          })
        }

      }

    }

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
            url: '/admin/category/deleteById/' + value.id,
            type: 'DELETE',
            success: function (result) {
              //要重新刷新表格
              reflashdatagrid();
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

    function activeEditModel() {
      var myDataGrid = $('#datagridExample').data('zui.datagrid');
      var selectedItems = myDataGrid.getCheckItems();
      if (selectedItems.length !== 1) {
        new $.zui.Messager('数据选择错误', {
          icon: 'bell',// 定义消息图标
          time: 1000
        }).show()
      } else {
        console.log(selectedItems);
        var categorySelected = selectedItems[0];
        $("#categoryNameEdit").val(categorySelected.categoryName);
        $("#idEdit").val(categorySelected.id);
        $("#categoryDescEdit").val(categorySelected.categoryDesc);
        $("#editModal").modal('show')
      }

    }

    function saveEditCategory() {
      var name = $("#categoryNameEdit");
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
            id: $("#idEdit").val(),
            categoryName: truename,
            categoryDesc: $("#categoryDescEdit").val()
          }, function (data) {
            if (data.result === 'success') {
              //浮动消息通知
              new $.zui.Messager('保存成功！', {
                type: 'success', // 定义颜色主题，
                time: 1000,
                icon: 'ok'
              }).show();
              $('#editModal').modal('hide');
              clearModel('editModal');
              //刷新数据表格
              reflashdatagrid();
            }

          })
        }

      }
    }

    /**
     * 保存之前进行校验
     */
    // 当输入框选中，则清除error样式
    function removeError() {
      $("#categoryName").parent().removeClass('has-error');
    }

    function reflashdatagrid() {
      var myDataGrid = $('#datagridExample').data('zui.datagrid');
      //要重新刷新表格
      myDataGrid.dataSource.data = null;
      myDataGrid.render();
    }

  </script>
    <@foot></@foot>
</#compress>
