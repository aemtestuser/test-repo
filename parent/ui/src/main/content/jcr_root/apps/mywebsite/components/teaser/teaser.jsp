<%@page session="false"%><%--
  ************************************************************************
  ADOBE CONFIDENTIAL
  ___________________

  Copyright 2011 Adobe Systems Incorporated
  All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Adobe Systems Incorporated and its suppliers,
  if any.  The intellectual and technical concepts contained
  herein are proprietary to Adobe Systems Incorporated and its
  suppliers and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe Systems Incorporated.
  ************************************************************************

  ==============================================================================
  DEPRECATED since CQ 5.6.1.

  Use the target component (cq/personalization/components/target) instead, which
  provides better authoring of experiences/teaser variants and is integrated
  directly in the authoring UI for all compoentns ("Target" action).
  ==============================================================================

--%><%@include file="/libs/foundation/global.jsp"%><%!
%><%@page import="
       java.io.StringWriter,
       com.day.cq.wcm.api.WCMMode,
       com.day.cq.wcm.core.stats.PageViewStatistics,
       com.day.text.Text,
       java.util.ResourceBundle,
	   com.day.cq.i18n.I18n,
	   com.day.cq.personalization.TargetedContentManager,
	   com.day.cq.personalization.ClientContextUtil,
	   org.apache.sling.commons.json.JSONObject,
	   org.apache.jackrabbit.api.security.user.*, 
	   com.day.cq.security.User,
	   com.day.cq.commons.jcr.*,
	   com.day.cq.security.profile.Profile,
	   org.apache.sling.commons.json.JSONArray" %><%
%>
<%@page import="java.util.Locale,java.util.ResourceBundle,com.day.cq.i18n.I18n,com.day.cq.personalization.UserPropertiesUtil"%>
<%@page import="com.adobe.granite.security.user.UserProperties ,  javax.jcr.Node ,org.apache.sling.api.resource.ResourceResolver"%>
<%@ page import=" org.apache.sling.api.resource.Resource" %>

<cq:includeClientLib categories="personalization.kernel"/><%@taglib prefix="personalization" uri="http://www.day.com/taglibs/cq/personalization/1.0" %><%
	   
    final ResourceBundle resourceBundle = slingRequest.getResourceBundle(null);
    I18n i18n = new I18n(resourceBundle);

    final TargetedContentManager targetedContentManager = sling.getService(TargetedContentManager.class);

    final String campaignPath = properties.get("campaignpath", String.class);
    final String strategyPath = properties.get("strategyPath", "");
    final String location = properties.get("location", resource.getPath());
	String toLoc = request.getParameter("toLoc")==null? "":request.getParameter("toLoc");



if(toLoc.equals("")){
String loggedUserName="";
   String loggedName="";
   Cookie cookie = null;
   Cookie[] cookies = null;
   cookies = request.getCookies();
   if( cookies != null ){
      for (int i = 0; i < cookies.length; i++){
         cookie = cookies[i];

         if (cookie.getName().equals("airportandCode")) {
             // out.print("Yo cookie!!");
             out.print(cookie.getName()+" : " + cookie.getValue( ));
			toLoc = cookie.getValue();

         }

      }
   }



}
             // out.print("userName : " + cookie.getValue( ));
             //loggedUserName = cookie.getValue();

//out.print(currentNode.getPath()+": " +toLoc);
//String pagePath = currentPage.getPath();
//out.print(pagePath);
//Resource res = resourceResolver.getResource("/content/DessPoc/en");
//Node node1 = resource.adaptTo(Node.class);
//out.print(resource.getParent());
//Node jcrnode = node1.getNode("jcr:content");
//jcrnode.setProperty("location",toLoc);
//currentNode.setProperty("location",toLoc);
//Resource res = currentPage.getContentResource("jcr:content");
//Node node = resource.adaptTo(Node.class);
//out.print(jcrnode.getPath());
//pageProperties.set("location",toLoc);
//currentPage.getProperties().("location","toLoc");

//Session session = resourceResolver.adaptTo(Session.class);
//UserManager userManager = resourceResolver.adaptTo(UserManager.class);
    /* to get the current user */
