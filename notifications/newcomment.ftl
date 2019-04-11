<#import "/macros/email.ftl" as email />

<@email.subject>
<@trans key="thub.notifications.newcomment.title" params=[site.name, userUtils.displayName(comment.author), comment.originalParent.title] />
</@email.subject>

<@email.html>

    <#assign commentLink><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;margin-top:10px" href="<@url obj=comment abs=true/>"><i>${safeInput(comment.originalParent.title)}</i></a></#assign>

    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.notifications.newcomment.description" params=[commentLink, userUtils.displayName(comment.author), site.name, comment.parent.type] />:</p>

    <div style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:12px;margin-top:10px; width: 575px; overflow: hidden;"> <blockquote><i>${safeInput(comment.asHTML())}</i></blockquote> </div>

    <p style="text-decoration:none; text-align:center; /*background:#dfeaf4;*/ background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin:10px auto 0px auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url obj=comment abs=true/>">
        <@trans key="thub.notifications.newcomment.linkTitle" params=[userUtils.displayName(comment.author)] />
    </a></p>

</@email.html>

<@email.text>

    <@trans key="thub.notifications.newcomment.description" params=[safeInput(comment.originalParent.title), userUtils.displayName(comment.author), site.name] />:

     ${safeInput(comment.body!"")}

    <@trans key="thub.notifications.clickToLook" params=[comment.type] />: <@url obj=comment abs=true/>

</@email.text>