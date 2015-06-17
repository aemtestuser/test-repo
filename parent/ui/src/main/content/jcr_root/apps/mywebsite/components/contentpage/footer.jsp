<%@include file="/libs/foundation/global.jsp"%><%@page import="java.util.Locale,java.util.ResourceBundle,com.day.cq.i18n.I18n"%>


<cq:setContentBundle/>
<% 
final Locale pageLocale = currentPage.getLanguage(false);
final ResourceBundle resourceBundle = slingRequest.getResourceBundle(pageLocale);
I18n i18n = new I18n(resourceBundle);
%>



<footer>
    <h3><%= i18n.get("This is the English Site") %></h3>
    <span class="copyright">&copy;2014 Tata Consultancy Services Incorporated. <%= i18n.get("All Rights Reserved")%></span>




<div class="clearFixNab"></div>
</footer>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-57926730-1', {
  'cookieDomain': 'none'
});
    ga('require', 'displayfeatures');

  ga('send', 'pageview');

</script>