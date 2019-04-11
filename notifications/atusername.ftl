<#import "/macros/email.ftl" as email />

<@email.subject>
    <@trans key="thub.notifications.mention.title" params=[node.type, site.name, userUtils.displayName(action.user)] />
</@email.subject>

<@email.html>

    <#assign nodeLink><i><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url obj=node abs=true/>">${safeInput(node.originalParent.title)}</a></i></#assign>

    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.notifications.mention.description" params=[userUtils.displayName(action.user)?html, node.type, nodeLink, site.name] />:</p>

    <div style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:12px;margin-top:10px;"><blockquote><i>${safeInput(node.asHTML())}</i></blockquote></div>

    <p style="text-decoration:none; text-align:center; /*background:#dfeaf4;*/ background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin-top:10px; margin-left: auto; margin-right: auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url obj=node abs=true />"><@trans key="thub.notifications.clickToLook" params=[node.type] /></a></p>
</@email.html>


<@email.text>
    <@trans key="thub.notifications.mention.description.text" params=[userUtils.displayName(action.user)?html, node.type,
            safeInput(node.originalParent.title), site.name] />

    <@trans key="thub.notifications.clickToLook" params=[node.type] />: <@url obj=node abs=true/>
</@email.text>