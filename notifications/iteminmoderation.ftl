<#import "/macros/email.ftl" as email />

<@email.subject>
    <@trans key="thub.notifications.moderation.title" params=[node.type, site.name] />
</@email.subject>

<@email.html>

    <#assign nodeLink><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;margin-top:10px;" href="<@url obj=node abs=true/>"><i>${safeInput(node.originalParent.title)}</i></a></#assign>

    <#assign authorLink><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url obj=node.author abs=true />">${safeInput(userUtils.displayName(node.author))}</a></#assign>

    <#assign modQueueLink><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url name="moderation:list"/>"><@trans key="thub.notifications.moderation.description.here" /></a></#assign>

    <#if node.type == 'question'>
    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.notifications.moderation.description.question" params=[nodeLink?trim, authorLink?trim, modQueueLink?trim] /></p>
    <#elseif node == node.originalParent>
    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.notifications.moderation.description.node" params=[node.type, nodeLink?trim, authorLink?trim, modQueueLink?trim] /></p>
    <#else>
    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.notifications.moderation.description" params=[node.type, authorLink?trim, nodeLink?trim, modQueueLink?trim] /></p>
    </#if>

    <div style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:12px;margin-top:10px;width:575px;overflow:hidden;"><blockquote><i>${safeInput(node.asHTML())}</i></blockquote> </div>

    <p style="text-decoration:none; text-align:center; /*background:#dfeaf4;*/ background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin:10px auto 0px auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url name="moderation:list"/>"><@trans key="thub.notifications.moderation.linkText" /></a></p>

</@email.html>


<@email.text>

    <@trans key="thub.notifications.moderation.description.text" params=[node.type, userUtils.displayName(node.author), safeInput(node.originalParent.title)] />

    ${safeInput(node.asHTML())}

    <@trans key="thub.notifications.clickToLook" params=[node.type] />: <@url obj=node abs=true/>
</@email.text>