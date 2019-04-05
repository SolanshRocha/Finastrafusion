<#import "/spring.ftl" as spring />
<#import "/macros/thub.ftl" as teamhub />
<#import "/macros/security.ftl" as security />
<content tag="fullWidth"></content>


<html lang="en">
<head>
    <title><@trans key="thub.users.login.title" /></title>
</head>
<#assign usernamePlaceholder><@trans key="thub.users.login.username.placeholder" /></#assign>
<#assign validIds = teamhub.getSetting("user.validAuthenticationIds") />
<#if validIds?contains("email") && validIds?contains("username")>
    <#assign usernamePlaceholder><@trans key="thub.users.login.usernameOrEmail.placeholder" /></#assign>
<#elseif validIds?contains("email")>
    <#assign usernamePlaceholder><@trans key="thub.users.login.email.placeholder" /></#assign>
</#if>


<body>
<div class="login row-fluid">
    <div class="login-info span6">
        <h3><@trans key="thub.users.login.info.header" params=[currentSite.name]/></h3>
        <ul class="icons-ul">
            <li><@trans key="thub.users.login.info.blurb.1" /></li>
            <li><@trans key="thub.users.login.info.blurb.2" /></li>
            <li><@trans key="thub.users.login.info.blurb.3" /></li>
        </ul>
    </div>
    <div class="login-modes span6">
        <h2><@trans key="thub.users.login.title" /></h2>
    <#if authError??>
        <div class="alert alert-error">${authError}</div>
    <#elseif flash??>
        <#list flash?keys as key>
	        <div class="alert alert-${key} ">
	        ${flash[key]?string}
	        </div>
	    </#list>
    <#elseif SPRING_SECURITY_LAST_EXCEPTION?? && RequestParameters['loginFail']??>
        <div class="alert alert-error"><@trans key="thub.users.login.unsuccessful" default="Your login attempt was not successful, try again." /></div>
    </#if>
  
    <#--  <@security.access allowIf='ROLE_REGISTER_WITH_SITE'>
        <div class="sign-up">
            <#assign registerLink><a
                href="<@url name="users:register" />"><@trans key="thub.users.login.signup" /></a></#assign>
            <@trans key="thub.users.login.dontHaveAccount" params=[registerLink] />
        </div>
    </@security.access>  -->

    <#if authModeKeys?seq_contains("local") && authModeKeys?size &gt; 1>
        <div class="seperate-or">
            <span class="or"><@trans key="thub.users.login.orConnectWith" /></span>
        </div>
    </#if>
    
        <div class="social-login clearfix">
        <#assign showHeader = false/>
        <#list authModeKeys as key>
            <#assign authMode = authModes[key] />
            <#if authMode.position == 'leftTop' || authMode.position == 'rightTop'>
                <#if authMode.mode = "direct" || authMode.mode == 'endpointForm' || authMode.mode = "social">
                    <#if !showHeader>
                        <#assign showHeader = true />
                    </#if>
                    <#include "includes/openid_login.ftl" />
                </#if>
            </#if>
        </#list>
        <#if showHeader>
            <div id="openid_placeholder" class="bright-form"></div>
        </#if>
        </div>

    <#if authModeKeys?seq_contains("local")>
    
        <form class="form" action="<@spring.url "/login" />" method="post">
            <div class="control-group">
                <div class="controls">
                    <div class="input-prepend">
                        <#--  <span class="add-on"><i class="icon-user"></i></span>  -->
                        <input type="text" id="username" name="username" value="<#if lastUsername?? && RequestParameters.loginFail??><@teamhub.clean lastUsername/></#if>" placeholder="${usernamePlaceholder}"
                               class="username-field" <#if loginBanned??>disabled="disabled"</#if> autocomplete="off"/>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <div class="input-prepend">
                        <#--  <span class="add-on"><i class="icon-key"></i></span>  -->
                        <input type="password" id="password" name="password" value=""
                               placeholder="<@trans key="thub.users.login.password.placeholder" />"
                               class="password-field" <#if loginBanned??>disabled="disabled"</#if> autocomplete="off"/>
                    </div> 
                    <input type="submit" value="<@trans key="label.login" />" <#if loginBanned??>disabled="disabled"</#if> class="pull-right btn btn-primary"/>
                </div>
            </div>
            <div class="actions clearfix">
                <div class="forgot-password-wrap"><a
                    href="<@url name="users:temp_login" />"><@trans key="thub.users.login.forgotPassword" /></a>
                </div>

                <label class="keepMeLoggedIn checkbox pull-left">
                    <input name="remember-me" type="checkbox" value="true" checked="checked"
                           tabindex="4"/> <@trans key="thub.users.login.keepMeLoggedIn" />
                </label>
            </div>
        <div class="seperate-or">
            <span class="or"><@trans key="thub.users.login.orConnectWith" /></span>
        </div>
        </form>
    </#if>

    </div>
</div>

<script type="text/javascript">
    function updateAndSubmitOpenID(openid) {
        if ($('#openid_placeholder .openid_entry_' + openid).val()) {
            $('#openid_' + openid + ' .openid_identifier_' + openid).val($('#openid_placeholder .openid_identifier_' + openid).val().replace('%s', $('#openid_placeholder .openid_entry_' + openid).val().replace(" ", "%20")));
            $('#openid_' + openid).submit();
        }
        return false;
    }
</script>
</body>

