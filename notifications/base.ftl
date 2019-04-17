<#import "/macros/email.ftl" as email />
<#import "/macros/thub.ftl" as teamhub />

<@email.subject>
${msg.subject}
</@email.subject>

<@email.html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <BASE HREF=${requestInfo.fullUrl} TARGET=
    "_top">
    <style>
        table p, pre {
           margin-left: 25px;
        }
        #message pre {
            background-color: white;
            border: 1px solid rgb(65, 65, 65);
            border-radius: 4px;
            padding: 15px;
        }
        #message img {
            max-width: 100%;
        }

    </style>
</head>

<body bgcolor="#FFFFFF">
<table cellpadding="0" cellspacing="0" style="border-radius: 10px solid #BEBEBE;" bgcolor="#FFB6C1" align="center"  width="600" id="notification-body">
    <tr>
        <td>
            <table bgcolor="#FFFFFF" align="center" width="600" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table bgcolor="FFFFFF" style="border-bottom:1px solid #FFFFF;" border="0" width="600">
                            <tr>
                                <td align="center" rowspan="2" width="15% " padding="20px"><img
                                        src="<@url path="https://ci5.googleusercontent.com/proxy/uW7W69HKrZnAaSFGJqXWXtPFTNdIFinVR3T5rAWsH6NCMhM015VRreG1cF24qnmsw4nrWsnJRHyJ9ttRXiFHC5fdkdAN7JFKwFXteLDzCa2nWs4znjIMNRJFQ_gEq_aWqHJZY09bobWMALwO-dXsNv15CWCUhpSK7-vOvR6QwSOSQ4N0x00u6eGM4ly95OLNRRyvd2xVc54=s0-d-e1-ft#https://d15k2d11r6t6rl.cloudfront.net/public/users/Integrators/cec15110-bcf2-48b6-b583-02d909bd8272/null/FusionFABRIC.Cloud_logo.png" abs=true/>" height="50"/>
                                </td>

                                <hr>
    
                                <#--  <td style="padding:15px;" align="center" valign="middle" rowspan="2" width="15%"><img
                                        src="<#noparse>${userUtils.avatar(recipient)}</#noparse>" height="48"/></td>  -->
                           </table>
                           <table>
                            <#if teamhub.getSetting("mail.notifications.showSiteName")!false>
                                <tr>                        
                                    <td align="center" valign="middle" padding-left="20px"
                                        style="roboto,sans-serif; padding:25px; font-size:16px; color:#414141;">
                                        ${site.name}
                                    </td>
                                
                                </tr>
                            </#if>
                        </table>

                        <table align="center" border="0" width="600">
                            <tr>
                               <td style="font-family:'roboto,sans-serif'; font-size:14px; color: #414141;">
                                <p>
                                    [@trans key="mail.helloUser" params=[userUtils.displayName(recipient)] /]
                                </p></td>
                            </tr>
                        </table>

                        <table align="center" border="0" width="600">
                        <tr><td id="message">${msg.html}</td></tr>
                        </table>

                        <!-- Social -->
                        <table cellpadding="10" cellspacing="0" border="0" width="600" align="center">
                            <tr>
                                <td valign="bottom" height="45"></td>
                            </tr>
                            <tr>
                            
                                <#--  <td bgcolor="#FFFFFF" height="30"><img
                                        src="<@url path="/images/box-shadow.png"/>"/></td>  -->
                            </tr>
                            <tr>
                                <td>
                                    <div style="color:#959595;font-family:'Lato',Tahoma,Verdana,Segoe,sans-serif;line-height:150%;padding-top:10px;padding-right:10px;padding-bottom:10px;padding-left:10px">
                                    <div style="font-size:12px;line-height:18px;color:#959595;font-family:'Lato',Tahoma,Verdana,Segoe,sans-serif">
                                    <p style="font-size:14px;line-height:15px;text-align:right;margin:0"><span style="font-size:10px">Powered by</span></p>
                                    </div>
                                    </div>
                                </td>

                                <td>
                                    <div style="border-top:0px solid transparent;border-left:0px solid transparent;border-bottom:0px solid transparent;border-right:0px solid transparent;padding-top:5px;padding-bottom:5px;padding-right:0px;padding-left:0px">

                                    <div class="m_3432716621116558532img-container m_3432716621116558532left m_3432716621116558532fixedwidth" align="left" style="padding-right:0px;padding-left:0px">
                                    <img border="0" src="https://ci3.googleusercontent.com/proxy/aP9B0aVsbiZvWIykvipKTW8d27VkP3u1GvKzaPfZ_VZXrS4F-zsYEPOgM8m1KfQgwWXK79talo_S3i1H1H7GpUZpf7gmj2sJQn0gb4lx-Dm0k55XJo2_Mw_9ISRWc0sTDI_O_vK2oti-62tzPFKV8oWj5OCm18-30bmbxgi224ryJwA3_nL708k7xYNC=s0-d-e1-ft#https://d15k2d11r6t6rl.cloudfront.net/public/users/Integrators/cec15110-bcf2-48b6-b583-02d909bd8272/null/finastra_logo.png" alt="Image" title="Image" style="outline:none;text-decoration:none;clear:both;border:0;height:auto;float:none;width:100%;max-width:100px;display:block" width="100">
                                    </div>
                                    </div>

                                </td>

                                <td>

                                <table class="m_3432716621116558532social_icons" cellpadding="0" cellspacing="0" width="100%" role="presentation" style="table-layout:fixed;vertical-align:top;border-spacing:0;border-collapse:collapse" valign="top">
                                <tbody>
                                <tr style="vertical-align:top" valign="top">
                                <td style="word-break:break-word;vertical-align:top;padding-top:10px;padding-right:10px;padding-bottom:10px;padding-left:10px;border-collapse:collapse" valign="top">
                                <table class="m_3432716621116558532social_table" align="center" cellpadding="0" cellspacing="0" role="presentation" style="table-layout:fixed;vertical-align:top;border-spacing:0;border-collapse:undefined" valign="top">
                                <tbody>
                                <tr style="vertical-align:top;display:inline-block;text-align:center" align="center" valign="top">
                                <td style="word-break:break-word;vertical-align:top;padding-bottom:5px;padding-right:3px;padding-left:3px;border-collapse:collapse" valign="top">
                                <a href="https://www.facebook.com/FinastraCareers/" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://www.facebook.com/FinastraCareers/&amp;source=gmail&amp;ust=1555160442171000&amp;usg=AFQjCNGb_ISZCrcmucRw2q_l99WFqtQzSA"><img width="32" height="32" src="https://ci6.googleusercontent.com/proxy/8nrmT38eHJdXtmTyS8wTIatBRcTmaeqLE_X_ZqutU68_xQANpa5Om2QjGT5wCsR7T7keBEACAaJOTPCuDoZ_33vaeLmFxgzMP7katQx9-p_vE6r9S-RVW_lNmyixOP_voFSex7mUXauepBJMgFvB9Kif19_SC8uxyDphZqAIffwkihJz0Q=s0-d-e1-ft#https://d2fi4ri5dhpqd1.cloudfront.net/public/resources/social-networks-icon-sets/t-only-logo-color/facebook@2x.png" alt="Facebook" title="Facebook" style="outline:none;text-decoration:none;clear:both;height:auto;float:none;border:none;display:block" class="CToWUd"></a></td>
                                <td style="word-break:break-word;vertical-align:top;padding-bottom:5px;padding-right:3px;padding-left:3px;border-collapse:collapse" valign="top">
                                <a href="https://www.linkedin.com/company/11153805/" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://www.linkedin.com/company/11153805/&amp;source=gmail&amp;ust=1555160442171000&amp;usg=AFQjCNGqJaGE45dBoARutCzIc1CnUUjUvQ"><img width="32" height="32" src="https://ci4.googleusercontent.com/proxy/zNrp0eRXOcQumIZkzsC6a0nVW_gK07cecqyUfYUCyZOkgjcwiWrlWG4r6XKiZPc4hXd_RlJyePGN27dV6D7DbnRbblhuD42upu6qKHfDedJJf79QMWlCY3AKoj0o_gRWhW7EKHaSGAMg428fOwduKdnV6MP-4khgCW2uY4PsXUiUBiVTAA=s0-d-e1-ft#https://d2fi4ri5dhpqd1.cloudfront.net/public/resources/social-networks-icon-sets/t-only-logo-color/linkedin@2x.png" alt="LinkedIn" title="LinkedIn" style="outline:none;text-decoration:none;clear:both;height:auto;float:none;border:none;display:block" class="CToWUd"></a></td>
                                <td style="word-break:break-word;vertical-align:top;padding-bottom:5px;padding-right:3px;padding-left:3px;border-collapse:collapse" valign="top">
                                <a href="https://twitter.com/FinastraFS" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://twitter.com/FinastraFS&amp;source=gmail&amp;ust=1555160442171000&amp;usg=AFQjCNGOqTVVWhHGaDgGXwgeHYnfMqDp6A"><img width="32" height="32" src="https://ci4.googleusercontent.com/proxy/StPygJJFrvCsP6BkFAglMQpcLzxBXetUc5YKQLex_pqrsPKBxKNzSCVJTT5MDYAZ4jugXiprxaCp89-q0Gn5bqmvHB4GeJsZ_uKEQ57copucmi2CEnRgW3OBGz62En2F9HZnMAQQFSvB3UotWnau8W3BkB8lIzR3JVWGl_G1qAtRh3Ys=s0-d-e1-ft#https://d2fi4ri5dhpqd1.cloudfront.net/public/resources/social-networks-icon-sets/t-only-logo-color/twitter@2x.png" alt="Twitter" title="Twitter" style="outline:none;text-decoration:none;clear:both;height:auto;float:none;border:none;display:block" class="CToWUd"></a></td>
                                <td style="word-break:break-word;vertical-align:top;padding-bottom:5px;padding-right:3px;padding-left:3px;border-collapse:collapse" valign="top">
                                <a href="https://www.youtube.com/channel/UCXMHbdfIgA6bzw_fsPN39bg" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://www.youtube.com/channel/UCXMHbdfIgA6bzw_fsPN39bg&amp;source=gmail&amp;ust=1555160442171000&amp;usg=AFQjCNG-9cgWEhtsB4jiXmy6CgAXNnhryg"><img width="32" height="32" src="https://ci6.googleusercontent.com/proxy/_88Rzl2HAOrjrGDYGbENGqEFww_jcXNYTJOYykX29YFmMyICEVYOoh802Nih5swHPKideOhMjupL6Vq9Jdq-S9usvzlAjKYA0uya6Z_tE6QVDh0cUPNsq9cc4vsNjfQFDlwsCGoz-ZoPeeGwQt5Bkr6OgE26RlMTMuRxMYfRmGL5BD4s=s0-d-e1-ft#https://d2fi4ri5dhpqd1.cloudfront.net/public/resources/social-networks-icon-sets/t-only-logo-color/youtube@2x.png" alt="YouTube" title="YouTube" style="outline:none;text-decoration:none;clear:both;height:auto;float:none;border:none;display:block" class="CToWUd"></a></td>
                                </tr>
                                </tbody>
                                </table>
                                </td>
                                </tr>
                                </tbody>
                                </table>
                                
                                </td>
                            </tr>
                        </table>


                        <table cellpadding="0" cellspacing="0" border="0" width="600" align="center">
                            <tr>
                                <td valign="bottom" height="45"></td>
                            </tr>
                            <tr>
                            
                                <#--  <td bgcolor="#FFFFFF" height="30"><img
                                        src="<@url path="/images/box-shadow.png"/>"/></td>  -->
                            </tr>
                            <tr>
                                <#assign settingsLink><a
                                        href='[@url name="users:preferences" user=recipient plug=recipient.plug abs=true /]#/notifyTab'><@trans key="thub.notifications.base.settingsLink" /></a></#assign>
                                <td bgcolor="rgba(65, 65, 65, 0.1)"
                                    style="padding:10px 20px 25px 20px; font-family:Arial, Helvetica, sans-serif; font-size:11px; color:#414141;background-color:rgba(65, 65, 65, 0.1); "><@trans key="thub.notifications.base.settings" params=[settingsLink]/></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
</@email.html>

<@email.text>
[@trans key="notifications.mail.hello" params=[userUtils.displayName(recipient)]/]

${msg.text}

-------------------------
<@trans key="notifications.mail.preferences"/>:
[@url name="users:preferences" user=recipient plug=recipient.plug abs=true /]#notificationsPanel
</@email.text>