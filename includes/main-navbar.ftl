<#import "/macros/thub.ftl" as teamhub />

<div id="main-navbar" class="navbar navbar-fixed-top">
    <div class="navbar-inner brand-nav">  
        <div class="container brand-container">
            <#--  <a class="brand" href="<@url name="index" />">  -->
            <a class="brand" href="https://www.fusionfabric.cloud">
                <img src="<@url path="/images/teamhub-logo.png"/>?<@teamhub.setting key="site.lastUpdated"/>"/>
            
            
            <a class="links" id="home" href="<@url name="index" />">Home</a>
            <a class="links" id="developer-portal" target="_blank" href="https://developer.fusionfabric.cloud/">Developer Portal</a>
            <a class="links" id="api-catalog" target="_blank" href="https://developer.fusionfabric.cloud/browse?workspace=FusionCreator%20Developer%20Portal&board=API%20Catalog">API Catalog</a>
            <a class="links" id="store" target="_blank" href="https://store.fusionfabric.cloud/">Store</a>
            <a class="links" id="documentation" >Documentation</a>
            <a class="links" id="news-insights" target="_blank" class="ng-binding ng-scope" href="https://www.fusionfabric.cloud/resources/news-insights">News & Insights</a>
        </a>
        </div>
    </div>
</div>

<#if springMacroRequestContext.requestUri?starts_with("/index.html")>
<#include "/includes/navbar/hero.ftl">
<#else>
<#import "/macros/thub.ftl" as teamhub />

<div id="main-navbar" class="navbar navbar-fixed-top">

