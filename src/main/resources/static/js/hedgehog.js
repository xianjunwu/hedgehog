/**
 * 加载分类
 */
function addCategoryAndActiveOne() {
  $.get("/category/findAllCategory", function (data) {
    if (data.result === 'success') {
      var pathname = location.pathname;
      var categoryPathName = pathname.split("/")[3];
      data.data.forEach(function (value, i) {
        if (categoryPathName === value.path) {
          $("#category").append("<li class='active'><a  href='/article/list/" + value.path + "'>"
              + value.categoryName + "</a></li>");
        }else{
          $("#category").append("<li><a  href='/article/list/" + value.path + "'>"
              + value.categoryName + "</a></li>");
        }
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