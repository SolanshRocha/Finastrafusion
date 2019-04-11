<#import "/macros/email.ftl" as email />

<@email.subject>
<@trans key="thub.notifications.newquestion.title" params=[site.name, userUtils.displayName(question.author), safeInput(question.title)] />
</@email.subject>

<@email.html>

    <#assign questionLink><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url obj=question abs=true/>"><i>${safeInput(question.title)}</i></a></#assign>

    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.notifications.newquestion.description" params=[questionLink, userUtils.displayName(question.author), site.name] /></p>

    <div style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:12px;margin-top:10px; width: 575px; overflow: hidden;"> <blockquote><i>${safeInput(question.asHTML())}</i></blockquote></div>

    <p style="text-decoration:none; text-align:center; /*background:#dfeaf4;*/ background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin:10px auto 0px auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url name="questions:view" question=question plug=question.plug abs=true />"><@trans key="thub.notifications.newquestion.clickHere" params=[userUtils.displayName(question.author)] /></a></p>
</@email.html>
          
<@email.text>

    <@trans key="thub.notifications.newquestion.description" params=[safeInput(question.title), userUtils.displayName(question.author), site.name] />:

    ${safeInput(question.body!"")}

    <@trans key="thub.notifications.newquestion.click" default='Click here to view the question' />: <@url name="questions:view" question=question plug=question.plug abs=true />

</@email.text>