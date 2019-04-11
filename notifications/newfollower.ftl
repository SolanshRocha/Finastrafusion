<#import "/macros/email.ftl" as email />

<@email.subject>
<@trans key="thub.notifications.newfollower.title" params=[userUtils.displayName(follower), site.name] />
</@email.subject>

<@email.html>

    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.notifications.newfollower.description" params=[userUtils.displayName(follower), site.name] /></p>

    <table style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:10px; margin-left: 20px;">
        <tr>
            <td style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:10px;">
                <img src="${userUtils.avatar(follower)}" height="48"/>
            </td>
            <td valign="top">
                <a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;margin-top:10px;" href="<@url obj=follower abs=true/>">${userUtils.displayName(follower)}</a>
                <table style="margin-top:10px;">
                    <tr>
                        <td align="center" style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px; font-weight: bold;">${follower.reputation}<br/><span style="font-weight: normal; font-size: 11px;"><@trans key="thub.label.reputation"/></span></td>
                        <td align="center" style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px; font-weight: bold;">${follower.followers?size}<br/><span style="font-weight: normal; font-size: 11px;"><@trans key="label.followers" /></span></td>
                        <td align="center" style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px; font-weight: bold;">${follower.userFollows?size}<br/><span style="font-weight: normal; font-size: 11px;"><@trans key="thub.label.following" /></span></td>
                        <td align="center" style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px; font-weight: bold;">${follower.acceptRate}%<br/><span style="font-weight: normal; font-size: 11px;"><@trans key="thub.label.acceptRate" /></span></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <p style="text-decoration:none; text-align:center; /*background:#dfeaf4;*/ background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin:10px auto 0px auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url obj=follower abs=true/>">
        <@trans key="thub.notifications.newfollower.clickHere" params=[userUtils.displayName(follower)] />
    </a></p>


</@email.html>

<@email.text>

    <@trans key="thub.notifications.newfollower.description" params=[userUtils.displayName(follower), site.name] />

    <@url obj=follower abs=true />

</@email.text>