<#import "/macros/email.ftl" as email />

<@email.subject>
    <@trans key=".notifications.mail.new${reply.type}.subject" params=[site.name, userUtils.displayName(reply.author), safeInput(node.title)] />
</@email.subject>

<@email.html>

    <#assign replyLink><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;margin-top:10px;" href="<@url obj=reply abs=true/>"><i>${safeInput(node.title)}</i></a></#assign>

<p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key=".notifications.new${reply.type}.description" params=[replyLink, userUtils.displayName(reply.author), site.name] />:</p>

<div style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:12px;margin-top:10px; width: 575px; overflow: hidden;"> <blockquote><i>${safeInput(reply.asHTML())}</i></blockquote></div>

<p style="text-decoration:none; text-align:center; /*background:#dfeaf4;*/ background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin:10px auto 0px auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url obj=reply abs=true/>"><@trans key=".notifications.new${reply.type}.linkTitle" params=[userUtils.displayName(reply.author)] /></a></p>

</@email.html>

<@email.text>

    <@trans key=".notifications.new${reply.type}.description" params=[safeInput(node.title), userUtils.displayName(reply.author), site.name] />:

${safeInput(reply.body!"")}

    <@trans key=".notifications.mail.new${reply.type}.view" params=[userUtils.displayName(reply.author)]/>: <@url name="content:view" type=reply.type node=reply plug=reply.plug abs=true/>

</@email.text>