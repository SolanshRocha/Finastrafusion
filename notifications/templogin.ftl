<#import "/macros/email.ftl" as email />

<@email.subject>
<@trans key="thub.user.templogin.emailTitle" params=[site.name] />
</@email.subject>

<@email.html>
    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.user.templogin.emailText" params=[site.name] />:</p>

    <p style="text-decoration:none; text-align:center; /*background:#dfeaf4;*/ background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin:10px auto 0px auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url name="users:tmp_login_execute" abs=true />?token=${useremail.validationToken}">
        <@trans key="thub.user.templogin.linkText" />
    </a></p>

    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:10px;"><@trans key="thub.mail.linkNotClickable" />:</p>

    <p><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url name="users:tmp_login_execute" abs=true />?token=${useremail.validationToken}"><@url name="users:tmp_login_execute" abs=true />?token=${useremail.validationToken}</a></p>

</@email.html>

<@email.text>

    <@trans key="thub.user.templogin.emailText" params=[site.name] />:

    <@url name="users:tmp_login_execute" abs=true />?token=${useremail.validationToken}

</@email.text>