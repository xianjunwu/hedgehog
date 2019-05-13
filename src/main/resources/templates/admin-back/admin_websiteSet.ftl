<#compress >
  <#include "common/public.ftl">
  <@header>网站设置</@header>
  <!-- 顶部栏模块 -->
  <#include "common/adminHeader.ftl">
  <!-- 菜单栏模块 -->
  <#include "common/adminsSidebar.ftl">
  <div class="wrapper">
    <div class="content-wrapper">
      <style type="text/css" rel="stylesheet">
        .form-horizontal .control-label {
          text-align: left;
        }

        .nav-tabs-custom > .nav-tabs > li.active {
          border-top-color: #d2d6de;
        }

        .control-radio {
          padding-top: 7px;
        }
      </style>
      <section class="content-header">
        <h1>网站设置
          <small></small>
        </h1>
        <ol class="breadcrumb">
          <li>
            <a data-pjax="true" href="/admin">
              <i class="fa fa-dashboard"></i>首页</a>
          </li>
          <li class="active">网站设置</li>
        </ol>
      </section>
      <!-- tab选项卡 -->
      <section class="content container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="nav-tabs-custom">
              <ul class="nav nav-tabs">
                <li class="active">
                  <a href="#general" data-toggle="tab">常规设置</a>
                </li>
                <li>
                  <a href="#seo" data-toggle="tab">SEO设置</a>
                </li>
                <#--<li>-->
                <#--<a href="#email" data-toggle="tab">邮箱设置</a>-->
                <#--</li>-->
              </ul>
              <!-- 基础设置 -->
              <div class="tab-content">
                <#--常规设置-->
                <div class="tab-pane active" id="general">
                  <form method="post" action="/admin/websiteSet/updateInfo" class="form-horizontal"
                        id="commonInfoForm">
                    <div class="box-body">
                      <input name="id" hidden value="${commonInfo.id}">
                      <div class="form-group">
                        <label for="blogTitle" class="col-lg-2 col-sm-4 control-label">网站名:</label>
                        <div class="col-lg-4 col-sm-8">
                          <input type="text" class="form-control" id="pwebName" name="pwebName"
                                 value="${commonInfo.pwebName!""}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="blogTitle" class="col-lg-2 col-sm-4 control-label">网站标语:</label>
                        <div class="col-lg-4 col-sm-8">
                          <input type="text" class="form-control" id="pwebSlogen" name="pwebSlogen"
                                 value="${commonInfo.pwebSlogen!""}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="blogLogo"
                               class="col-lg-2 col-sm-4 control-label">网站LOGO:</label>
                        <div class="col-lg-4 col-sm-8">
                          <div class="input-group">
                            <img src="${commonInfo.pwebLogoUrl!""}" alt="">
                            <input type="text" class="form-control selectData" id="pwebLogoUrl"
                                   name="pwebLogoUrl" value="${commonInfo.pwebLogoUrl!""}">
                            <span class="input-group-btn">
                              <button class="btn btn-default " type="button"
                                      onclick="openAttach('blogLogo')">选择</button>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="blogFavicon"
                               class="col-lg-2 col-sm-4 control-label">网页标志:</label>
                        <div class="col-lg-4 col-sm-8">
                          <div class="input-group">
                            <img src="${commonInfo.pwebFaviconUrl!""}" alt="">
                            <input type="text" class="form-control selectData" id="pwebFaviconUrl"
                                   name="pwebFaviconUrl" value="${commonInfo.pwebFaviconUrl!""}">
                            <span class="input-group-btn">
                              <button class="btn btn-default " type="button"
                                      onclick="openAttach('blogFavicon')">选择</button>
                            </span>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="blogFooterInfo" class="col-lg-2 col-sm-4 control-label">页脚版权信息：
                          <span data-toggle="tooltip" data-placement="top"
                                title="如:Designed by  dengyi Copyright ©2017-2018 dengyi.pro 版权所有 备案号:浙ICP备17049324号"
                                style="cursor: pointer"><i class="fa fa-question-circle"
                                                           aria-hidden="true"></i>
                          </span>
                        </label>
                        <div class="col-lg-4 col-sm-8">
                          <textarea class="form-control" rows="5" id="pwebCopyright"
                                    name="pwebCopyright"
                                    style="resize: none">${commonInfo.pwebCopyright!"Designed by
                           dengyi Copyright ©2017-2018 dengyi.pro 版权所有 备案号:浙ICP备17049324号"}</textarea>
                        </div>
                      </div>
                    </div>
                    <div class="box-footer">
                      <button type="button" class="btn btn-primary btn-sm "
                              onclick="updatecommonInfo()">保存
                      </button>
                    </div>
                  </form>
                </div>
                <!-- seo设置 -->
                <div class="tab-pane" id="seo">
                  <form method="post" class="form-horizontal" id="seoForm">
                    <input type="hidden" id="seoId" name="seoId" value="${webSeo.id}">
                    <div class="box-body">
                      <div class="form-group">
                        <label for="keywords" class="col-lg-2 col-sm-4 control-label">关键词：
                          <span data-toggle="tooltip" data-placement="top" title="多个关键词使用,隔开"
                                style="cursor: pointer">
                            <i class="fa fa-question-circle" aria-hidden="true"></i>
                          </span>
                        </label>
                        <div class="col-lg-4 col-sm-8">
                          <input type="text" class="form-control" id="keywords" name="keywords"
                                 value="${webSeo.keywords}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="desc" class="col-lg-2 col-sm-4 control-label">博客描述：</label>
                        <div class="col-lg-4 col-sm-8">
                          <input type="text" class="form-control" id="description"
                                 name="description" value="${webSeo.description}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="desc" class="col-lg-2 col-sm-4 control-label">作者：</label>
                        <div class="col-lg-4 col-sm-8">
                          <input type="text" class="form-control" id="author" name="author"
                                 value="${webSeo.author}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="blogVerificationGoogle" class="col-lg-2 col-sm-4 control-label">Google
                          站点验证：</label>
                        <div class="col-lg-4 col-sm-8">
                          <input type="text" class="form-control" id="gtoken" name="gtoken"
                                 value="${webSeo.gtoken}">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="blogVerificationBaidu" class="col-lg-2 col-sm-4 control-label">Baidu
                          站点验证：</label>
                        <div class="col-lg-4 col-sm-8">
                          <input type="text" class="form-control" id="btoken" name="btoken"
                                 value="${webSeo.btoken}">
                        </div>
                      </div>
                    </div>
                    <div class="box-footer">
                      <button type="button" class="btn btn-primary btn-sm " onclick="saveSeo()">保存
                      </button>
                    </div>
                  </form>
                </div>
                <!-- 邮箱设置 -->
                <#--<div class="tab-pane" id="email">-->
                <#--<form method="post" class="form-horizontal" id="emailOptions">-->
                <#--<div class="box-body">-->
                <#--<div class="form-group">-->
                <#--<label class="col-lg-2 col-sm-4 control-label">是否启用：</label>-->
                <#--<div class="col-lg-4 col-sm-8 control-radio">-->
                <#--<div class="pretty p-default p-round">-->
                <#--<input type="radio" name="smtp_email_enable" value="true">-->
                <#--<div class="state p-primary">-->
                <#--<label>启用</label>-->
                <#--</div>-->
                <#--</div>-->
                <#--<div class="pretty p-default p-round">-->
                <#--<input type="radio" name="smtp_email_enable" value="false" checked>-->
                <#--<div class="state p-primary">-->
                <#--<label>禁用</label>-->
                <#--</div>-->
                <#--</div>-->
                <#--</div>-->
                <#--</div>-->
                <#--<div class="form-group">-->
                <#--<label for="emailSmtpHost" class="col-lg-2 col-sm-4 control-label">SMTP-->
                <#--地址：</label>-->
                <#--<div class="col-lg-4 col-sm-8">-->
                <#--<input type="text" class="form-control" id="emailSmtpHost"-->
                <#--name="mail_smtp_host" value=""-->
                <#--autocomplete='address-line1'>-->
                <#--</div>-->
                <#--</div>-->
                <#--<div class="form-group">-->
                <#--<label for="emailSmtpUserName"-->
                <#--class="col-lg-2 col-sm-4 control-label">邮箱账号：</label>-->
                <#--<div class="col-lg-4 col-sm-8">-->
                <#--<input type="email" class="form-control" id="emailSmtpUserName"-->
                <#--name="mail_smtp_username" value=""-->
                <#--autocomplete="email">-->
                <#--</div>-->
                <#--</div>-->
                <#--<div class="form-group">-->
                <#--<label for="emailSmtpPassword"-->
                <#--class="col-lg-2 col-sm-4 control-label">邮箱密码：</label>-->
                <#--<div class="col-lg-4 col-sm-8">-->
                <#--<input type="password" class="form-control" id="emailSmtpPassword"-->
                <#--name="mail_smtp_password" value=""-->
                <#--current-password>-->
                <#--</div>-->
                <#--</div>-->
                <#--<div class="form-group">-->
                <#--<label for="emailFromName"-->
                <#--class="col-lg-2 col-sm-4 control-label">发件姓名：</label>-->
                <#--<div class="col-lg-4 col-sm-8">-->
                <#--<input type="text" class="form-control" id="emailFromName"-->
                <#--name="mail_from_name" value=""-->
                <#--autocomplete="name">-->
                <#--</div>-->
                <#--</div>-->
                <#--</div>-->
                <#--<div class="box-footer">-->
                <#--<button type="button" class="btn btn-primary btn-sm "-->
                <#--onclick="saveOptions('emailOptions')">保存-->
                <#--</button>-->
                <#--</div>-->
                <#--</form>-->
                <#--</div>-->
              </div>
            </div>
          </div>
        </div>
      </section>
      <script>
        $(function () {
          $('[data-toggle="tooltip"]').tooltip();
          checkCommentOption();
          checkAttachOption();
        });

        /** * 打开附件 */ function openAttach(id) {
          layer.open({
            type: 2,
            title: '所有附件',
            shadeClose: true,
            shade: 0.5,
            maxmin: true,
            area: ['90%', '90%'],
            content: '/admin/attachments/select?id=' + id,
            scrollbar: false
          });
        }

        /** * 更新所有文章的摘要 */ function updateAllSummary() {
          $.ajax({
            type: 'GET',
            url: '/admin/posts/updateSummary',
            data: {postSummary: $('#postSummary').val()},
            success: function (data) {
              if (data.code == 1) {
                showMsg(data.msg, "success", 1000);
              } else {
                showMsg(data.msg, "success", 2000);
              }
            }
          });
        }

        /** * 主动提交文章到百度 */ function pushAllToBaidu() {
          $.ajax({
            type: 'GET',
            url: '/admin/posts/pushAllToBaidu',
            data: {baiduToken: $('#baiduToken').val()},
            success: function (data) {
              if (data.code == 1) {
                showMsg(data.msg, "success", 1000);
              } else {
                $.toast({
                  text: data.msg,
                  heading: '提示',
                  icon: icon,
                  showHideTransition: 'fade',
                  allowToastClose: true,
                  hideAfter: hideAfter,
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

        /** * 评论选项切换 */ function checkCommentOption() {
          var native = $('input:radio[value=native]:checked').val();
          var valine = $('input:radio[value=valine]:checked').val();
          var disqus = $('input:radio[value=disqus]:checked').val();
          var livere = $('input:radio[value=livere]:checked').val();
          var changyan = $('input:radio[value=changyan]:checked').val();
          if (native != null) {
            $('.native-options').show();
          } else {
            $('.native-options').hide();
          }
          if (valine != null) {
            $('.valine-options').show();
          } else {
            $('.valine-options').hide();
          }
          if (disqus != null) {
            $('.disqus-options').show();
          } else {
            $('.disqus-options').hide();
          }
          if (livere != null) {
            $('.livere-options').show();
          } else {
            $('.livere-options').hide();
          }
          if (changyan != null) {
            $('.changyan-options').show();
          } else {
            $('.changyan-options').hide();
          }
        }

        /** * 附件选项切换 */ function checkAttachOption() {
          var server = $('input:radio[value=server]:checked').val();
          var upyun = $('input:radio[value=upyun]:checked').val();
          var qiniu = $('input:radio[value=qiniu]:checked').val();
          if (server != null) {
            $('.server-options').show();
          } else {
            $('.server-options').hide();
          }
          if (upyun != null) {
            $('.upyun-options').show();
          } else {
            $('.upyun-options').hide();
          }
          if (qiniu != null) {
            $('.qiniu-options').show();
          } else {
            $('.qiniu-options').hide();
          }
        }

        /** * 后台布局切换 */ function viewLayout() {
          var layout = $('input:radio[value=layout-boxed]:checked').val();
          if (layout != null) {
            $('body').addClass('layout-boxed');
          } else {
            $('body').removeClass('layout-boxed');
          }
        }

        /** * 预览侧边栏 */ function viewSideBar() {
          var layout = $('input:radio[value=sidebar-collapse]:checked').val();
          if (layout != null) {
            $('body').addClass('sidebar-collapse');
          } else {
            $('body').removeClass('sidebar-collapse');
          }
        }

        $('input[name=comment_system]').click(function () {
          checkCommentOption();
        });
        $('input[name=attach_loc]').click(function () {
          checkAttachOption();
        });
        $('input[name=admin_layout]').click(function () {
          viewLayout();
        });
        $('input[name=sidebar_style]').click(function () {
          viewSideBar();
        });
        /** * 预览后台样式切换 */ $(function () {
          var beforeTheme;
          $('#adminTheme').change(function () {
            if ($('body').hasClass("skin-blue")) {
              $('body').removeClass("skin-blue");
            }
            if (beforeTheme != null) {
              $('body').removeClass(beforeTheme);
            }
            $('body').addClass($(this).val());
            beforeTheme = $(this).val();
          })
        })

        function updatecommonInfo() {
          var saveFlage = true;
          if ($("#pwebName").val() === "") {
            saveFlage = false;
          }
          if ($("#pwebSlogen").val() === "") {
            saveFlage = false;
          }
          if ($("#pwebLogoUrl").val() === "") {
            saveFlage = false;
          }
          if ($("#pwebFaviconUrl").val() === "") {
            saveFlage = false;
          }
          if ($("#pwebCopyright").val() === "") {
            saveFlage = false;
          }
          if (saveFlage) {
            $("#commonInfoForm").submit();
          } else {
            showMsg("请将信息填写完整", "error", 1000);
          }
        }

        function saveSeo() {
          var saveFlage = true;
          if ($("#keywords").val() === "") {
            saveFlage = false;
          }
          if ($("#description").val() === "") {
            saveFlage = false;
          }
          if ($("#author").val() === "") {
            saveFlage = false;
          }
          if ($("#gtoken").val() === "") {
            saveFlage = false;
          }
          if ($("#btoken").val() === "") {
            saveFlage = false;
          }
          if (saveFlage) {
            $.ajax({
              type: 'POST',
              url: '/admin/seo/addOrUpdateSeo',
              data: {
                id: $("#seoId").val(),
                keywords: $("#keywords").val(),
                description: $("#description").val(),
                author: $("#author").val(),
                gtoken: $("#gtoken").val(),
                btoken: $("#btoken").val()
              },
              success: function (data) {
                if (data.status) {
                  showMsg(data.messages, "success", 1000);
                } else {
                  showMsg(data.messages, "success", 2000);
                }
              }
            });
          } else {
            showMsg("请将信息填写完整", "error", 1000);
          }
        }
      </script>
    </div>
  </div>
  <@footer></@footer>
</#compress>
