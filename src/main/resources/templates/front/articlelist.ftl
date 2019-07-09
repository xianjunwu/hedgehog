<#compress >
<#--引入宏指令-->
    <#include "common/macro.ftl">
<#--调用宏，使用的方法为用at代替#-->
    <@head>文章列表</@head>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="list">
            <#if (articles.data?size>0)>
              <div class="items items-hover">
                  <#list  articles.data as article>
                    <div class="item">
                      <div class="item-heading">
                        <h4>
                            <#if article.isRecommend>
                              <span class="label label-success">推荐</span>
                            </#if>
                          <a href="/article/detail/${article.id}">${article.title}</a>
                        </h4>
                      </div>
                      <div class="item-content">
                        <div class="text ">${article.summary!""}</div>
                      </div>
                      <div class="item-footer">
                          <#if article.allowComment>
                            <a href="#" class="text-muted">
                              <i class="icon-comments"></i> 243</a>
                          </#if>
                          <#if article.updateTime??>
                            <span class="text-muted">${article.updateTime}</span>
                          <#else >
                            <span class="text-muted">${article.createTime}</span>
                          </#if>

                      </div>
                    </div>
                  </#list>
              </div>
                <#if (articles.totalPages>1)>
                  <ul id="myPager" class="pager" data-ride="pager" data-max-nav-count="10"
                      data-page="${articles.pageNumber}" data-rec-total="${articles.totalElements}"
                      data-elements="first_icon,prev_icon,nav,next_icon,last_icon"></ul>
                </#if>
            <#else>
              <div class="alert alert-warning with-icon">
                <i class="icon-frown"></i>
                <div class="content">
                  <span>分类下不存在文章</span>
                </div>
              </div>
            </#if>

        </div>
      </div>
    </div>

  </div>
  <script>
    //监听页码改变
    $('#myPager').on('onPageChange', function (e, state, oldState) {
      if (state.page !== oldState.page) {
        location.href = "/article/list/" + location.pathname.split("/")[3] + "?pageNumber="
            + state.page;
      }
    });

  </script>
    <@foot></@foot>
</#compress>


