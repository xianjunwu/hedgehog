<#compress >
  <#include "common/public.ftl">
  <@header>dengyi.pro | 创作</@header>
  <!-- 顶部栏模块 -->
  <#include "common/adminHeader.ftl">
  <!-- 菜单栏模块 -->
  <#include "common/adminsSidebar.ftl">
  <div class="content-wrapper">
    <link rel="stylesheet" href="/static/plugins/simplemde/simplemde.min.css">
    <link rel="stylesheet" href="/static/plugins/jquery-tageditor/jquery.tag-editor.css">
    <link href="/static/plugins/highlightjs/monokai.css" rel="stylesheet">
    <div class="content">
      <section class="content">
        <div class="row">
          <div class="col-md-9">
            <input type="hidden" id="articleId" name="articleId"
                   value="<#if article??>${article.id}</#if>">
            文章标题
            <div style="margin-bottom: 10px;">
              <input type="text" class="form-control input-lg" id="title" placeholder="请输入文章标题"
                     value="<#if article??>${article.title}</#if>">
            </div>
            文章摘要
            <div style="margin-bottom: 10px;">
              <textarea class="form-control" rows="5" id="summary"
                        placeholder="请输入文章摘要"><#if article??>${article.summary}</#if></textarea>
            </div>
            正文
            <div class="box box-primary">
              <!-- Editor.md编辑器 -->
              <div class="box-body pad">
                <div id="markdown-editor">
                  <textarea id="content" style="display:none;"></textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">发布</h3>
                <div class="box-tools">
                  <button type="button" class="btn btn-box-tool" data-widget="collapse"
                          data-toggle="tooltip" title="Collapse">
                    <i class="fa fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="box-body">
                <label for="allowComment" class="control-label">开启评论：</label>
                <select class="form-control" id="allowComment">
                  <option value="true">是</option>
                  <option value="false">否</option>
                </select>
              </div>
              <div class="box-footer">
                <button onclick="saveAsDraft()" class="btn btn-default btn-sm ">保存为草稿</button>
                <button onclick="saveAsDraft()" class="btn btn-primary btn-sm pull-right">保存并发布
                </button>
              </div>
            </div>
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">文章分类</h3>
                <div class="box-tools">
                  <button type="button" class="btn btn-box-tool" data-widget="collapse"
                          title="Collapse">
                    <i class="fa fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="box-body" style="display: block">
                <select class="form-control" id="articleCategory">
                  <option value="0">博客</option>
                  <option value="1">教程</option>
                  <option value="2">读书</option>
                  <option value="3">开源项目</option>
                </select>

              </div>
            </div>
            <#--文章标签使用autocomplate完成-->
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">标签
                  <small>使用enter键确认选择</small>
                </h3>
                <div class="box-tools">
                  <button type="button" class="btn btn-box-tool" data-widget="collapse"
                          title="Collapse">
                    <i class="fa fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="box-body">
                <input type="text" class="form-control input-lg" id="tagList" name=""/><br>
              </div>
            </div>
          </div>
        </div>
      </section>
        <input type="file" id="fileupload"  accept="image/gif, image/jpeg, image/png, image/jpg">
    </div>
    <script src="/static/plugins/simplemde/simplemde.min.js"></script>
    <script src="/static/plugins/inline-attachment/codemirror-4.inline-attachment.min.js"></script>
    <script src="/static/plugins/jquery-tageditor/jquery.tag-editor.min.js"></script>
    <script src="/static/plugins/jquery-tageditor/jquery.caret.min.js"></script>
    <script src="/static/plugins/hz2py/jQuery.Hz2Py-min.js"></script>
    <script src="/static/plugins/highlightjs/highlight.pack.js"></script>
    <script>
      var articleTitle = $("#title");
      var cateList = new Array();
      /**
       * 加载md编辑器
       */
      var simplemde = new SimpleMDE({
        element: document.getElementById("content"),
        autoDownloadFontAwesome: false,
        autofocus: false,
        placeholder: "请输入内容",
        autosave: {
          enabled: false,
          uniqueId: "editor-temp-1",
          delay: 10000
        },
        renderingConfig: {
          codeSyntaxHighlighting: true
        },
        showIcons: ["code", "table"],
        status: true,
        // status: ["autosave", "lines", "words"],
        tabSize: 4
      });

      function saveAsDraft() {
        //定义事件判断
        var boolean = true;
        var title = $("#title").val();
        if (title == null || title === '') {
          boolean = false;
          alert("必须输入文章标题");
        }
        var summary = $("#summary").val();
        if (summary == null || summary === '') {
          boolean = false;
          alert("必须输入文章摘要");
        }
        if (boolean) {
          //验证通过
          $.post("/admin/article/saveArticle", {
            id: $("#articleId").val(),
            title: $("#title").val(),
            summary: $("#summary").val(),
            content: simplemde.markdown(simplemde.value()),
            type: $("#articleCategory").val()
          }, function (data) {
            if (data.status) {
              //保存成功
              var id = data.result.id;
              //将生成的id保存在隐藏input中
              $("#articleId").val(id);
              alert("保存成功");
            } else {
              //保存失败
              alert("保存失败");
            }

          });
        }

      }

      $('.fa.fa-picture-o').click(function () {
        $("#fileupload").click(function () {
          console.log(11);
        });
      });
      //  simplemde.toggleSideBySide();//打开实时全屏预览
      /**
       * 方法来自https://gitee.com/supperzh/zb-blog/blob/master/src/main/resources/templates/article/publish.html#L255
       */
      $(function () {
        inlineAttachment.editors.codemirror4.attach(simplemde.codemirror, {
          uploadUrl: "/admin/attachments/upload"
        });
      })
      /**
       * 初始化标签
       */
      $('#tagList').tagEditor({
//initialTags: ['Hello', 'World', 'Example', 'Tags'],
        delimiter: ',',
        placeholder: '请输入标签',
        forceLowercase: false
      });
      /**
       * 加载该文章已有的标签
       */
      $('#chooseTag').change(function () {
        $('#tagList').tagEditor('addTag', $(this).val());
      });

      /**
       * 打开附件
       */
      function openAttach(e) {
        layer.open({
          type: 2,
          title: '所有附件',
          shadeClose: true,
          shade: 0.5,
          maxmin: true,
          area: ['90%', '90%'],
          content: '/admin/attachments/select?id=' + e,
          scrollbar: false
        });
      }

      function openAttachCopy() {
        layer.open({
          type: 2,
          title: '所有附件',
          shadeClose: true,
          shade: 0.5,
          maxmin: true,
          area: ['90%', '90%'],
          content: '/admin/attachments/select?type=post',
          scrollbar: false
        });
      }

      /**
       * 自动填充路径，并且将汉字转化成拼音以-隔开
       */
      function autoComplateUrl() {
        var titleVal = $("#post_title").val();
        if (titleVal != "" && titleVal != null && $("#postUrl").html() == '') {
          var result = $("#post_title").toPinyin().toLowerCase();
          $("#postUrl").html(result.substring(0, result.length - 1));
        }
      }

      /**
       * 检测是否已经存在该链接
       * @constructor
       */
      function urlOnBlurAuto() {
        if ($('#newPostUrl').val() === "") {
          showMsg("固定链接不能为空！", "info", 2000);
          return;
        }
        $.ajax({
          type: 'GET',
          url: '/admin/posts/checkUrl',
          async: false,
          data: {
            'postUrl': $('#newPostUrl').val()
          },
          success: function (data) {
            if (data.code == 0) {
              showMsg(data.msg, "error", 2000);
              return;
            } else {
              $('#postUrl').html($('#newPostUrl').val());
              $('#btn_change_postUrl').hide();
              $('#btn_input_postUrl').show();
            }
          }
        });
      }

      $('#btn_input_postUrl').click(function () {
        var postUrl = $("#postUrl").html();
        $('#postUrl').html(
            "<input type='text' id='newPostUrl' onblur='urlOnBlurAuto()' value='" + postUrl + "'>");
        $(this).hide();
        $('#btn_change_postUrl').show();
      });

      /**
       * 提交文章
       * @param status 文章状态
       */
      function push(status) {
        var Title = "";
        if (postTitle.val()) {
          Title = postTitle.val();
        } else {
          showMsg("标题不能为空！", "info", 2000);
          return;
        }
        $('input[name="categories"]:checked').each(function () {
          cateList.push($(this).val());
        });
        if ($('#postUrl').html() === "") {
          showMsg("固定链接不能为空！", "info", 2000);
          return;
        }
        $.ajax({
          type: 'POST',
          url: '/admin/posts/new/push',
          async: false,
          data: {
            'postId': $('#postId').val(),
            'postStatus': status,
            'postTitle': Title,
            'postUrl': $('#postUrl').html().toString(),
            'postContentMd': simplemde.value(),
            'postContent': simplemde.markdown(simplemde.value()),
            'postThumbnail': $('#selectImg').attr('src'),
            'cateList': cateList.toString(),
            'tagList': $('#tagList').tagEditor('getTags')[0].tags.toString(),
            'allowComment': $('#allowComment').val()
          },
          success: function (data) {
            if (data.code == 1) {
//清除自动保存的内容
              simplemde.clearAutosavedValue();
              $.toast({
                text: data.msg,
                heading: '提示',
                icon: 'success',
                showHideTransition: 'fade',
                allowToastClose: true,
                hideAfter: 1000,
                stack: 1,
                position: 'top-center',
                textAlign: 'left',
                loader: true,
                loaderBg: '#ffffff',
                afterHidden: function () {
                  window.location.href = "/admin/posts";
                }
              });
            } else {
              $.toast({
                text: data.msg,
                heading: '提示',
                icon: 'error',
                showHideTransition: 'fade',
                allowToastClose: true,
                hideAfter: 1000,
                stack: 1,
                position: 'top-center',
                textAlign: 'left',
                loader: true,
                loaderBg: '#ffffff'
              });
            }
          }
        });
      }

      // setInterval("autoPush()","60000");
      /**
       * 自动保存文章
       */
      function autoPush() {
        let title = "";
        if (postTitle.val()) {
          Title = postTitle.val();
        }
        $.ajax({
          type: 'POST',
          url: '/admin/article/autoSave',
          async: false,
          data: {
            'id': $('#postId').val(),
            'title': Title,
            'postUrl': $('#postUrl').html().toString(),
            'postContentMd': simplemde.value()
          },
          success: function (data) {
            if (!$("#post_title").val()) {
              $("#post_title").val(data.result.postTitle);
            }
            if (!$("#postId").val()) {
              $("#postId").val(data.result.postId);
            }
            if ($("#postUrl").html() == '') {
              $("#postUrl").html(data.result.postUrl);
            }
          }
        });
      }

      /**
       * 组合键 Ctrl+s 保存
       */
      $(document).keydown(function (event) {
        if (event.ctrlKey && event.keyCode === 83) {
          autoPush();
        }
      });

      /**
       * 页面加载后加载markdown编辑器同时标题获取焦点
       */
      $(function () {
        $("#articleTitle").focus();
        //清除md中数据
        simplemde.value("");
      });
    </script>
  </div>
  <@footer></@footer>
</#compress>