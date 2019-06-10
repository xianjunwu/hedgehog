/**
 * 加载分类
 */
function addCategory() {
  $.get("/category/findAllCategory", function (data) {
    if (data.result === 'success') {
      data.data.forEach(function (value, i) {
        $("#category").append("<li><a href='/article/list/" + value.path + "'>"
            + value.categoryName + "</a></li>");
      });
    } else {
      console.log("查询分类失败");
    }
  })
}

/**
 *判断搜索框是否需要加载到header上
 *
 */
function headerSearchFormCanshow() {
  if (location.pathname === '/') {
    $("#headerSearchForm").addClass("hidden");
  } else {
    $("#headerSearchForm").removeClass("hidden");
  }

}