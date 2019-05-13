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
                    <li><a href="#"><i class="icon icon-home"></i></a></li>
                    <li class="active">文章列表</li>
                </ul>
            </div>
            <div class="content-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div id="datagridExample" class="datagrid">
                                <div class="input-control search-box search-box-circle has-icon-left has-icon-right" id="searchboxExample2"
                                     style="margin-bottom: 10px; max-width: 300px">
                                    <input id="inputSearchExample2" type="search" class="form-control search-input" placeholder="搜索">
                                    <label for="inputSearchExample2" class="input-control-icon-left search-icon"><i class="icon icon-search"></i></label>
                                    <a href="#" class="input-control-icon-right search-clear-btn"><i class="icon icon-remove"></i></a>
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
                        {name: 'time', label: '时间', width: 132},
                        {name: 'hera', label: '英雄', width: 134},
                        {name: 'action', label: '动作', width: 109},
                        {name: 'target', label: '目标', width: 109},
                        {name: 'desc', label: '描述', width: 287},
                        {name: 'option', label: '操作', width: 0.75}
                    ],
                    array: [
                        {time: '00:11:12', hero: '幻影刺客', action: '击杀', target: '斧王', desc: '幻影刺客击杀了斧王。'},
                        {time: '00:13:22', hero: '幻影刺客', action: '购买了', target: '隐刀', desc: '幻影刺客购买了隐刀。'},
                        {time: '00:19:36', hero: '斧王', action: '购买了', target: '黑皇杖', desc: '斧王购买了黑皇杖。'},
                        {time: '00:21:43', hero: '力丸', action: '购买了', target: '隐刀', desc: '力丸购买了隐刀。'}
                    ]
                },
                sortable: true,
                states: {
                    pager: {page: 1, recPerPage: 20}
                }
            });
        });

    </script>

    <!-- zui js -->
    <script src="/static/plugins/zui/js/zui.min.js"></script>
    <!-- app js -->
    <script src="/static/js/app.js"></script>
    </body>
    </html>
</#compress>
