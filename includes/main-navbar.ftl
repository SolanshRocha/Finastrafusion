<#if springMacroRequestContext.requestUri?starts_with("/index.html")>
<#include "/includes/navbar/hero.ftl">
<#else>
<#include "/includes/main-navbar.ftl.parent">

</#if>