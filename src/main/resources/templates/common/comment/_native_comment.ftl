<@compress single_line=true>
<link type="text/css" rel="stylesheet" href="/static/plugins/OwO/OwO.min.css">
<link type="text/css" rel="stylesheet" href="/static/css/pwebArticleComment.css">
<style>
${pwebOptions.native_css?if_exists}
</style>
<div class="native-pwebArticleComment">
    <div class="pwebArticleComment-avatar">
        <img src="//gravatar.loli.net/avatar/none?s=256&d=${pwebOptions.native_comment_avatar?default('mm')}" height="48" width="48" class="pwebArticleComment-author-avatar">
    </div>
    <div class="native-wrap">
        <div class="pwebArticleComment-header">
            <input type="hidden" name="postId" value="${post.postId?c}">
            <input type="hidden" name="commentParent" id="commentParent" value="0">
            <input type="text" class="pwebArticleComment-input pwebArticleComment-input-who" name="commentAuthor" id="commentAuthor" placeholder="昵称(必填)">
            <input type="text" class="pwebArticleComment-input pwebArticleComment-input-email" name="commentAuthorEmail" id="commentAuthorEmail" onblur="loadAvatar()" placeholder="邮箱(选填)">
            <input type="text" class="pwebArticleComment-input pwebArticleComment-input-website" name="commentAuthorUrl" id="commentAuthorUrl" placeholder="网址(选填)">
        </div>
        <div class="pwebArticleComment-content">
            <textarea class="pwebArticleComment-input-content" name="commentContent" id="commentContent"
                      placeholder="${pwebOptions.native_comment_placeholder?default('赶快评论一个吧！')}"></textarea>
            <div class="OwO"></div>
        </div>
        <div class="pwebArticleComment-footer">
            <button type="button" class="pwebArticleComment-submit" id="btn-push">提交</button>
        </div>
    </div>
    <div class="native-message" style="text-align: center;padding: 20px;display: none"></div>
    <div class="native-info">
        <span id="native-info-total" style="font-weight: 600">${commentsCount?default(0)}</span>评论
    </div>
    <#macro pwebArticleComments pwebArticleComments>
        <ul class="native-list" style="margin-left: 30px; border-left: 1px solid #f1f1f1">
        <#if pwebArticleComments?? && pwebArticleComments?size gt 0>
            <#list pwebArticleComments?sort_by("commentDate") as pwebArticleComment>
                <li class="native-list-one" id="pwebArticleComment-id-${pwebArticleComment.commentId?c}" style="margin-left: 5px;">
                    <img class="native-list-one-img" style="width: 2rem;height: 2rem;" src="//gravatar.loli.net/avatar/${pwebArticleComment.commentAuthorAvatarMd5?if_exists}?s=256&d=${pwebOptions.native_comment_avatar?default('mm')}">
                    <section>
                        <div class="native-list-one-head">
                            <a class="native-list-one-head-name" rel="nofollow" href="${pwebArticleComment.commentAuthorUrl?if_exists}">${pwebArticleComment.commentAuthor?if_exists}</a>
                            <span class="native-pwebArticleComment-ua-info" style="display: none">${pwebArticleComment.commentAgent?if_exists}</span>
                            <#if pwebArticleComment.isAdmin==1>
                                <label class="native-list-one-head-admin">博主</label>
                            </#if>
                        </div>
                        <div class="native-list-one-content">
                            <p>${pwebArticleComment.commentContent?if_exists}</p>
                        </div>
                        <div class="native-list-one-footer">
                            <span class="native-list-one-footer-time">${pwebArticleComment.commentDate?string("yyyy-MM-dd HH:mm")}</span>
                            <span at="${pwebArticleComment.commentId?c}" class="native-list-one-footer-reback">回复</span>
                        </div>
                    </section>
                <#if pwebArticleComment.childComments?? && pwebArticleComment.childComments?size gt 0>
                    <@childComments pwebArticleComment.childComments></@childComments>
                </#if>
                </li>
            </#list>
        </#if>
        </ul>
    </#macro>
    <ul class="native-list" id="pwebArticleComments-list">
        <#if pwebArticleComments?? && pwebArticleComments.getPageList()?size gt 0>
            <#list pwebArticleComments.getPageList()?sort_by("commentDate")?reverse as pwebArticleComment>
                <li class="native-list-one" id="pwebArticleComment-id-${pwebArticleComment.commentId?c}">
                    <img class="native-list-one-img" src="//gravatar.loli.net/avatar/${pwebArticleComment.commentAuthorAvatarMd5?if_exists}?s=256&d=${pwebOptions.native_comment_avatar?default('mm')}">
                    <section>
                        <div class="native-list-one-head">
                            <a class="native-list-one-head-name" rel="nofollow" href="${pwebArticleComment.commentAuthorUrl?if_exists}">${pwebArticleComment.commentAuthor?if_exists}</a>
                            <span class="native-pwebArticleComment-ua-info" style="display: none">${pwebArticleComment.commentAgent?if_exists}</span>
                            <#if pwebArticleComment.isAdmin==1>
                                <label class="native-list-one-head-admin">博主</label>
                            </#if>
                        </div>
                        <div class="native-list-one-content">
                            <p>${pwebArticleComment.commentContent?if_exists}</p>
                        </div>
                        <div class="native-list-one-footer">
                            <span class="native-list-one-footer-time">${pwebArticleComment.commentDate?string("yyyy-MM-dd HH:mm")}</span>
                            <span at="${pwebArticleComment.commentId?c}" class="native-list-one-footer-reback">回复</span>
                        </div>
                    </section>
                <#if pwebArticleComment.childComments?? && pwebArticleComment.childComments?size gt 0>
                    <@childComments pwebArticleComment.childComments></@childComments>
                </#if>
                </li>
            </#list>
        </#if>
    </ul>
    <div class="native-nav" id="pwebArticleComment-nav">
        <#if pwebArticleComments.totalPage gt 1>
            <ol class="page-nav">
                <#if pwebArticleComments.hasPrevious>
                <li>
                    <a href="?cp=${pwebArticleComments.nowPage-1}#pwebArticleComments-list" title="上一页">←</a>
                </li>
                </#if>
                <li>
                    <#list rainbow as r>
                        <#if r == pwebArticleComments.nowPage>
                            <a href="?cp=${pwebArticleComments.nowPage}#pwebArticleComments-list" style="color: red;">${r}</a>
                        <#else>
                            <a href="?cp=${r}#pwebArticleComments-list">${r}</a>
                        </#if>
                    </#list>
                </li>
                <#if pwebArticleComments.hasNext>
                <li>
                    <a href="?cp=${pwebArticleComments.nowPage+1}#pwebArticleComments-list" title="下一页">→</a>
                </li>
                </#if>
            </ol>
        </#if>
    </div>
