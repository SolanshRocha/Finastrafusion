<#import "/macros/email.ftl" as email />

<#macro showQuestions categorizedQuestions category>
	<#list categorizedQuestions[category]?keys as matchedCriteria>
		<#list categorizedQuestions[category][matchedCriteria] as question>
			<#assign userLink>
	        	<a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url obj=question.author abs=true/>"><i>${userUtils.displayName(question.author)}</i></a>
	    	</#assign>
			<#assign questionLink>
	        	<a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url obj=question abs=true/>"><i>${safeInput(question.title)}</i></a>
	    	</#assign>
	    	<#assign spaceLink>
	        	<a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url obj=question.space abs=true/>"><i>${safeInput(question.space.name)}</i></a>
	    	</#assign>
	    	<#assign topicLinks>
	    		<#list question.topics as topic>
	        		<a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;" href="<@url obj=topic abs=true/>"><i>${safeInput(topic.name)}</i></a><#if topic_has_next>,</#if>
	        	</#list>
	    	</#assign>
		    <p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:10px;"><@trans key="notifications.mail.moddailydigest.question" params=[userLink,questionLink,spaceLink,topicLinks] /></p>
		</#list>
	</#list>
</#macro>

<#macro showCategories categorizedQuestions sectionName>
	<#list categorizedQuestions?keys as category>
		<#if categorizedQuestions[category]?keys?has_content>
			<p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:16px;margin-top:10px;">${sectionName}</p>	
			<#break>
		</#if>
	</#list>
	<#list categorizedQuestions?keys as category>
		<#if category == "spaces">
			<#if categorizedQuestions[category]?keys?has_content>
				<p style="color:#333333;font-weight:bold;font-family:Arial, Helvetica, sans-serif;font-size:16px;margin-top:10px;">Spaces:</p>
				<@showQuestions categorizedQuestions category/>
				<br>
			</#if>
    	</#if>
		<#if category == "topics">
			<#if categorizedQuestions[category]?keys?has_content>
				<p style="color:#333333;font-weight:bold;font-family:Arial, Helvetica, sans-serif;font-size:16px;margin-top:10px;">Topics:</p>
				<@showQuestions categorizedQuestions category/>
				<br>
			</#if>
		</#if>
		<#if category == "questions">
			<#if categorizedQuestions[category]?keys?has_content>
				<p style="color:#333333;font-weight:bold;font-family:Arial, Helvetica, sans-serif;font-size:16px;margin-top:10px;">Questions:</p>
				<@showQuestions categorizedQuestions category/>
				<br>
			</#if>
		</#if>
	</#list>
</#macro>

<@email.subject>
	<@trans key="notifications.mail.moddailydigest.title" params=[userUtils.displayName(recipient),site.name] />
</@email.subject>
<@email.html>
		<p style="color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:16px;margin-top:10px;"><@trans key="notifications.mail.moddailydigest.description"/></p>
    	<#assign sectionName>
    		<@trans key="notifications.mail.moddailydigest.userFollows"/>
    	</#assign>
    	<@showCategories questionsFromUserFollows sectionName/>
    	<#assign sectionName>
    		<@trans key="notifications.mail.moddailydigest.areasOfExpertise"/>
    	</#assign>
    	<@showCategories questionsFromAreasOfExpertise sectionName/>
    	<#assign sectionName>
    		<@trans key="notifications.mail.moddailydigest.generalUnansweredQuestions"/>
    	</#assign>
    	<@showCategories generalUnansweredQuestions sectionName/>
	<div style="margin-left:25px;color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;margin-top:10px;">
		<a style="text-decoration:none; color:#3060a8; font-weight:bold; font-size:14px;margin-top:10px;" href="<@url name="questions:unanswered"/>">
        	<@trans key="notifications.mail.moddailydigest.link"/>
    	</a>
    </div>
</@email.html>
<#macro showQuestionsText categorizedQuestions category>
	<#list categorizedQuestions[category]?keys as matchedCriteria>
		<#list categorizedQuestions[category][matchedCriteria] as question>
			<#assign userLink>${userUtils.displayName(question.author)}</#assign><#assign questionLink>${question.title}</#assign><#assign spaceLink>${question.space.name}</#assign><#assign topicLinks><#list question.topics as topic>${topic.name}<#if topic_has_next>,</#if></#list></#assign><#assign questionUrl><@url obj=question abs=true/></#assign>
		    
		    <@trans key="notifications.mail.plain.moddailydigest.question" params=[userLink,questionLink,spaceLink,topicLinks,questionUrl] />
		</#list>
		
	</#list>
</#macro>

<#macro showCategoriesText categorizedQuestions sectionName>
	<#list categorizedQuestions?keys as category>
		<#if categorizedQuestions[category]?keys?has_content>
			${sectionName}
			<#break>
		</#if>
	</#list>
	<#list categorizedQuestions?keys as category>
		<#if category == "spaces">
			<#if categorizedQuestions[category]?keys?has_content>
				
				Spaces:
				<@showQuestionsText categorizedQuestions category/>
				
			</#if>
    	</#if>
		<#if category == "topics">
			<#if categorizedQuestions[category]?keys?has_content>
				
				Topics:
				<@showQuestionsText categorizedQuestions category/>
				
			</#if>
		</#if>
		<#if category == "questions">
			<#if categorizedQuestions[category]?keys?has_content>
				
				Questions:
				<@showQuestionsText categorizedQuestions category/>
				
			</#if>
		</#if>
	</#list>
</#macro>

<@email.text>

	<@trans key="notifications.mail.moddailydigest.description"/>

    <#compress>
    	<#assign sectionName>
    		<@trans key="notifications.mail.moddailydigest.userFollows"/>
    	</#assign>
    	<@showCategoriesText questionsFromUserFollows sectionName/>
    	
    	<#assign sectionName>
    		<@trans key="notifications.mail.moddailydigest.areasOfExpertise"/>
    	</#assign>
    	<@showCategoriesText questionsFromAreasOfExpertise sectionName/>
    	
    	<#assign sectionName>
    		<@trans key="notifications.mail.moddailydigest.generalUnansweredQuestions"/>
    	</#assign>
    	<@showCategoriesText generalUnansweredQuestions sectionName/>
    </#compress>

    	
    <#assign unansweredQuestionsUrl><@url name="questions:unanswered" abs=true/></#assign>
    <@trans key="notifications.mail.plain.moddailydigest.link" params=[unansweredQuestionsUrl]/>
    	
</@email.text>