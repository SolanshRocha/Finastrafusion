<form action="<#if authMode.mode = "social"><@url name="users:social:login:submit" providerId="${authMode.id}" /><#else><@spring.url "/j_spring_openid_security_check"/></#if>" id="openid_${authMode.id}" method="post"
    <a href="#" title="${authMode.name}" <#if authMode.mode != "endpointForm">onclick="$('#openid_${authMode.id}').submit(); return false;"
    <#else>onclick="$('#openid_placeholder').hide(); $('#openid_placeholder').html($('#input_area_${authMode.id}').html()); $('#openid_placeholder').show(); return false;"</#if> >
        <#if authMode.type == 'smallIcon'>
            <#if authMode.smallImage??><img src="<@url path=authMode.smallImage/>" class="login_img_${authMode.id}" border="0"/><#else>${authMode.name}</#if>
        <#elseif authMode.type == 'bigIcon'>
            <#if authMode.largeImage??><img src="<@url path=authMode.largeImage/>" class="login_img_${authMode.id}" border="0"/><#else>${authMode.name}</#if>
        </#if>
    </a>
    <#if authMode.mode = "endpointForm">
        <div class="openid_input_area" style="display: none;" id="input_area_${authMode.id}">
            <p>Enter your ${authMode.name} username</p>
            <input class="openid_identifier_${authMode.id}" name="openid_identifier" type="hidden" value="${authMode.authEndpoint}" />
            <input class="openid_entry_${authMode.id}" name="openid_entry" type="text" value="" size="40"/>
            <div class="social-actions">
                <button class="btn" value="cancel" onclick="$('#openid_placeholder').hide();"><@trans key="label.cancel" /></button>
                <button class="btn btn-primary" value="Login" onclick="updateAndSubmitOpenID('${authMode.id}'); return false;"><@trans key="label.login" /></button>
            </div>
            <script type="text/javascript">
                $(".openid_entry_${authMode.id}").keyup(function(e) {
                    if (e.keyCode == 13) {
                        updateAndSubmitOpenID('${authMode.id}'); return false;
                    }
                });
            </script>
        </div>
    <#elseif authMode.authEndpoint??>
        <input name="openid_identifier" type="hidden" value="${authMode.authEndpoint}" />
    </#if>
</form>