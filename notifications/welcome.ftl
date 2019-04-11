<#import "/macros/email.ftl" as email />

<@email.subject>
<@trans key="thub.notifications.welcome.title" params=[site.name] />
</@email.subject>

<@email.html>

                <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:10px;">
                    <@trans key="thub.notifications.welcome.description" params=[site.name] />
                </p>

                <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:10px;"><@trans key="thub.notifications.welcome.login.info" />:</p>

                <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:10px;"><@trans key="thub.notifications.welcome.Username" />: ${user.username}<br />
                <#if !password??><@trans key="thub.notifications.welcome.password" /><#else><@trans key="thub.notifications.welcome.PasswordIncluded" />: ${password}</#if></p>

                <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:10px;"><@trans key="thub.notifications.welcome.verify.title" />:</p>

                <p><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url name="users:validate_email" abs=true />?validationToken=${useremail.validationToken}"><@trans key="thub.notifications.welcome.verify.link" /></a></p>

                <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:10px;"><@trans key="thub.mail.linkNotClickable" />:</p>

                <p><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url name="users:validate_email" abs=true />?validationToken=${useremail.validationToken}"><@url name="users:validate_email" abs=true />?validationToken=${useremail.validationToken}</a></p>
</@email.html>

<@email.text>
<@trans key="thub.notifications.welcome.description" params=[site.name] />:

<@trans key="thub.notifications.welcome.Username" />: ${user.username}
<#if !password??><@trans key="thub.notifications.welcome.password" /><#else><@trans key="thub.notifications.welcome.PasswordIncluded" />: ${password}</#if>

<@trans key="thub.notifications.welcome.verify.title" />:

<@url name="users:validate_email" abs=true />?validationToken=${useremail.validationToken}

</@email.text>
