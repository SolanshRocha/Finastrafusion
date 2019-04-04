<@teamhub.widgets "system.footer/before" />

<section id="bottom">
    <div class="extra">

        <div class="extra-inner">

            <div class="container">

            <#assign footerReplace><@teamhub.widgets location="system.footer" nocontainer=true /></#assign>
            <#if footerReplace?? && footerReplace?trim?has_content>
            ${footerReplace}
            <#else>
                <div class="row">
                    <div class="span12 text-center">
                        <ul class="inline">
                            <li><a href="<@spring.url "/page/about.html"/>" ><@trans key="thub.general.about" /></a></li>
                            <li><a href="<@spring.url "/page/faq.html"/>" ><@trans key="thub.general.faq" /></a></li>
                            <li><a href="<@spring.url "/page/privacy.html"/>" ><@trans key="thub.general.privacy" /></a></li>
                        </ul>
                        Copyright &copy; 2010-16 <a href="http://dzone.com/corporate/about">DZone, Inc.</a> - All rights reserved.
                    </div>
                </div>
            </#if>

                <div class="row">
                    <div class="span12 text-center">
                        <p class="footer-copyright" style="font-size: 85%">
                            <a href="http://www.dzonesoftware.com/products/answerhub-question-answer-software?utm_source=appfooter&utm_medium=web&utm_campaign=Application%2BReferral%2B" style="color: #fff;"><img src="<@url path="/images/ah-logo-white.png"/>">
                            <br><@trans key="label.what_are_we"/></a>
                        </p>
                        <#--<a href="http://answerhub.com"><img src="<@url path="/images/ah-logo-white.png"/>"></a><br/>-->
                    </div>

                </div> <!-- /row -->

            </div> <!-- /container -->

        </div> <!-- /extra-inner -->

    </div> <!-- /extra -->
</section>
<@teamhub.widgets "system.footer/after" />