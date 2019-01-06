<#ftl strip_whitespace=true>

<#-- 统计代码 -->
<#macro statistics>
    ${pwebOptions.statistics_code?if_exists}
</#macro>

<#-- 页脚信息 -->
<#macro footer_info>
    ${pwebOptions.blog_footer_info?if_exists}
</#macro>

<#-- favicon -->
<#macro favicon>
    <#if pwebOptions.blog_favicon??>
        <link rel="shortcut icon" type="images/x-icon" href="${pwebOptions.blog_favicon}">
    </#if>
</#macro>

<#-- 站点验证代码 -->
<#macro verification>
    <#if pwebOptions.blog_verification_google??>
        <meta name="google-site-verification" content="${pwebOptions.blog_verification_google}" />
    </#if>
    <#if pwebOptions.blog_verification_bing??>
        <meta name="msvalidate.01" content="${pwebOptions.blog_verification_bing}" />
    </#if>
    <#if pwebOptions.blog_verification_baidu??>
        <meta name="baidu-site-verification" content="${pwebOptions.blog_verification_baidu}" />
    </#if>
    <#if pwebOptions.blog_verification_qihu??>
        <meta name="360-site-verification" content="${pwebOptions.blog_verification_qihu}" />
    </#if>
</#macro>
