<#-- Valine pwebArticleComment -->
<style type="text/css" rel="stylesheet">
    ${pwebOptions.valine_css?if_exists}
</style>
<div id="valine-pwebArticleComment"></div>
<script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
<script src="//unpkg.com/valine/dist/Valine.min.js"></script>
<script>
    var GUEST_INFO = ['nick','mail','link'];
    var guest_info = 'nick,mail,link'.split(',').filter(function(item){
        return GUEST_INFO.indexOf(item) > -1
    });
    var notify = 'true' == true;
    var verify = 'true' == true;
    new Valine({
        el: '#valine-pwebArticleComment',
        notify: notify,
        verify: verify,
        appId: "${pwebOptions.valine_appid?if_exists}",
        appKey: "${pwebOptions.valine_appkey?if_exists}",
        placeholder: "${pwebOptions.valine_placeholder?if_exists}",
        pageSize:'10',
        avatar:'${pwebOptions.valine_avatar?if_exists}',
        lang:'zh-cn'
    });
</script>
