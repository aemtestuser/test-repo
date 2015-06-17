<%--

  Fair Calculator component.

  This is Fair calculator

--%>
    <%@ page import="java.util.Iterator,
        com.day.text.Text, 
        com.day.cq.wcm.api.PageFilter, com.day.cq.wcm.api.Page" %>
            <%@page import="java.util.Locale,java.util.ResourceBundle,com.day.cq.i18n.I18n"%>
<%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%
	// TODO add you code here
%>
<cq:includeClientLib categories="fareCal.libs"/>

<%

final Locale pageLocale = currentPage.getLanguage(false);
final ResourceBundle resourceBundle = slingRequest.getResourceBundle(pageLocale);
I18n i18n = new I18n(resourceBundle);

%>

<div class="container_fare">
    <div class="fare-summary" style="display:none;">
<h2><strong><%=	i18n.get("Fare Summary")%></strong></h2>
<ul id="" class="display-price">
<li>
<h3 class="open">
<span><%=i18n.get("Flight")%></span>
    <span class="value" id="flight_name" style="font-style:bold;"></span>
</h3>
<!--<ul class="display-detail" style="display: block;">
<li class=">You have no flights added yet.</li>
</ul>-->
</li>
</ul>
<ul class="itinerary">
<li class="last">
<span class="title">
<span class="bdi" id="from_city">&nbsp;
            </span>&nbsp;<%=i18n.get("TO")%>&nbsp;
<span class="bdi" id="to_city">&nbsp;</span>
</span>
    <span id="date_time">&nbsp;</span>
<span id="numberOfAdults_summary"></span>
<span class="left"><%=i18n.get("Base fare (per person)")%></span>
<span class="right" id="fare"></span>
<!--<span class="included-in-price left">Flight price</span>
<span class="included-in-price right" id="flightPrice"></span>-->
<span class="included-in-price left"><%=i18n.get("Taxes and fares")%></span>
<span class="included-in-price right" id="taxes"></span>
</li>
</ul>
<div  class="summary-total">
<p>a
<span class="total-text"><%=i18n.get("Total")%></span>
<span class="right" id="totalPrice"></span>
</p>
</div>
<p class="content summary-button">
<button type="submit" name="ControlGroupRibbonSelectView$ButtonSubmit" 
id="ControlGroupRibbonSelectView_ButtonSubmit" class="buttonCTA orangeWhite" value="Continue" onclick="location.href='Cart_Page.html'"  ><%=i18n.get("Add to Cart")+">>"%></button>
</p>
</div><!-- fare-summary-->
</div><!-- container-->


