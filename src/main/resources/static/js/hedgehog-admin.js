/**
 *模块是否是激活
 *
 */
function activeSider() {
  var pathname = location.pathname;
  $("aside section ul li").each(function (index, element) {
    $(element).removeClass("active");
    if ($(element).children("a").attr('href') === pathname) {
      $(this).addClass("active");
    }

  });
}

function queryAllNotice() {
  $.get("/admin/notice/findAllNoticeNeedToDo", function (data) {
    if (data.result === 'success') {
      $("#noticeNumber").text(data.data.length)
    } else {
      console.log("查询消息错误");
    }

  })

}