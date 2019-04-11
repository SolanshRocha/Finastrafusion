<#import "/macros/email.ftl" as email />

<@email.subject>
    <@trans key="thub.notifications.askToAnswer.title" params=[site.name, userUtils.displayName(user), safeInput(question.title)] />
</@email.subject>

<@email.html>

    <#assign questionLink><i><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url obj=question abs=true/>">${safeInput(question.title)}</a></i></#assign>

        <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.notifications.askToAnswer.description" params=[userUtils.displayName(user), questionLink] /></p>
        <#if message??><div style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:12px;margin-top:10px;"><blockquote><i>${safeInput(message)}</i></blockquote></div></#if>

<p style="text-decoration:none; text-align:center; /*background:#dfeaf4;*/ background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin-top:10px; margin-left: auto; margin-right: auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url obj=question abs=true />"><@trans key="thub.notifications.askToAnswer.clickHere" params=[userUtils.displayName(user)] /></a></p>

</@email.html>


<@email.text>
<@trans key="thub.notifications.askToAnswer.description" params=[userUtils.displayName(user), safeInput(question.title)] />
<#if message??>
${safeInput(message)}
</#if>

<@trans key="thub.notifications.clickToLook" params=[question.type] />: <@url obj=question abs=true />
</@email.text>