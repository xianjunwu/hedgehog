<#compress >
    <#include "common/public.ftl">
<#--将页面标题传入-->
    <@header>文章管理</@header>
<div class="wrapper">
    <!-- 顶部栏模块 -->
    <#include "common/adminHeader.ftl">
    <!-- 菜单栏模块 -->
    <#include "common/adminsSidebar.ftl">
<#--文章分页展示-->
    <div class="content-wrapper">
        <section class="content-header">
            <h1 style="display: inline-block;">文章管理</h1>
            <a data-pjax="false" id="btnNewPost" href="/admin/article/write">创作</a>
            <ol class="breadcrumb">
                <li><a data-pjax="true" href="/admin"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a data-pjax="true" href="#">文章管理</a></li>
                <li class="active">所有文章</li>
            </ol>
        </section>
        <section class="content container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <ul style="list-style: none;padding-left: 0">
                        <li class="publish">
                            <a data-pjax="true" href="/admin/posts" style="color: #000">已发布<span class="count">(${countAlradyPublishdArticles})</span></a>&nbsp;|&nbsp;
                        </li>
                        <li class="draft">
                            <a data-pjax="true" href="/admin/posts?status=1">草 稿<span class="count">(${countDraftArticles})</span></a>&nbsp;|&nbsp;
                        </li>
                        <li class="trash">
                            <a data-pjax="true" href="/admin/posts?status=2">回收站<span class="count">(${countAlradyDeletedArticles})</span></a>
                        </li>
                    </ul>
                </div>
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover text-center">
                                <thead>
                                <tr>
                                    <th>标题</th>
                                    <th>分类</th>
                                    <th>状态</th>
                                    <th>标签</th>
                                    <th>评论</th>
                                    <th>访问量</th>
                                    <th>创建日期</th>
                                    <th>更新日期</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#if articles??>
                                    <#list articles as article>
                                         <tr>
                                             <td>${article.title}</td>
                                             <td>
                                                         <#switch article.type>
                                                             <#case 0>
                                                        博客
                                                                 <#break>
                                                             <#case 1>
                                                        教程
                                                                 <#break>
                                                             <#case 2>
                                                        读书
                                                                 <#break>
                                                             <#case 3>
                                                        开源项目
                                                                 <#break>
                                                         </#switch>

                                             </td>
                                             <td>
                                                 <#switch article.articleStatus>
                                                     <#case 0>
                                                     <label class="text-green">已发布</label>
                                                         <#break>
                                                     <#case 1>
                                                            草稿
                                                         <#break>
                                                     <#case 2>
                                                        <label class="text-gray">回收站</label>
                                                         <#break>
                                                 </#switch>
                                             </td>
                                             <td>
                                                 <label>${article.tags !}</label>
                                             </td>
                                             <td>
                                             <#--<span class="label" style="background-color: #d6cdcd;">${article.pwebArticleComments.size()}</span>-->
                                             </td>
                                             <td>
                                                 <span class="label" style="background-color: #d6cdcd;">${article.views}</span>
                                             </td>
                                             <td>${article.createTime ! }</td>
                                             <td>${article.lastUpdateTime ! }</td>
                                             <td>
                                                 <a href="/archives/hello-halo" class="btn btn-primary btn-xs " target="_blank">查看</a>
                                                 <a href="/admin/article/findBeforeEdit?articleId=${article.id}" class="btn btn-info btn-xs ">编辑</a>
                                                 <button class="btn btn-danger btn-xs "
                                                         onclick="modelShow('/admin/article/deleteArticle?articleId=${article.id}','确定移到回收站？')">
                                                     删除
                                                 </button>
                                             </td>
                                         </tr>
                                    </#list>
                                </#if>

                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <div class="no-margin pull-left">
                                第1/1页
                            </div>
                            <ul class="pagination no-margin pull-right">
                                <li><a data-pjax="true" class="btn btn-sm disabled" href="/admin/posts?status=0">首页</a>
                                </li>
                                <li><a data-pjax="true" class="btn btn-sm disabled"
                                       href="/admin/posts?status=0&page=-1">上一页</a></li>
                                <li><a data-pjax="true" class="btn btn-sm disabled" href="/admin/posts?status=0&page=1">下一页</a>
                                </li>
                                <li><a data-pjax="true" class="btn btn-sm disabled" href="/admin/posts?page=0&status=0">尾页</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 删除确认弹出层 -->
        <div class="modal fade" id="removePostModal">
            <div class="modal-dialog">
                <div class="modal-content message_align">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">×</span></button>
                        <h4 class="modal-title">提示</h4>
                    </div>
                    <div class="modal-body">
                        <p id="message"></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="url"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a onclick="removeIt()" class="btn btn-danger" data-dismiss="modal">确定</a>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function modelShow(url, message) {
                $('#url').val(url);
                $('#message').html(message);
                $('#removePostModal').modal();
            }

            function removeIt() {
                var url = $.trim($("#url").val());
                $.get(url, function (data) {
                    if (data.status) {
                        //删除成功以后刷新页面
                        window.location.reload();
                    }

                });
            }
        </script>
    </div>
</div>
    <@footer></@footer>
</#compress>