<#import "/macros/email.ftl" as email />

<@email.subject>
    <@trans key="thub.notifications.userjoins.title" params=[site.name] />
</@email.subject>

<@email.html>

    <#assign userLink><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;margin-top:10px;" href="<@url obj=newUser abs=true/>"><i>${userUtils.displayName(newUser)}</i></a></#assign>

    <p style="margin-left:25px;color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.notifications.userjoins.description" params=[site.name, userLink] /></p>

    <p style="text-decoration:none; text-align:center; background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin:10px auto 0px auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url obj=newUser abs=true/>"><@trans key="thub.notifications.userjoins.clickHere" params=[userUtils.displayName(newUser)]/></a></p>

</@email.html>


<@email.text>

    <@trans key="thub.notifications.userjoins.description" params=[site.name, userUtils.displayName(newUser)]/>

    <@trans key="thub.notifications.userjoins.clickHere" params=[userUtils.displayName(newUser)]/>:
    <@url obj=newUser abs=true/>
</@email.text>