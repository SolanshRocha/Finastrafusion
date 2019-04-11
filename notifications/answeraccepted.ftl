<#import "/macros/email.ftl" as email />

<@email.subject>
<@trans key="thub.notifications.answeraccepted.title" default='{1} accepted {2}\'s answer to {3}' params=[site.name, userUtils.displayName(action.user), userUtils.displayName(answer.author), safeInput(answer.originalParent.title)] />
</@email.subject>

<@email.html>
    <#assign questionLink><i><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url obj=answer abs=true/>">${safeInput(answer.originalParent.title)}</a></i></#assign>
    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.notifications.answeraccepted.description" params=[userUtils.displayName(action.user), userUtils.displayName(answer.author), questionLink] />:</p>
    <div style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:12px;margin-top:10px;width:575px;overflow:hidden;"><i><blockquote>${safeInput(answer.asHTML())}</blockquote></i></div>
    <p style="text-decoration:none; text-align:center; /*background:#dfeaf4;*/ background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin: 10px auto 0px auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url obj=answer abs=true/>"><@trans key="thub.notifications.answeraccepted.linkTitle" params=[userUtils.displayName(answer.author)] /></a></p>
</@email.html>


<@email.text>
<@trans key="thub.notifications.answeraccepted.description.text" params=[userUtils.displayName(action.user), userUtils.displayName(answer.author), safeInput(answer.originalParent.title)] />

<@trans key="thub.notifications.clickToLook" params=[answer.type] />: <@url obj=answer abs=true/>
</@email.text>