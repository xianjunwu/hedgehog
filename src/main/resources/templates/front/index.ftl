<#compress >
<#--引入宏指令-->
    <#include "common/macro.ftl">
<#--调用宏，使用的方法为用at代替#-->
    <@head>首页</@head>
  <div class="indexCenter">
    <div class="text-center">
      <img src="/static/logo.jpg" width="200px" height="200px" class="img-circle"
           alt="圆形图片">
    </div>
    <div class="text-center" style="margin: 20px">
    <span class="text-gray text-ellipsis"
          style="font-size: 20px">${(siteInfo.slogen)!'好好学习，天天向上'}</span>
    </div>
    <div style="margin: 40px" class="hidden-xs">
      <form action="/search" method="get">
        <div class="input-control search-box search-box-circle has-icon-left has-icon-right"
             id="searchboxExample">
          <input id="inputSearchExample1" type="search" name="key"
                 class="form-control search-input " required>
          <label for="inputSearchExample1" class="input-control-icon-left search-icon"><i
                class="icon icon-search"></i></label>
        </div>
          <#--      <button class="btn btn-success">搜索</button>-->
      </form>
    </div>
  </div>
  <footer class="footer">
    <div class="text-center">
      <span>${(siteInfo.copyright)!'Copyright © 2019-2019 hedgehog  All Rights Reserved. 备案号：浙ICP备17049324号-1'}</span>
    </div>
  </footer>
    <@foot></@foot>
</#compress>