<@security.access allowIf='ROLE_USE_SITE'>
    <div class="navbar-inner">
        <div class="container">
            <div class="row-fluid">
                <div class="search-wrapper span${Request["mainContentWidth"]}">
                    <a type="button" class="btn btn-navbar off-canvas-nav-btn" href="#sidr">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </a>
                    <#if !includeChildren??>
                        <#assign includeChildren = false />
                    </#if>
                    <form action="<@url name="search"/>" method="get" class="navbar-search">
                        <input type="hidden" id="search-container" name="c" value="<#if container??>${container?html}</#if>"/>
                        <input type="hidden" id="include-space-children" name="includeChildren" value="<#if container??>${includeChildren?c}</#if>"/>
                        <input type="hidden" id="search-filters" name="f" value="<#if search_filters??>${search_filters?html}</#if>"/>
                        <input type="hidden" id="search-types" name="type"
                               value="<#if search_type??>${search_type}<#else><#list cTypes.listableTypes as type>${type.simpleName}<#if type_has_next> OR </#if></#list> OR answer OR topic OR user</#if>" />
                        <input type="hidden" id="search-redirect" name="redirect"
                               value="<#if redirect??><@teamhub.clean redirect/><#else>search/search</#if>"/>
                        <input type="hidden" id="search-sort" name="sort"
                               value="<#if search_sort??><@teamhub.clean search_sort /><#else>relevance</#if>"/>
                    <#-- For reference, the output of query below has been sanitized in the actual controller -->
                        <input type="text"
                               class="search-query"
                               value="<#if query??>${query}</#if>"
                               name="q"
                               id="search-query"
                               data-provide="typeahead"
                               data-items="4"
                               autocomplete="off"
                               placeholder="<@trans key="thub.search.placeholder" />"
                                />
                        <a href="#" id="search-query-button" class="search-button no-style-link"><i class="icon-search"></i></a>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                var label = $('.navbar-search label[for=search_box]');
                                label.css({
                                    position: 'absolute',
                                    top: 4,
                                    left: 17,
                                    zindex: 10
                                });
                                $('#search_box').focus(function() {
                                    label.hide()
                                }).blur(function () {
                                    this.value == "" ? label.show() : label.hide()
                                });


                                var row1 ='<div><@trans key="thub.search.advanced.usage.row1.title.popover" default="”keyword phrase”" /><span class="sub-popover"><@trans key="thub.search.advanced.usage.row1.subtitle.popover" default="CONTAINING THIS EXACT PHRASE" /><span /></div>';

                                var row2 ='<div><@trans key="thub.search.advanced.usage.row2.title.popover" default="+keyword" /><span class="sub-popover"><@trans key="thub.search.advanced.usage.row2.subtitle.popover" default="MUST CONTAIN THIS KEYWORD" /><span /></div>';

                                var row3 ='<div><@trans key="thub.search.advanced.usage.row3.title.popover" default="-keyword" /><span class="sub-popover"><@trans key="thub.search.advanced.usage.row3.subtitle.popover" default="EXCLUDING THIS KEYWORD" /><span /></div>';
                                var row4 ='<div><@trans key="thub.search.advanced.usage.row4.title.popover" default="[topic]" /><span class="sub-popover"><@trans key="thub.search.advanced.usage.row4.subtitle.popover" default="TAGGED WITH THIS TOPIC" /><span /></div>';
                                var row5 ='<div><@trans key="thub.search.advanced.usage.row5.title.popover" default="title:”keyword”" /><span class="sub-popover"><@trans key="thub.search.advanced.usage.row5.subtitle.popover" default="TITLE CONTAINS THIS KEYBOARD" /><span /></div>';
                                var row6 ='<div><@trans key="thub.search.advanced.usage.row6.title.popover" default="body:”keyword”" /><span class="sub-popover"><@trans key="thub.search.advanced.usage.row6.subtitle.popover" default="BODY CONTAINS THIS KEYBOARD" /><span /></div>';
                                var row7 ='<div><@trans key="thub.search.advanced.usage.row7.title.popover" default="date:”yyyy-mm-dd TO yyyy-mm-dd”" /><span class="sub-popover"><@trans key="thub.search.advanced.usage.row7.subtitle.popover" default="CREATED OR MODIFIED WITHIN THIS DATE RANGE" /><span /></div>';
                                  var content = row1 + row2 + row3 + row4 + row5 + row6 +row7;
                                var template =
                                '<div class="popover" role="tooltip">'
                                    + '<div class="inner-link-wrapper">'
                                        +'<h3 class="popover-title"></h3>'
                                        +'<a class="search-help-full-page" href="<@url name="search:advanced-usage" />">'
                                        +'<span class="search-tip">More Info</span>'
                                        +'<i class="search-help-icon fa fa-question-circle-o" aria-hidden="true"></i></a></div>'
                                    + '<div class="popover-content"></div>' +
                                '</div>'

                                $('#search-query').popover({
                                    trigger: 'manual',
                                    content: content,
                                    html: true,
                                    title: '<@trans key="thub.search.advanced.usage.title.popover" default="Advanced Search Tips" />',
                                    placement: 'bottom',
                                    template: template
                                }).click(function(ev) {
                                    var input = $(this);
                                    var isAutocompleteOpened = $('#searchResultsAutoComplete ul').is(':visible');
                                    if(! $('.search-wrapper').find('.popover').is(':visible') && !isAutocompleteOpened) {
                                        $('.icon-search').css('color', '#1c84c6');
                                        $(this).popover('show');
                                    }
                                });

                                $('body').click(function(ev) {
                                    var isNotInnerLink = ! $(ev.target).not().hasClass("search-help-full-page")
                                        && ! $(ev.target).hasClass("search-help-icon");
                                    var isInput = $(ev.target).hasClass("search-query ui-autocomplete-input");
                                    if(isNotInnerLink && !isInput) {
                                        $('#search-query').popover('hide');
                                        $('.icon-search').css('color', '#999');
                                    }
                                })
                            });
                        </script>
                        <div id="searchResultsAutoComplete"></div>
                    </form>
                </div>
                <div class="span${12 - Request["mainContentWidth"]}">
                    <ul class="nav-links">
                        <li>
                            <#assign writableTypes = cTypes.writableTypes />

                            <#assign visibleTypes = 0 />
                            <#assign contentTypesList>
                                <#list writableTypes as type>
                                    <#if type.hasStartPostingRole>
                                        <#assign visibleTypes = visibleTypes + 1 />
                                        <li>
                                            <a href="${type.postUrl}<#if currentSpace??>?space=${currentSpace}</#if>"><@trans key=".label.${type.simpleName}.post" /></a>
                                        </li>
                                    </#if>
                                </#list>
                            </#assign>

                            <#list writableTypes as type>
                                <#if type.hasStartPostingRole>
                                    <#assign firstEntry = type />
                                    <#break>
                                </#if>
                            </#list>

                             <#if contentTypesList?has_content>
                                <#if visibleTypes == 1>
                                    <#assign type = firstEntry />
                                    <div class="btn-group navbar-action">
                                        <a id="create-button" class="btn btn-warning"
                                           href="${type.postUrl}<#if currentSpace??>?space=${currentSpace}</#if>"><@trans key=".label.${type.simpleName}.post" /></a>
                                    </div>
                                <#elseif visibleTypes != 0>
                                    <div class="btn-group navbar-action">
                                        <#assign type = firstEntry />
                                        <a id="create-button" class="btn btn-warning"
                                           href="${type.postUrl}<#if currentSpace??>?space=${currentSpace}</#if>"><@trans key=".label.create" /></a>
                                        <button class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu pull-right">
                                            ${contentTypesList}
                                        </ul>
                                    </div>
                                </#if>
                            </#if>
                        </li>

                        <#if currentSite??>
                            <#assign smartSpaces = listSpaces.smartSpaces />
                        </#if>

                        <#if currentSite?? && (teamhub.getSetting("site.navigation.spaces.activateInTheme") || smartSpaces?has_content)>
                            <#assign smartSpacesList>
                                <#list smartSpaces as smartSpace>
                                    <li <#if currentSmartSpace?? && currentSmartSpace.id==smartSpace.id>class="active"</#if>>
                                        <a class="main-nav" href="<@url name="smart-spaces:index" space=smartSpace.id plug=smartSpace.plug />">${smartSpace.name?html}</a>
                                    </li>
                                </#list>
                            </#assign>

                            <#assign spacesList>
                                <@listSpaces isNav=true excludeDefaults=false childrenOpening='<ul>' childrenClosing='</ul>'; space, has_role, depth>
                                    <li <#if currentSpace?? && (currentSpace.name=space.name || currentSpace.parent.name == space.name)>class="active"</#if>>
                                        <a <#if depth=0>class="main-nav"</#if>
                                           href="<@url name="spaces:index" space=space plug="index"/>">${space.name?html}</a>
                                        <#assign haveSpaces=true/>
                                </@listSpaces>
                            </#assign>

                            <#if smartSpacesList?has_content || spacesList?has_content>
                                <li class="dropdown" id="spacesMenu">
                                    <a href="#" id="spaces-menu-dropdown" class="dropdown-toggle" data-toggle="dropdown">
                                        <@trans key="thub.label.spaces" />
                                        <i class="icon-caret-down"></i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        ${smartSpacesList}
                                        <#if smartSpacesList?has_content && spacesList?has_content>
                                            <li class="divider"></li>
                                        </#if>
                                        ${spacesList}
                                    </ul>
                                </li>
                            </#if>
                        </#if>
                        <li class="dropdown" id="exploreMenu">
                            <a href="#" id="explore-menu-dropdown" class="dropdown-toggle" title="<@trans key="thub.label.explore" />"
                               data-toggle="dropdown">
                                <i class="icon-sitemap"></i>
                                <i class="icon-caret-down"></i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li>
                                    <a id="explore_topics_link" href="<@url name="topics" abs=true />"><@trans key="label.topics" /></a>
                                </li>

                                <#list cTypes.listableTypes as type>
                                    <#if type.hasViewListRole>
                                    <li>
                                        <a id="${type.simpleName}_explore_link" href="${type.listUrl}"><@trans key=".label.${type.simpleName}.list" /></a>
                                    </li>
                                    </#if>
                                </#list>

                                <@security.access allowIf='ROLE_VIEW_USERS'>
                                <li>
                                    <a id="explore_users_link" href="<@url name="users:list" />"><@trans key="thub.label.users" /></a>
                                </li>
                                </@security.access>


                                <@security.access allowIf='ROLE_VIEW_AWARDS'>
                                 <li>
                                    <a id="explore_awards_link" href="<@url name="awards:types" />"><@trans key="thub.badges.title" /></a>
                                </li>
                                </@security.access>
                            </ul>
                        </li>
                        <@security.isAuthenticated>
                            <li class="dropdown" id="profileMenu" >
                                <a href="#" id="profile-menu-dropdown" class="dropdown-toggle user-dropdown" data-toggle="dropdown">
                                <#--<span>${userUtils.displayName(currentUser)}</span>-->
                                    <@teamhub.avatar currentUser 24 />
                                    <i class="icon-caret-down"></i>
                                </a>

                                <ul class="dropdown-menu pull-right">
                                    <li><a id="profile-link" href="<@url obj=currentUser />"><@trans key="label.profile" /></a></li>
                                    <li><a id="preference-link" href="<@url name="users:preferences" user=currentUser plug=currentUser.plug />"><@trans key="thub.users.preferences.title" /></a></li>
                                    <#if moderationUtils.canViewModerationConsole()>
                                        <li><a id="moderation-link" href="<@url name="moderation:list"/>"><@trans key="thub.label.moderation" default="Moderation"/> <#assign inModerationCount = moderationUtils.inModerationCount() />
                                            <#assign repliedCount = moderationUtils.repliedCount() />
                                            <#if repliedCount != 0 || inModerationCount != 0>
                                                (${inModerationCount} /
                                            ${repliedCount})
                                            </#if></a>
                                            </li>
                                    </#if>

                                    <@security.access allowIf='ROLE_EDIT_SETTINGS'>
                                        <li>
                                            <a id="admin-link" href="<@url name="admin:index"/>"><@trans key="label.admin" /></a>
                                        </li>
                                    </@security.access>
                                    <li class="divider"></li>
                                    <li><a id="logout-link" href="<@url name="users:logout" />"><@trans key="label.logout" /></a></li>
                                </ul>
                            </li>
                        </@security.isAuthenticated>
                        <@security.isNotAuthenticated>
                            <li>
                                <a id="login-link" href="<@url name="users:login" />"><@trans key="label.login" /></a>
                            </li>
                        </@security.isNotAuthenticated>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</@security.access>
</div>
<#if question?? || space?? || node?? || content?? || smartSpace??>
    <div id="main-breadcrumb">
        <div class="container">
            <@teamhub.breadcrumbs object=question!node!content!space!smartSpace />
        </div>
    </div>
</#if>
</#if>
