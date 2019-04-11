<#import "/macros/email.ftl" as email />

<@email.subject>
    <@trans key="thub.notifications.addtogroup.title" params=[site.name, group.name] />
</@email.subject>

<@email.html>

    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.notifications.addtogroup.description" params=[site.name, group.name] /></p>
    <p style="text-decoration:none; text-align:center; background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin-top:10px; margin-left: auto; margin-right: auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url name="index" abs=true />"><@trans key="thub.notifications.addtogroup.clickHere" params=[site.name] /></a></p>

</@email.html>


<@email.text>

    <@trans key="thub.notifications.addtogroup.description" params=[site.name, group.name] />


<@trans key="thub.notifications.addtogroup.clickHere" params=[site.name] />: <@url name="index" abs=true />
</@email.text>