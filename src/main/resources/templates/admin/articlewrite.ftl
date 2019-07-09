<#--compress指令的作用是将页面压缩-->
<#compress >
    <#include "common/marco.ftl">
    <@head ></@head>
  <div class="content-wrapper">
    <div class="content-header">
      <ul class="breadcrumb">
        <li><a href="#"><i class="icon icon-home"></i></a></li>
        <li class="active">写博客</li>
      </ul>
    </div>
    <div class="content-body">
      <div class="container-fluid">
        <div class="row">
          <form method="post" action="/admin/article/saveOrUpdate">
            <input type="hidden" id="id" name="id">
            <div class="col-md-12" style="margin-top: 20px">
              <div class="input-control">
                <input id="title" name="title" type="text" class="form-control input-lg"
                       onfocus="removeError()" placeholder="文章标题" autocomplete="off">
              </div>
            </div>
            <div class="col-md-12" style="margin-top: 20px">
								<textarea class="form-control" name="summary" id="summary" rows="3"
                          placeholder="摘要" autocomplete="off"></textarea>
            </div>
            <div class="col-md-12" style="margin-top: 20px">
								<textarea id="content" name="content" class="form-control kindeditor"
                          style="height:550px;"></textarea>
            </div>
            <div class="col-md-12 form-inline" style="margin-top: 20px">
              <div class="form-group">
                <label for="category">选择分类</label>
                <select class="form-control" id="category">
                </select>
              </div>
              <div class="form-group">
                <label for="allowComment">是否允许评论</label>
                <select class="form-control" id="allowComment">
                  <option value="true">允许</option>
                  <option value="false">不允许</option>
                </select>
              </div>
              <div class="form-group">
                <label for="isRecommend">是否推荐</label>
                <select class="form-control" id="isRecommend">
                  <option value="true">推荐</option>
                  <option value="false">不推荐</option>
                </select>
              </div>
            </div>
            <div class="col-md-12" style="margin-top: 20px">
              <div class="col-md-6">
                <button class="btn btn-block" type="button" onclick="saveAsDraft()">保存为草稿</button>
              </div>
              <div class="col-md-6">
                <button class="btn btn-block btn-success" type="button"
                        onclick="saveAndPublish()">
                  保存并发布
                </button>
              </div>
            </div>

          </form>
        </div>
      </div>
    </div>
  </div>
  <script>
    var kindeditor;
    $(function () {
      kindeditor = KindEditor.create('textarea.kindeditor', {
        basePath: '/static/plugins/zui/lib/kindeditor/',
        allowFileManager: true,
        bodyClass: 'article-content',
        filePostName: "files",
        uploadJson: "/admin/file/uploadFile"
      });
      //查询所有的分类
      $.get("/admin/category/findAllCategory", function (data) {
        if (data.result === 'success') {
          data.data.forEach(function (value, i) {
            $("#category").append(
                "<option value='" + value.id + "'>" + value.categoryName + "</option>");
          });
        } else {
          console.log('分类加载失败');
        }
      })
    });

    //在提交之前都去判断
    function saveAsDraft() {
      kindeditor.sync();
      var tileInput = $("#title");
      console.log(tileInput.val());
      if (tileInput.val() === '') {
        tileInput.parent().addClass('has-error');
        new $.zui.Messager('请将文章填写完整', {
          type: 'warning', // 定义颜色主题，
          time: 1000,
          icon: 'warning-sign'
        }).show();
      } else {
        var trueTile = tileInput.val().trim();
        var parms = {
          "id": $("#id").val(),
          "title": trueTile,
          "summary": $("#summary").val(),
          "content": $("#content").val(),
          "articleStatus": false,
          "allowComment": $("#allowComment").val(),
          "isRecommend": $("#isRecommend").val(),
          "category": {
            "id": $("#category").val()
          }

        };
        $.ajaxSettings.contentType = "application/json;charset=UTF-8";
        $.post("/admin/article/saveOrUpdate", JSON.stringify(parms), function (callback) {
          if (callback != null) {
            $("#id").val(callback.id);
            //浮动消息通知
            new $.zui.Messager('保存草稿成功！', {
              type: 'success', // 定义颜色主题，
              time: 1000,
              icon: 'ok'
            }).show();
            //跳转到文章列表
            window.location.href = '/admin/article/list/';
          } else {
            //浮动消息通知
            new $.zui.Messager('保存失败！', {
              icon: 'warning-sign', // 定义消息图标
              time: 1000
            }).show();
          }

        });

      }
    }

    // 当输入框选中，则清除error样式
    function removeError() {
      $("#title").parent().removeClass('has-error');
    }

    function saveAndPublish() {
      kindeditor.sync();
      var tileInput = $("#title");
      console.log(tileInput.val());
      if (tileInput.val() === '') {
        tileInput.parent().addClass('has-error');
        new $.zui.Messager('请将文章填写完整', {
          type: 'warning', // 定义颜色主题，
          time: 1000,
          icon: 'warning-sign'
        }).show();
      } else {
        var trueTile = tileInput.val().trim();
        var parms = {
          "id": $("#id").val(),
          "title": trueTile,
          "summary": $("#summary").val(),
          "content": $("#content").val(),
          "articleStatus": true,
          "allowComment": $("#allowComment").val(),
          "isRecommend": $("#isRecommend").val(),
          "category": {
            "id": $("#category").val()
          }

        };
        $.ajaxSettings.contentType = "application/json;charset=UTF-8";
        $.post("/admin/article/saveOrUpdate", JSON.stringify(parms), function (callback) {
          if (callback != null) {
            $("#id").val(callback.id);
            //浮动消息通知
            new $.zui.Messager('保存草稿成功！', {
              type: 'success', // 定义颜色主题，
              time: 1000,
              icon: 'ok'
            }).show();
            //跳转到文章列表
            window.location.href = '/admin/article/list/';
          } else {
            //浮动消息通知
            new $.zui.Messager('保存失败！', {
              icon: 'warning-sign', // 定义消息图标
              time: 1000
            }).show();
          }

        });

      }
    }
  </script>
    <@foot></@foot>
</#compress>
