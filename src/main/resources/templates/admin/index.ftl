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
    <!-- zui js -->
    <script src="/static/plugins/zui/js/zui.min.js"></script>
    <script src="/static/plugins/zui/lib/calendar/zui.calendar.min.js"></script>
    <!-- app js -->
    <script src="/static/js/app.js"></script>
    <script src="/static/js/hedgehog-admin.js"></script>
    <link rel="stylesheet" href="/static/plugins/zui/lib/calendar/zui.calendar.min.css">
      <#--时间选择器-->
    <link rel="stylesheet" href="/static/plugins/zui/lib/datetimepicker/datetimepicker.min.css">
    <script src="/static/plugins/zui/lib/datetimepicker/datetimepicker.min.js"></script>
      <#--颜色选择器-->
    <link rel="stylesheet" href="/static/plugins/zui/lib/colorpicker/zui.colorpicker.min.css">
    <script src="/static/plugins/zui/lib/colorpicker/zui.colorpicker.js"></script>
    <!-- zui css -->
    <link rel="stylesheet" href="/static/plugins/zui/css/zui.min.css">
    <link rel="stylesheet" href="/static/theme/blue.css">
    <!-- app css -->
    <link rel="stylesheet" href="/static/css/app.css">


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
          <li class="active">仪表盘</li>
        </ul>
      </div>
      <div class="content-body">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-2 col-sm-6 col-xs-12">
              <div class="info-box bg-info" onclick="location.href='/admin/article/list' ">
                <div class="info-box-icon">
                  <i class="icon icon-file-text"></i>
                </div>
                <div class="info-box-content">
                  <span class="info-box-text">文章总量</span>
                  <span class="info-box-number">${articleNumber}
                                        <small>篇</small>
                                    </span>
                </div>
              </div>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-12">
              <div class="info-box bg-primary" onclick="location.href='/admin/comment' ">
                <div class="info-box-icon">
                  <i class="icon icon-user"></i>
                </div>
                <div class="info-box-content">
                  <span class="info-box-text">评论总量</span>
                  <span class="info-box-number">${commontNumber}
                                        <small>条</small>
                                    </span>
                </div>
              </div>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-12">
              <div class="info-box bg-warning" onclick="location.href='/admin/category' ">
                <div class="info-box-icon">
                  <i class="icon icon-bars"></i>
                </div>
                <div class="info-box-content">
                  <span class="info-box-text">栏目总量</span>
                  <span class="info-box-number">${categoryNumber}
                                        <small>个</small>
                                    </span>
                </div>
              </div>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-12">
              <div class="info-box bg-green">
                <div class="info-box-icon">
                  <i class="icon icon-eye-open"></i>
                </div>
                <div class="info-box-content">
                  <span class="info-box-text">PV总量</span>
                  <span class="info-box-number">${pvNum}
                                        <small>次</small>
                                    </span>
                </div>
              </div>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-12">
              <div class="info-box bg-danger">
                <div class="info-box-icon">
                  <i class="icon icon-time"></i>
                </div>
                <div class="info-box-content">
                  <span class="info-box-text">异常日志数</span>
                  <span class="info-box-number">${logNum}
                                        <small>条</small>
                                    </span>
                </div>
              </div>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-12">
              <div class="info-box bg-default">
                <div class="info-box-icon">
                  <i class="icon icon-time"></i>
                </div>
                <div class="info-box-content">
                  <span class="info-box-text">系统运行天数</span>
                  <span class="info-box-number">${days}
                                        <small>天</small>
                                    </span>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-12">
              <!-- HTML 代码 -->
              <div class="btn-group pull-right">
                <button class="btn btn-primary" data-toggle="modal" data-target="#addModal">添加事件
                </button>
                <button class="btn btn-danger ">删除事件</button>
              </div>
              <div class="modal fade" id="addModal">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">添加事件</h4>
                    </div>
                    <div class="modal-body">
                      <form class="form-horizontal">
                        <div class="form-group">
                          <label for="title" class="col-sm-2">事件标题</label>
                          <div class="col-md-6 col-sm-10">
                            <input type="text" name="title" autocomplete="off" class="form-control"
                                   required
                                   id="title">
                          </div>
                        </div>
                        <div class="form-group">
                          <label for="calendarDesc" class="col-sm-2">事件描述</label>
                          <div class="col-md-6 col-sm-10">
                            <input type="text" name="calendarDesc" autocomplete="off"
                                   class="form-control" required
                                   id="calendarDesc">
                          </div>
                        </div>
                        <div class="form-group">
                          <label for="start" class="col-sm-2">开始日期</label>
                          <div class="col-sm-3">
                            <input type="text" id="start" name="start" required
                                   class="form-control form-date"
                                   placeholder="请选择开始时间">
                          </div>
                          <label for="endTime" class="col-sm-2">结束日期</label>
                          <div class="col-sm-3">
                            <input type="text" id="end" name="end" required
                                   class="form-control form-date"
                                   placeholder="请选择结束时间">
                          </div>
                        </div>
                          <#--  <div class="form-group">
                              <label for="myColor3" class="col-sm-2">事件颜色</label>
                              <div class="col-sm-3">
                                <div class="input-group">
                                  <input type="text" class="form-control" id="myColor3" name="myColor3"
                                         data-provide="colorpicker" data-wrapper="input-group-btn"
                                         data-pull-menu-right="true" value="#3280fC"
                                         placeholder="请输入16进制颜色值，例如 #FF00DD">
                                </div>
                              </div>
                            </div>-->
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal"
                                  onclick="clearModel('addModal')">关闭
                          </button>
                          <button type="button" class="btn btn-primary"
                                  onclick="saveCalendarEvent()">保存
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>

              <div id="calendar" class="calendar"></div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <div class="panel">
                <div class="panel-heading">
                  <div class="panel-title">产品信息</div>
                </div>
                <div class="panel-body">
                  <table class="table table-info">
                    <tr>
                      <td>产品名称</td>
                      <td>hedgehog(刺猬)</td>
                    </tr>
                    <tr>
                      <td>核心框架</td>
                      <td>zui bootstrap springboot springdatajpa solr mysql</td>
                    </tr>
                    <tr>
                      <td>开发作者</td>
                      <td>大熊</td>
                    </tr>
                    <tr>
                      <td>联系方式</td>
                      <td>
                        <a class="icon icon-envelope" href="mailto:dengyi@dengyi.pro">
                          dengyi@dengyi.pro
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td>交流讨论</td>
                      <td><a target="_blank"
                             href="http://shang.qq.com/wpa/qunwpa?idkey=65deab2f8ea1e9d2445c3262d133da48fe9de53bd90a3146c3f7bb6fb9d63ead"><img
                              border="0" src="http://pub.idqqimg.com/wpa/images/group.png"
                              alt="zui-admin后台模板交流"
                              title="zui-admin后台模板交流"></a></td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="panel">
                <div class="panel-heading">
                  <div class="panel-title">服务器信息</div>
                </div>
                <div class="panel-body">
                  <table class="table table-info">
                    <tr>
                      <td>操作系统</td>
                      <td>${systemInfo.systemType}</td>
                    </tr>
                    <tr>
                      <td>JDK版本</td>
                      <td>${systemInfo.javaVersion}</td>
                    </tr>
                    <tr>
                      <td>容器类型</td>
                      <td>${systemInfo.containerTypeAndVersion}</td>
                    </tr>
                    <tr>
                      <td>数据库类型</td>
                      <td>${systemInfo.databaseTypeAndVersion}</td>
                    </tr>
                    <tr>
                      <td>系统时间</td>
                      <td>${systemInfo.systemTime}</td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    $(function () {
      activeSider();
      queryAllNotice();
      addAllEvents();

    });
    //初始化日历
    $('#calendar').calendar({
      clickEvent: function (event) {
        // console.log(event);
      }, change: function (event) {
        var change = event.changes[0];
        var changedEventInCalendar = change.event;
        var changedStartTime = changedEventInCalendar.start;
        var formatedChangedStartTime = myFormatTime(changedStartTime);
        //日期计算问题
        var changedEndTime = new Date(changedStartTime).addDays(changedEventInCalendar.days - 1);
        var formatedChangedEndTime = myFormatTime(changedEndTime);
        changedEventInCalendar.start = formatedChangedStartTime;
        changedEventInCalendar.end = formatedChangedEndTime;
        $.post("/admin/calendar/saveOrUpdateEvent", changedEventInCalendar, function (data) {
          if (data.result === 'success') {
            //防止出现异常重新加载日历
            var calendar = $('#calendar').data('zui.calendar');
            calendar.resetData({
              events: []
            });
            //重新查询数据进行新增
            addAllEvents();
          }
        });
      },
      //点击事件添加
      clickCell: function (event) {
        var calendarStartDate = myFormatTime(event.date);
        $("#start").val(calendarStartDate);
        $('#addModal').modal()
      }
    });

    //格式化时间
    function myFormatTime(time) {
      if (time !== undefined) {
        var fullYear = time.getFullYear();
        var month = time.getMonth() + 1;
        if (month < 10) {
          month = "0" + month
        }
        var date = time.getDate();
        if (date < 10) {
          date = "0" + date
        }
        return fullYear + "-" + month + "-" + date;
      }

    }

    //更新所有日历上的事件
    function addAllEvents() {
      $.get("/admin/calendar/getAllEvents", function (data) {
        if (data.result === "success") {
          //更新日历事件
          var calendar = $('#calendar').data('zui.calendar');
          var newEvents = data.data;
          calendar.addEvents(newEvents);
        }
      })
    }

    //新增一个事件到日历
    function addOneEventToCalendar(cevent) {
      var calendar = $('#calendar').data('zui.calendar');
      calendar.addEvents(cevent);
    }

    //初始化时间选择器
    // 仅选择日期
    $("#start").datetimepicker(
        {
          language: "zh-CN",
          weekStart: 1,
          todayBtn: 1,
          autoclose: 1,
          todayHighlight: 1,
          startView: 2,
          minView: 2,
          forceParse: 0,
          format: "yyyy-mm-dd"
        });
    $("#end").datetimepicker(
        {
          language: "zh-CN",
          weekStart: 1,
          todayBtn: 1,
          autoclose: 1,
          todayHighlight: 1,
          startView: 2,
          minView: 2,
          forceParse: 0,
          format: "yyyy-mm-dd"
        });

    function saveCalendarEvent() {
      $.post("/admin/calendar/saveOrUpdateEvent", {
        title: $("#title").val(),
        calendarDesc: $("#calendarDesc").val(),
        allDay: true,
        start: $("#start").val(),
        end: $("#end").val()
      }, function (data) {
        if (data.result === 'success') {
          addOneEventToCalendar(data.data);
          $('#addModal').modal('hide');
          clearModel("addModel");

        }
      })
    }


  </script>
  </body>
  </html>
</#compress>
