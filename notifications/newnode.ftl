<#import "/macros/email.ftl" as email />

<@email.subject>
    <@trans key=".notifications.new${node.type}.title" params=[site.name, userUtils.displayName(node.author), safeInput(node.title)] />
</@email.subject>

<@email.html>

    <#assign nodeLink><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url name="content:view" type=node.type node=node plug=node.plug abs=true />"><i>${safeInput(node.title)}</i></a></#assign>

<p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key=".notifications.${node.type}.description" params=[nodeLink, userUtils.displayName(node.author), site.name] /></p>

<div style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:12px;margin-top:10px; width: 575px; overflow: hidden;"> <blockquote><i>${safeInput(node.asHTML())}</i></blockquote></div>

<p style="text-decoration:none; text-align:center; /*background:#dfeaf4;*/ background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin:10px auto 0px auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url name="content:view" type=node.type node=node plug=node.plug abs=true />"><@trans key=".notifications.new${node.type}.clickHere" params=[userUtils.displayName(node.author)] /></a></p>

</@email.html>

<@email.text>

    <@trans key=".notifications.${node.type}.description" params=[safeInput(node.title), userUtils.displayName(node.author), site.name] />

    <@trans key=".notifications.new${node.type}.clickHere" params=[userUtils.displayName(node.author)] />:
    <@url name="content:view" type=node.type node=node plug=node.plug abs=true />

</@email.text>