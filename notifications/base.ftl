<#import "/macros/email.ftl" as email />
<#import "/macros/thub.ftl" as teamhub />

<@email.subject>
${msg.subject}
</@email.subject>

<@email.html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <BASE HREF=${requestInfo.fullUrl} TARGET=
    "_top">
    <style>
        table p, pre {
           margin-left: 25px;
        }
        #message pre {
            background-color: white;
            border: 1px solid rgba(0, 0, 0, 0.15);
            border-radius: 4px;
            padding: 15px;
        }
        #message img {
            max-width: 100%;
        }

    </style>
</head>

<body bgcolor="FFFFFF">
<table cellpadding="0" cellspacing="0" style="border:1px solid #BEBEBE;" bgcolor="fafafa" align="center" width="600" id="notification-body">
    <tr>
        <td>
            <table bgcolor="#f4f4f4" align="center" width="600" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table bgcolor="ebebeb" style="border-bottom:1px solid #BEBEBE;" border="0" width="600">
                            <tr>
                                <td align="center" rowspan="2" width="15%"><img
                                        src="<@url path="/images/answerhub-email-logo.png" abs=true />" height="48"/>
                                </td>
                                <#if teamhub.getSetting("mail.notifications.showSiteName")!false>
                                    <td width="70%" valign="middle"
                                        style="font-family:Arial, Helvetica, sans-serif; padding:30px 0 0 0; font-size:18px; color:#666;">${site.name}</td>
                                </#if>
                                <td style="padding:15px;" align="center" valign="middle" rowspan="2" width="15%"><img
                                        src="<#noparse>${userUtils.avatar(recipient)}</#noparse>" height="48"/></td>
                            </tr>
                        </table>

                        <table align="center" border="0" width="600">
                            <tr>
                               <td style="font-family:'Open Sans','Helvetica Neue',Helvetica,Arial,sans-serif; font-size:14px; color: #333;">
                                <p>
                                    [@trans key="mail.helloUser" params=[userUtils.displayName(recipient)] /]
                                </p></td>
                            </tr>
                        </table>

                        <table align="center" border="0" width="600">
                        <tr><td id="message">${msg.html}</td></tr>
                        </table>

                        <table cellpadding="0" cellspacing="0" border="0" width="600" align="center">
                            <tr>
                                <td valign="bottom" height="25"></td>
                            </tr>
                            <tr>
                                <td bgcolor="#f0f0f0" style="border-top:0px solid #BEBEBE;"><img
                                        src="<@url path="/images/box-shadow.png"/>"/></td>
                            </tr>
                            <tr>
                                <#assign settingsLink><a
                                        href='[@url name="users:preferences" user=recipient plug=recipient.plug abs=true /]#/notifyTab'><@trans key="thub.notifications.base.settingsLink" /></a></#assign>
                                <td bgcolor="#FFFFFF"
                                    style="padding:10px 20px 25px 20px; font-family:Arial, Helvetica, sans-serif; font-size:11px; color:#888;"><@trans key="thub.notifications.base.settings" params=[settingsLink]/></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
</@email.html>

<@email.text>
[@trans key="notifications.mail.hello" params=[userUtils.displayName(recipient)]/]

${msg.text}

-------------------------
<@trans key="notifications.mail.preferences"/>:
[@url name="users:preferences" user=recipient plug=recipient.plug abs=true /]#notificationsPanel
</@email.text>