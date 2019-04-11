<#import "/macros/email.ftl" as email />

<@email.subject>
    <@trans key=".notifications.digest.title" params=[site.name, digestType] />
</@email.subject>

<#macro p><p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:10px;"><#nested /></p></#macro>

<#macro a href><a style="text-decoration:none; font-weight:bold; font-size:14px;" href="<@url obj=href abs=true />"><#nested /></a></#macro>

<#function link obj>
    <#assign ret><@a href=obj><#if obj.type == 'user'>${userUtils.displayName(obj)}<#else>${safeInput(obj.originalParent.title)}</#if></@a></#assign>
    <#return ret />
</#function>

<#macro ul lst>
    <ul>
        <#list lst as item>
            <li style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:18px;"><#nested item /></li>
        </#list>
    </ul>
</#macro>

<#macro headerRow>
    <tr>
        <td style="border-bottom:1px solid #BEBEBE;padding:25px 0 15px 0;font-family:Arial, Helvetica, sans-serif;font-size:14px;" >
            <strong><#nested /></strong>
        </td>
    </tr>
</#macro>

<@email.html>

<table align="center" width="600" cellpadding="0" cellspacing="0" style="color:#333333;padding-bottom:25px;">
    <tr><td style="border-bottom:1px solid #BEBEBE;font-family:Arial, Helvetica, sans-serif;font-size:14px;padding:15px 0 10px 15px;">
        <@trans key=".notifications.digest.description" params=[site.name, digestType] />.
    </td></tr>

    <tr><td style="padding-left:25px;">
        <table align="center" border="0" width="550">
            <#if report.newUsers?has_content>
               <@headerRow><@trans key=".notifications.digest.newUsers" params=[report.newUsers?size] /></@headerRow>
               <tr><td>
                   <@p>
                       <#list report.newUsers as action>${link(action.user)}<#if action_has_next>, </#if></#list>
                   </@p>
               </td></tr>
            </#if>

            <#if report.mentioned?has_content>
                <@headerRow><@trans key=".notifications.digest.mentioned" params=[report.mentioned?size] /></@headerRow>
                <tr><td>
                    <@ul report.mentioned; action>
                        <@trans key=".notifications.digest.mentioned.item" params=[link(action.user), link(action.node)] />
                    </@ul>
                </td></tr>
            </#if>

            <#if report.newPostsUnique?has_content>
                <@headerRow><@trans key=".notifications.digest.newPosts.label" params=[report.newPostsUnique?size] /></@headerRow>
                <tr><td>
                    <@ul report.newPostsUnique; action>
                         <@trans key=".notifications.digest.newPosts.${action.node.originalParent.type}.${action.verb?replace(' ', '_')}" params=[link(action.node), link(action.user)] />
                    </@ul>
                </td></tr>
            </#if>

            <#if report.otherActionsUnique?has_content>
                <@headerRow><@trans key=".notifications.digest.extra.label" params=[report.otherActionsUnique?size] /></@headerRow>
                <tr><td>
                    <@ul report.otherActionsUnique; action>
                        <#if action.node??>
                            <@trans key=".notifications.digest.extra.${action.node.originalParent.type}.${action.verb?replace(' ', '_')}"
                                    params=[link(action.node), link(action.user)] />
                        <#else>
                            <@trans key=".notifications.digest.extra.${action.verb?replace(' ', '_')}"
                                        params=[link(action.user)] />
                        </#if>
                    </@ul>
                </td></tr>
            </#if>
        </table>
    </td></tr>
</table>

<p style="text-decoration:none; text-align:center; background: #3060a8; font-size:14px; display:block; padding:15px 0; color:white; width:90%; margin:10px auto 0px auto;">
    <a style="text-decoration:none; color:white; font-weight:bold; font-size:14px;" href="<@url name="index" abs=true />"><@trans key=".notifications.digest.clickHere" params=[site.name]/></a>
</p>
</@email.html>


<@email.text>
    <@trans key=".notifications.digest.description" params=[site.name, digestType] />.

    <#if report.newUsers?has_content>
        <@trans key=".notifications.digest.newUsers" params=[report.newUsers?size] />:

        <#list report.newUsers as action>${userUtils.displayName(action.user)}<#if action_has_next>, </#if></#list>


    </#if>
    <#if report.mentioned?has_content>
        <@trans key=".notifications.digest.mentioned" params=[report.mentioned?size] />:

        <#list report.mentioned as action>
            - <@trans key=".notifications.digest.mentioned.item" params=[userUtils.displayName(action.user),
                safeInput(action.node.originalParent.title)] /> (<@url obj=action.node.originalParent abs=true />)
        </#list>


    </#if>
    <#if report.newPostsUnique?has_content>
        <@trans key=".notifications.digest.newPosts.label" params=[report.newPostsUnique?size] />:

        <#list report.newPostsUnique as action>
            - <@trans key=".notifications.digest.newPosts.${action.node.originalParent.type}.${action.verb?replace(' ', '_')}"
                    params=[safeInput(action.node.originalParent.title),
                    userUtils.displayName(action.user)]/>

              (<@url obj=action.node.originalParent abs=true/>)

        </#list>


    </#if>
    <#if report.otherActionsUnique?has_content>
        <@trans key=".notifications.digest.extra.label" params=[report.otherActionsUnique?size] />:

        <#list report.otherActionsUnique as action>
            <#if action.node??>
            - <@trans key=".notifications.digest.extra.${action.node.originalParent.type}.${action.verb?replace(' ', '_')}"
                    params=[safeInput(action.node.originalParent.title),
                    userUtils.displayName(action.user)] />

              (<@url obj=action.node.originalParent abs=true/>)
            <#else>
            - <@trans key=".notifications.digest.extra.${action.verb?replace(' ', '_')}"
                    params=[userUtils.displayName(action.user)] />
            </#if>

        </#list>
    </#if>

</@email.text>