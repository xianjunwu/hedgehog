<#compress >
    <#include "common/public.ftl">
    <@header>${article.title}</@header>
    <@footer></@footer>
<div class="main">

    <div class="row">
        <div class="col-md-12">
               <#include "common/head.ftl">
        </div>
    </div>

<#--文章列表-->
    <div class="autopagerize_page_element">
        <div class="content">
            <div class="post animated fadeInDown">
                <div class="post-title">
                    <h3>
                        <a href="/archives/hello-halo">hello world</a>
                    </h3>
                </div>
                <div class="post-content">
                    <div class="p_part">
                        <p>欢迎使用Halo进行创作，删除这篇文章后赶紧开始吧。...</p>
                    </div>
                    <div class="p_part">
                        <p></p>
                    </div>
                </div>
                <div class="post-footer">
                    <div class="meta">
                        <div class="info">
                            <i class="fa fa-sun-o"></i>
                            <span class="date">2018-09-19</span>
                            <i class="fa fa-pwebArticleComment-o"></i>
                            <a href="/archives/hello-halo#comment_widget">Comments</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/templates/front/source/js/jquery.min.js"></script>
<script type="text/javascript">
    var url = location.href;
    var urlstatus = false;
    $(".nav li a").each(function () {
        if ((url + '/').indexOf($(this).attr('href')) > -1 && $(this).attr('href') != '/') {
            $(this).addClass('current');
            urlstatus = true;
        } else {
            $(this).removeClass('current');
        }
    });
    if (!urlstatus) {
        $(".nav li a").eq(0).addClass('current');
    }

</script>

</body>
</html>

</#compress>
