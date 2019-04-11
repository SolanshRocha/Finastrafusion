<#import "/macros/email.ftl" as email />

<@email.subject>
    <@trans key="notifications.mail.questionedited.subject" params=[site.name, userUtils.displayName(actionAuthor), safeInput(question.title)] />
</@email.subject>

<@email.html>

    <style type="text/css">
        del{
            color: #ff0000;
        }

        ins{
            color: #008000;
        }
    </style>
    <#assign questionLink><a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;margin-top:10px;" href="<@url obj=question abs=true/>"<i>${safeInput(question.title)}</a></i></#assign>
    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:0px;"><@trans key="notifications.mail.questionedited.description" params=[questionLink, userUtils.displayName(actionAuthor), site.name] />:</p>

    <div style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:12px;margin-top:10px; width: 600px;"> <blockquote>
        <!-- If the question was edited show diff-->
        <#if action.node.title != action.node.revisions[1].title>
            <p><b><@trans key="notifications.mail.questionedited.subjectedited"/>:</b><i>
                <@diff base=safeInput(action.node.revisions[1].title!"") new=safeInput(action.node.title!"")/></i></p>
        </#if>
        <i>
        <@diff base=safeInput(action.node.revisions[1].bodyAsHTML()!"") new=safeInput(action.nodeObject.activeRevision.bodyAsHTML()!"")/>
    </i></blockquote></div>

    <#--<#list action.node.topics as topic>-->

    <#--</#list>-->
    <p style="text-decoration:none; text-align:center; /*background:#dfeaf4;*/ background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin:10px auto 0px auto;"><a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url name="questions:view" question=question plug=question.plug abs=true />"><@trans key="notifications.mail.questionedited.linkTitle" /></a></p>
</@email.html>

<@email.text>
    <@trans key="notifications.mail.questionedited.description" params=[safeInput(question.title), userUtils.displayName(actionAuthor), site.name] />.

    <@trans key="notifications.mail.questionedited.question.view"/>: <@url obj=question abs=true/>
</@email.text>