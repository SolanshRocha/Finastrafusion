<#import "/spring.ftl" as spring />
<#import "/macros/thub.ftl" as teamhub />
<#import "/macros/security.ftl" as security />

<div class="node-list-item ${node.typeName}-list-item">
    <div class="col-xs-1 col-sm-2 col-md-1 icon-wrapper">
        <#if node.typeName == 'question'>
            <i class="icon-question-sign xs-hidden"></i>
        <#elseif node.typeName == 'kbentry'>
            <i class="icon-book xs-hidden"></i>
        <#elseif node.typeName == 'idea'>
            <i class="icon-lightbulb xs-hidden"></i>
        </#if>
        <div class="gravatar-wrapper">
            <#if node.lastActivityAction??>
                <@teamhub.avatar node.lastActiveUser 32 true "" "" "" "user-avatar-${node.id}" />
            <#else>
                <@teamhub.avatar node.author 32 true "" "" "" "user-avatar-${node.id}" />
            </#if>
        </div>
    </div>
    <div class="info col-xs-8 col-sm-6 col-md-8">
        <#assign userName>
            <@teamhub.showUserName user=node.lastActiveUser/>
        </#assign>
        <#if node.lastActionVerb??>
            <span class="user">
                <@teamhub.objectLink object=node.lastActiveUser content=userName/>
            </span>
            <span>
                <@trans key="thub.nodes.listIncludes.${node.lastActionVerb}" default="${node.lastActionVerb}"/>
            </span>
            &middot;
            <span title="${node.lastActiveDate}">
                <@dateSince date=node.lastActiveDate format="MMM d, ''yy"/>
            </span>

            <#if node.space.name != "Default">
            &middot;
            <span class="space">
               <@teamhub.listSpaceHierarchy space=node.space; curSpace>
                   <a class="space-name" href="<@url obj=curSpace/>">${curSpace.name}</a>
               </@teamhub.listSpaceHierarchy>
           </span>
            </#if>
        </#if>
        <h4 class="title">
            <a href="${node.viewUrl}">
                <#if node.visibility=='mod'>
                    <i class="icon icon-lock"></i>&nbsp;
                </#if>${node.title?html}
            </a>
            <#if node.status.closed??>
                <span class="label"><@trans key="thub.questionHeadline.closed" /></span>
            </#if>
            <#if node.isWiki()>
                <span class="label label-info"><@trans key="label.wiki" /></span>
            </#if>
        </h4>
        <#-- The only place we show this so far is in search lists to show search hit matches -->
        <#if showBody?? && showBody == true>
            ${bodyPreview}
        </#if>
        <#if node.space.name == "Default">
            <div class="tags">
                <#list node.organizedTopics as topic>
                    <#assign topicTitle><@teamhub.clean topic.title /></#assign>
                    <@teamhub.objectLink object=topic content=topicTitle class="tag"/>
                    <#if topic_has_next></#if>
                </#list>
            </div>
        </#if>
    </div>
    <div class="counts col-xs-3 col-sm-4">
        <#assign commentCount = commentsThread.count(node) />
        <p class="pull-right views muted"><span><@teamhub.number_as_thousands commentCount /></span> <@trans key="label.views" /></p>

        <p id="post-${node.id}-score-wrapper" class="pull-right votes<#if node.score == 0> muted</#if> xs-hidden">
            <span><@teamhub.number_as_thousands node.score /></span>
            <@trans key="thub.node.vote.count.question" params=[node.score] />
        </p>
        <#if node.allowChildren>
            <#assign childCount = node.defaultChildrenCount />
            <p class="pull-right answers <#if node.isMarked()>accepted<#elseif childCount == 0> unanswered</#if>">
                <span>${childCount}</span> <@trans key="label.replies" params=[childCount]/>
            </p>
        </#if>
    </div>
</div>       

