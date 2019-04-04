<#import "/spring.ftl" as spring />
<#import "/macros/thub.ftl" as teamhub />
<#import "/macros/security.ftl" as security />

<html>

<#if springMacroRequestContext.requestUri?starts_with("/index.html")>
<#include "/includes/blocks.ftl">
<#else>
<#include "/nodes/list.ftl.parent">

</#if>
</html>