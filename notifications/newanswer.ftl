<#import "/macros/email.ftl" as email />

<@email.subject>
    <@trans key="thub.notifications.newanswer.title" params=[site.name, userUtils.displayName(answer.author), safeInput(question.title)] />
</@email.subject>

<@email.html>

    <#assign answerLink><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;margin-top:10px;" href="<@url obj=question abs=true/>"><i>${safeInput(question.title)}</i></a></#assign>

    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="thub.notifications.newanswer.description" params=[answerLink, userUtils.displayName(answer.author), site.name] />:</p>

    <div style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:12px;margin-top:10px; width: 575px; overflow: hidden;"> <blockquote><i>${safeInput(answer.asHTML())}</i></blockquote></div>

    <p style="text-decoration:none; text-align:center; /*background:#dfeaf4;*/ background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin:10px auto 0px auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url obj=answer abs=true/>">
        <@trans key="thub.notifications.newanswer.linkTitle" params=[userUtils.displayName(answer.author)] />
    </a></p>


</@email.html>

<@email.text>
	
    <@trans key="notifications.mail.newanswer.description" params=[safeInput(question.title), userUtils.displayName(answer.author), site.name] />:

    	${safeInput(answer.body!"")}

    <@trans key="notifications.mail.newanswer.answer.view"/>: <@url obj=answer abs=true/>

</@email.text>