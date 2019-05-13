<#compress >
    <#include "common/public.ftl">
<#--将页面标题传入-->
    <@header>文章标签管理</@header>
            <!-- 顶部栏模块 -->
    <#include "common/adminHeader.ftl">
            <!-- 菜单栏模块 -->
    <#include "common/adminsSidebar.ftl">
<div class="wrapper">
    <div class="content-wrapper">
        <style>
            .tags {
                zoom: 1;
                margin: 0;
                padding: 0
            }

            .tags:after, .tags:before {
                content: '';
                display: table
            }

            .tags:after {
                clear: both
            }

            .tags li {
                position: relative;
                float: left;
                margin: 0 0 8px 12px;
                list-style: none
            }

            .tags li:active {
                margin-top: 1px;
                margin-bottom: 7px
            }

            .tags li:after {
                content: '';
                z-index: 2;
                position: absolute;
                top: 10px;
                right: -2px;
                width: 5px;
                height: 6px;
                opacity: .95;
                background: #eb6b22;
                border-radius: 3px 0 0 3px;
                -webkit-box-shadow: inset 1px 0 #99400e;
                box-shadow: inset 1px 0 #99400e
            }

            .tags a, .tags span {
                display: block;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box
            }

            .tags a {
                height: 26px;
                line-height: 23px;
                padding: 0 9px 0 8px;
                font-size: 12px;
                color: #555;
                text-decoration: none;
                text-shadow: 0 1px #fff;
                background: #fafafa;
                border-width: 1px 0 1px 1px;
                border-style: solid;
                border-color: #dadada #d2d2d2 #c5c5c5;
                border-radius: 3px 0 0 3px;
                background-image: -webkit-linear-gradient(top, #fcfcfc, #f0f0f0);
                background-image: -moz-linear-gradient(top, #fcfcfc, #f0f0f0);
                background-image: -o-linear-gradient(top, #fcfcfc, #f0f0f0);
                background-image: linear-gradient(to bottom, #fcfcfc, #f0f0f0);
                -webkit-box-shadow: inset 0 0 0 1px rgba(255, 255, 255, .7), 0 1px 2px rgba(0, 0, 0, .05);
                box-shadow: inset 0 0 0 1px rgba(255, 255, 255, .7), 0 1px 2px rgba(0, 0, 0, .05)
            }

            .tags a:hover span {
                padding: 0 7px 0 6px;
                max-width: 40px;
                -webkit-box-shadow: inset 0 0 0 1px rgba(255, 255, 255, .15), 1px 1px 2px rgba(0, 0, 0, .2);
                box-shadow: inset 0 0 0 1px rgba(255, 255, 255, .15), 1px 1px 2px rgba(0, 0, 0, .2)
            }

            .tags span {
                position: absolute;
                top: 1px;
                left: 100%;
                z-index: 2;
                overflow: hidden;
                max-width: 0;
                height: 24px;
                line-height: 21px;
                padding: 0 0 0 2px;
                color: #fff;
                text-shadow: 0 -1px rgba(0, 0, 0, .3);
                background: #eb6b22;
                border: 1px solid;
                border-color: #d15813 #c85412 #bf5011;
                border-radius: 0 2px 2px 0;
                opacity: .95;
                background-image: -webkit-linear-gradient(top, #ed7b39, #df5e14);
                background-image: -moz-linear-gradient(top, #ed7b39, #df5e14);
                background-image: -o-linear-gradient(top, #ed7b39, #df5e14);
                background-image: linear-gradient(to bottom, #ed7b39, #df5e14);
                -webkit-transition: .3s ease-out;
                -moz-transition: .3s ease-out;
                -o-transition: .3s ease-out;
                transition: .3s ease-out;
                -webkit-transition-property: padding, max-width;
                -moz-transition-property: padding, max-width;
                -o-transition-property: padding, max-width;
                transition-property: padding, max-width
            }

            .green li:after {
                background: #65bb34;
                -webkit-box-shadow: inset 1px 0 #3a6b1e;
                box-shadow: inset 1px 0 #3a6b1e
            }

            .green span {
                background: #65bb34;
                border-color: #549b2b #4f9329 #4b8b27;
                background-image: -webkit-linear-gradient(top, #71ca3f, #5aa72e);
                background-image: -moz-linear-gradient(top, #71ca3f, #5aa72e);
                background-image: -o-linear-gradient(top, #71ca3f, #5aa72e);
                background-image: linear-gradient(to bottom, #71ca3f, #5aa72e)
            }

            .blue li:after {
                background: #56a3d5;
                -webkit-box-shadow: inset 1px 0 #276f9e;
                box-shadow: inset 1px 0 #276f9e
            }

            .blue span {
                background: #56a3d5;
                border-color: #3591cd #318cc7 #2f86be;
                background-image: -webkit-linear-gradient(top, #6aaeda, #4298d0);
                background-image: -moz-linear-gradient(top, #6aaeda, #4298d0);
                background-image: -o-linear-gradient(top, #6aaeda, #4298d0);
                background-image: linear-gradient(to bottom, #6aaeda, #4298d0)
            }
        </style>
        <section class="content-header">
            <h1>
                标签
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li>
                    <a data-pjax="true" href="#">
                        <i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li><a data-pjax="true" href="#">文章管理</a></li>
                <li class="active">标签</li>
            </ol>
        </section>
        <section class="content container-fluid">
            <div class="row">
                <div class="col-md-5">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">添加标签</h3>
                        </div>
                        <form action="/admin/articleTag/add" method="post" role="form" onsubmit="return checkTag()">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="tagName">名称</label>
                                    <input type="text" class="form-control" id="tagName" name="tagName">
                                    <small>页面上所显示的名称</small>
                                </div>
                                <div class="form-group">
                                    <label for="tagUrl">路径名称</label>
                                    <input type="text" class="form-control" id="tagUrl" name="tagUrl">
                                    <small>页面上所显示的名称</small>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary btn-sm ">确定添加</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">所有标签</h3>
                        </div>
                        <div class="box-body table-responsive">
                            <ul class="tags blue">
                                <div class="box-body table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                        <tr>
                                            <th>名称</th>
                                            <th>路径</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                              <#if tags??>
                                  <#list tags as tag>
                                             <tr>
                                                 <td>${tag.tagName}</td>
                                                 <td>${tag.tagUrl}</td>
                                                 <td>
                                                     <a data-pjax="true" href="/admin/category/edit?cateId=2" class="btn btn-primary btn-xs ">修改</a>
                                                     <button class="btn btn-danger btn-xs " onclick="modelShow('/admin/category/delete?cateId=2')">永久删除</button>
                                                 </td>
                                             </tr>
                                  </#list>
                              </#if>
                                        </tbody>
                                    </table>
                                </div>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 删除确认弹出层 -->
        <div class="modal fade label-primary" id="removeCateModal">
            <div class="modal-dialog">
                <div class="modal-content message_align">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">提示</h4>
                    </div>
                    <div class="modal-body">
                        <p>你确定要删除？</p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="url"/>
                        <button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
                        <a onclick="removeIt()" class="btn btn-danger " data-dismiss="modal">确定</a>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function modelShow(url) {
                $('#url').val(url);
                $('#removeCateModal').modal();
            }

            function removeIt() {
                var url = $.trim($("#url").val());
                window.location.href = url;
            }

            function checkTag() {
                var name = $('#tagName').val();
                var url = $('#tagUrl').val();
                var result = true;
                if (name == "" || url == "") {
                    showMsg("请输入完整信息！", "info", 2000);
                    result = false;
                }
                // $.ajax({
                //     type: 'GET',
                //     url: '/admin/tag/checkUrl',
                //     async: false,
                //     data: {
                //         'tagUrl': url
                //     },
                //     success: function (data) {
                //         if (data.code == 0) {
                //             showMsg(data.msg, "error", 2000);
                //             result = false;
                //         }
                //     }
                // });
                return result;
            }
        </script>
    </div>
    <footer class="main-footer">
        <div class="pull-right hidden-xs"><a target="_blank" href="https://github.com/ruibaby/halo/releases/tag/v0.0.8">0.0.8</a></div>
        Thanks for using <strong><a data-pjax="true" href="/admin/halo">Halo</a>.</strong>
    </footer>
</div>
    <@footer></@footer>
</#compress>