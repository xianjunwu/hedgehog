<#compress >
    <#include "common/public.ftl">
<#--将页面标题传入-->
    <@header>dengyi.pro | 后台主页</@header>
    <div class="wrapper">
        <!-- 顶部栏模块 -->
        <#include "common/adminHeader.ftl">
        <!-- 菜单栏模块 -->
        <#include "common/adminsSidebar.ftl">
        <div class="content-wrapper">
            <#--导航-->
            <section class="content-header">
                <h1 style="display: inline-block;">仪表盘</h1>
                <ol class="breadcrumb">
                    <li>
                        <a href="/admin"><i class="fa fa-dashboard"></i>首页</a>
                    </li>
                    <li class="active">仪表盘</li>
                </ol>
            </section>
            <#--总览-->
            <section class="content container-fluid">
                <div class="row">
                    <#--贴片选项卡-->
                    <div class="col-lg-3 col-xs-6" id="widgetPostCountBody">
                        <#--文章-->
                        <div class="small-box bg-aqua">
                            <div class="inner"><h3>${articlesNumber}</h3>
                                <p>文章</p></div>
                            <div class="icon"><i class="ion ion-bag"></i></div>
                            <a data-pjax="true" href="/admin/article/page" class="small-box-footer">查看所有<i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <#--评论-->
                    <div class="col-lg-3 col-xs-6" id="widgetCommentCountBody">
                        <div class="small-box bg-green">
                            <div class="inner"><h3>${commentNumber}</h3>
                                <p>评论</p></div>
                            <div class="icon"><i class="ion ion-stats-bars"></i></div>
                            <a data-pjax="true" href="/admin/article/page"
                               class="small-box-footer">查看所有 <i
                                        class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <#--文件-->
                    <div class="col-lg-3 col-xs-6" id="widgetAttachmentCountBody">
                        <div class="small-box bg-yellow">
                            <div class="inner"><h3>0</h3>
                                <p>附件</p></div>
                            <div class="icon"><i class="ion ion-person-add"></i></div>
                            <a href="/admin/article/page" class="small-box-footer">查看所有文件
                                <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <#--成立天数-->
                    <div class="col-lg-3 col-xs-6" id="widgetDayCountBody">
                        <div class="small-box bg-red">
                            <div class="inner"><h3 id="blogStart">${installDays}</h3>
                                <p>成立天数</p></div>
                            <div class="icon"><i class="ion ion-pie-graph"></i></div>
                            <a href="#" class="small-box-footer" data-toggle="modal"
                               data-target="#blogInfo">成立时间:${installDate} <i class="fa fa-star"></i></a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-xs-12" id="widgetPostLastestBody">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">最新文章</h3>
                                <div class="box-tools">
                                    <button type="button" class="btn btn-box-tool"
                                            data-widget="collapse" data-toggle="tooltip"
                                            title="Collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="box-body table-responsive">
                                <table class="table table-bordered table-hover text-center">
                                    <thead>
                                    <tr>
                                        <th width="50%">标题</th>
                                        <th>状态</th>
                                        <th>日期</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if  showArticles??>
                                        <#list showArticles as showArticle>
                                            <tr>
                                                <td>
                                                    <a target="_blank" href="/article/detail/${showArticle.id}">${showArticle.title}</a>
                                                </td>
                                                <td class="text-center">
                                                    <#switch showArticle.articleStatus>
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
                                                <td>${showArticle.lastUpdateTime ! showArticle.createTime}</td>
                                            </tr>
                                        </#list>
                                    </#if>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xs-12" id="widgetCommentLastestBody">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">最新评论</h3>
                                <div class="box-tools">
                                    <button type="button" class="btn btn-box-tool"
                                            data-widget="collapse" data-toggle="tooltip"
                                            title="Collapse">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="box-body table-responsive">
                                <table class="table table-bordered table-hover text-center">
                                    <thead>
                                    <tr>
                                        <th>评论者</th>
                                        <th>评论页面</th>
                                        <th width="30%">内容</th>
                                        <th>状态</th>
                                        <th>日期</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if articleComments??>
                                        <#list articleComments as articleComment>
                                            <tr>
                                                <td>${articleComment.commentAuthor}</td>
                                                <td>
                                                    <a target="_blank"
                                                       href="/archives/200">${articleComment.commentAuthor}</a>
                                                </td>
                                                <td>
                                                    ${articleComment.commentContent}
                                                </td>
                                                <td>
                                                    <span class="label bg-green">已发布</span>
                                                </td>
                                                <td>${articleComment.commentDate}</td>
                                            </tr>
                                        </#list>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xs-12" id="widgetLogsLastestBody">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">最新日志</h3>
                                <div class="box-tools">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-box-tool dropdown-toggle"
                                                data-toggle="dropdown" aria-expanded="false">
                                            <i class="fa fa-bars"></i></button>
                                        <ul class="dropdown-menu pull-right" role="menu">
                                            <li><a href="#" onclick="openAllLogs()">查看所有</a></li>
                                            <li><a href="#" onclick="deleteAllLogs()">清空日志</a></li>
                                        </ul>
                                        <button type="button" class="btn btn-box-tool"
                                                data-widget="collapse" data-toggle="tooltip"
                                                title="Collapse">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="box-body table-responsive">
                                <table class="table table-bordered table-hover text-center">
                                    <thead>
                                    <tr>
                                        <th>事件</th>
                                        <th>结果</th>
                                        <th>IP</th>
                                        <th>日期</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <#if showLogs??>
                                        <#list showLogs as logs>
                                            <tr>
                                                <td>${logs.logTitle}</td>
                                                <td>${logs.logContent}</td>
                                                <td>${logs.logIp}</td>
                                                <td>${logs.logDateTime}</td>
                                            </tr>
                                        </#list>
                                    </#if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <script type="application/javascript">
            function deleteAllLogs() {
                $.ajax({
                    url: '/adminLog/deleteAllLogs',
                    type: 'DELETE',
                    success: function (result) {
                        //删除成功，刷新
                        if (result.status) {
                            window.location.reload();
                        }
                    }
                });
            }

            function openAllLogs() {
                layer.open({
                    type: 2,
                    title: '所有日志',
                    shadeClose: true,
                    shade: 0.5,
                    maxmin: true,
                    area: ['90%', '90%'],
                    content: '/adminLog/getAllLogs',
                    scrollbar: false
                });
            }

            $('#btnWidgetsOption').click(function () {
                $('#widgetOptionsPanel').slideToggle(400);
            });
        </script>
    </div>
    <@footer></@footer>
</#compress>