</div>
<script src="/static/plugins/jquery/jquery.min.js"></script>
<script src="/static/plugins/md5/md5.min.js"></script>
<script src="/static/plugins/ua-parser/ua-parser.min.js"></script>
<script src="/static/plugins/OwO/OwO.min.js"></script>
<script>
    var s = new OwO({
        logo: 'OωO表情',
        container: document.getElementsByClassName('OwO')[0],
        target: document.getElementsByClassName('pwebArticleComment-input-content')[0],
        position: 'down',
        width: '100%',
        maxHeight: '210px',
        api:"/static/plugins/OwO/OwO.min.json"
    });
    $(document).ready(function () {
        $(".native-list-one-head").each(function (i) {
            var uaInfo = $(this).children(".native-pwebArticleComment-ua-info").html();
            $(this).append(show_ua(uaInfo));
        });
        $("#commentAuthor").val(localStorage.getItem("author"));
        $("#commentAuthorEmail").val(localStorage.getItem("email"));
        $("#commentAuthorUrl").val(localStorage.getItem("url"));
        loadAvatar();
    });
    $('#btn-push').click(function () {
        var author = $("#commentAuthor");
        var content = $("#commentContent");
        var email = $("#commentAuthorEmail");
        var url = $("#commentAuthorUrl");
        if (author.val() == '' || content.val() == '') {
            $(".native-message").html("<span style='color:red'>请输入必填项！</span>");
            $(".native-message").fadeIn(1000);
            setTimeout(function () {
                $(".native-message").fadeOut(1000);
            },1500);
            return;
        }
        $(this).attr("disabled","disabled");
        $(this).html("提交中...");
        $.ajax({
            type: 'POST',
            url: '/newComment',
            async: false,
            data: {
                'postId': $('input[name=postId]').val(),
                'commentContent': $('textarea[name=commentContent]').val(),
                'commentAuthor': $('input[name=commentAuthor]').val(),
                'commentAuthorEmail': $('input[name=commentAuthorEmail]').val(),
                'commentAuthorUrl': $('input[name=commentAuthorUrl]').val(),
                'commentAgent': navigator.userAgent,
                'commentParent': $('input[name=commentParent]').val()
            },
            success: function (data) {
                localStorage.setItem('author', author.val());
                localStorage.setItem('email', email.val());
                localStorage.setItem('url', url.val());
                if(data.code==1){
                    $('.pwebArticleComment-input-content').val("");
                    $(".native-message").html("<span>"+data.msg+"</span>");
                }else{
                    $(".native-message").html("<span style='color:red'>"+data.msg+"</span>");
                }
                $(".native-message").fadeIn(1000);
                setTimeout(function () {
                    $(".native-message").fadeOut(1000);
                    $("#btn-push").removeAttr("disabled");
                    $("#btn-push").html("提交");
                    window.location.reload();
                },1500);
            }
        });
    });
    $('.native-list-one-footer-reback').click(function () {
        var at = $(this).attr("at");
        var commentParentAuthor = $('#pwebArticleComment-id-'+at).find(".native-list-one-head-name").html();
        $('#commentParent').val(at);
        $('#commentContent').val("@"+commentParentAuthor+": ");
        $('#commentContent').focus();
    });
    function loadAvatar() {
        $(".pwebArticleComment-author-avatar").attr("src","//gravatar.loli.net/avatar/"+md5(localStorage.getItem("email"))+"?s=256&d=${pwebOptions.native_comment_avatar?default('mm')}");
        if($('input[name=commentAuthorEmail]').val()!='' && $('input[name=commentAuthorEmail]').val()!=null){
            $(".pwebArticleComment-author-avatar").attr("src","//gravatar.loli.net/avatar/"+md5($('input[name=commentAuthorEmail]').val())+"?s=256&d=${pwebOptions.native_comment_avatar?default('mm')}");
        }
    }
    var parser = new UAParser();
    function show_ua(string){
        parser.setUA(string);
        var uua = parser.getResult();
        if(uua.os.version=='x86_64') {
            uua.os.version = 'x64';
        }
        var browser = uua.browser.name+' '+uua.browser.version;
        var os = uua.os.name + ' ' + uua.os.version;
        return '<span class="ua">'+browser+'</span><span class="ua">'+os+'</span>';
    }
</script>
</@compress>