//Authorizable auth = userManager.getAuthorizable(session.getUserID());
//out.print(auth);
//if (auth.hasProperty("profile/familyName")) {
// String familyName = auth.getProperty("profile/familyName")[0].getString();   
//	out.print(familyName);
// }

//Profile profile = null;
//profile = resourceResolver.adaptTo(User.class).getProfile();
//out.print(profile.getFamilyName() );

//out.print(ClientContextUtil.get('profile/authorizableId'));

    String strategy = "";
    if (strategyPath.length() > 0) {
        strategy = Text.getName(strategyPath);
        strategy = strategy.replaceAll(".js", "");
    }

    String campaignClass = "";
    if (campaignPath != null) {
        Page campaignPage = pageManager.getPage(campaignPath);
        if (campaignPage != null) {
            campaignClass = "campaign-" + campaignPage.getName();
        }
    }

    //try to generate a "friendly" id for the div where teaser will be placed
    String targetDivId = ClientContextUtil.getId(resource.getPath());

    final PageViewStatistics pwSvc = sling.getService(PageViewStatistics.class);
    String trackingURLStr = null;
    if (pwSvc!=null && pwSvc.getTrackingURI() != null) {
        trackingURLStr = pwSvc.getTrackingURI().toString();
    }

    JSONObject teaserInfo = targetedContentManager.getTeaserInfo(resourceResolver, campaignPath, location);
    JSONArray allTeasers = teaserInfo.getJSONArray("allTeasers");
    String defaultTeaser = teaserInfo.optString("defaultTeaserPath");

    final String TEASER_SUFFIX = "/_jcr_content/par.html";

    if (allTeasers.length() > 0) {
        %>
        <script type="text/javascript">$CQ(function() {
            initializeTeaserLoader(<%=allTeasers%>, "<%=strategy%>", "<%=targetDivId%>", "<%=(WCMMode.fromRequest(request) == WCMMode.EDIT)%>", "<%=trackingURLStr%>", "<%=resource.getPath()%>");
        });</script>
        <div id="<%= xssAPI.encodeForHTMLAttr(targetDivId) %>" class="campaign <%= xssAPI.encodeForHTMLAttr(campaignClass) %>"><%
            if (defaultTeaser != null && defaultTeaser.length() > 0) {
                //include a default teaser into a noscript tag in case of no JS (SEO...)
                StringWriter defaultHtml = new StringWriter();
                pageContext.pushBody(defaultHtml);
                %><sling:include replaceSelectors="noscript" path="<%= defaultTeaser + TEASER_SUFFIX %>"/><%
                pageContext.popBody();

                %><noscript><%=defaultHtml%></noscript><%
            } %>
        </div> <%
    } else if (WCMMode.fromRequest(request) == WCMMode.EDIT) {
        %><style type="text/css">
            .cq-teaser-placeholder-off {
                display: none;
            }
        </style>
        <h3 class="cq-texthint-placeholder"><%=i18n.get("No active campaigns target this teaser") %></h3>
        <img src="/libs/cq/ui/resources/0.gif" class="cq-teaser-placeholder" alt=""><%
    }

UserProperties userProperties = slingRequest.adaptTo(UserProperties.class);
String [] a = userProperties.getPropertyNames();
for(int i=0;i<userProperties.getPropertyNames().length; i++){
     out.println(a[i]+"----"+userProperties.getProperty(a[i]));
}
Node node = userProperties.getNode();
node.setProperty("destinationCity",toLoc);
node.save();
             //out.print(node.getPath());




//Resource res = resourceResolver.getResource("/home/users/Dess/newUser");
//Node node = res.adaptTo(Node.class);
//node1.setProperty("destinationCity","Delhi");
//out.println("----"+node1.getPath() + node1.getProperty("interest").getString());
//node.save();

%>

<script>


   function getName(){
   var profilestore = CQ_Analytics.ClientContextMgr.getProperty('visitorId');
       var profilestore2 = CQ_Analytics.ClientContextMgr.getProperty('destinationCity');
    if(profilestore2){
        return profilestore2;
    } else {
        return null;
    }   
  } 
    //   alert('test'+getName());

CQ_Analytics.ProfileDataMgr.setProperty("destinationCity","<%= toLoc %>");

</script>
