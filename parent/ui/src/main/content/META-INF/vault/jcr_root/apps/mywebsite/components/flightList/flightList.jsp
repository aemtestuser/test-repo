<%--

  Display Users List component.

  Used to Display List of Info from JCR

--%><%
%>

<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>
<%@page import="org.apache.sling.commons.json.*,java.sql.*" %>
<%@ page import="java.util.Iterator,
        com.day.text.Text, 
        com.day.cq.wcm.api.PageFilter, com.day.cq.wcm.api.Page" %>
            <%@page import="java.util.Locale,java.util.ResourceBundle,com.day.cq.i18n.I18n"%>
<%
        String fromLoc=request.getParameter("fromLoc")==null? "":request.getParameter("fromLoc");
		String toLoc=request.getParameter("toLoc")==null? "":request.getParameter("toLoc");
        String oDate=request.getParameter("oDate")==null? "":request.getParameter("oDate");
//String oDate ="02/06/2077";
		String numberOfAdults=request.getParameter("numberOfAdults")==null? "":request.getParameter("numberOfAdults");
// out.print("fromLoc"+fromLoc);

%>
<%@include file="flightData.jsp"%>
<%
    //out.println("errdata:"+errdata);
    //out.println("OutPut2:"+air_name);
//out.println("OutPut2:"+jsonFlightData);
%>
<link rel="stylesheet" href="/apps/mywebsite/components/flightList/myClientLibs/DisplayStyle.css">
<link rel="stylesheet" href="/apps/mywebsite/components/flightList/myClientLibs/bootstrap.css">
<script src="/apps/mywebsite/components/flightList/myClientLibs/jquery-min.js" type="text/javascript"></script>
<script src="/apps/mywebsite/components/flightList/myClientLibs/angular.js" type="text/javascript"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<html>
<title>Adobe CQ Dynamic Display Information Page</title>
<script>
    var jsonFlightData = '<%=jsonFlightData%>';

	var numberOfAdults = '<%=numberOfAdults%>';

    // alert(jsonFlightData);

    function setRowBgColor(idx){ 
	var trBgClass='';
	if(idx %2 ==0){
		trBgClass ='even-row-bgcolor';
	}
	else{
		trBgClass ='odd-row-bgcolor';
	}
	return trBgClass;
}


</script>
    <script src="/apps/mywebsite/components/flightList/myClientLibs/angularScript.js" type="text/javascript"></script>

<title>Adobe CQ Sling Mobile Page</title>
 <cq:setContentBundle/>
<body>
 <%

final Locale pageLocale = currentPage.getLanguage(false);
final ResourceBundle resourceBundle = slingRequest.getResourceBundle(pageLocale);
I18n i18n = new I18n(resourceBundle);

%>
<div class="table-responsive">
<table cellspacing="0" cellpadding="0" id="listFlightDataNab" ng-app="flightListing" ng-controller="flightListingController" class="table1">
    <%
    	if(count == 0){
    %>
    No data available
    <% 
		}
        else if(count > 0) {
    %>
    <thead>
        <tr class="listHeadingNabHead">
                <th colspan="6"><input type="text" ng-model="airlinesval" placeholder="Type here to Search for Airlines or Depart or Arrive or Duration or Price" class="searchFields"/></th>								
        </tr>

        	<tr class="listHeadingNabHead">
                <th><a href="javascript:void(0);"  ng-click="orderByField='name'; reverseSort = !reverseSort"><%= i18n.get("Airlines")%><span ng-show="orderByField=='name';">&#9660;</span></a></th>								
                <th><a href="javascript:void(0);"  ng-click="orderByField='depart'; reverseSort = !reverseSort"><%= i18n.get("Depart")%></a> <span ng-show="orderByField == 'depart'">&#9660;</span></th>
                <th><a href="javascript:void(0);"  ng-click="orderByField='arrive'; reverseSort = !reverseSort"><%= i18n.get("Arrive")%></a> <span ng-show="orderByField == 'arrive'">&#9660;</span></th>
                <th><a href="javascript:void(0);"  ng-click="orderByField='duration'; reverseSort = !reverseSort"><%= i18n.get("Duration")%></a> <span ng-show="orderByField == 'duration'">&#9660;</span></th>		
            	<th><a href="javascript:void(0);"  ng-click="orderByField='price'; reverseSort = !reverseSort"><%= i18n.get("Price")%></a> <span ng-show="orderByField == 'price'">&#9660;</span></th>
                <th></th>
        </tr>

    </thead>
    <tbody>
        <tr class="box2all" ng-repeat="x in json | filter:airlinesval:departval:arriveval:durationval:priceval | orderBy:orderByField:reverseSort">
            <td>
                <span class="">
                    <img src="/content/dam/mywebsite/flightIcons/{{x.logoName}}.png" height="23" width="27" alt="{{x.name}}" title="{{x.name}}" />
                </span>
                <small>{{x.name}}</small>
            </td>
            <td class="">{{x.depart}}</td>
            <td class="">{{x.arrive}}</td>
            <td class="duration">{{x.duration}}</td>
            <td>{{x.priceAmt}}</td>
            <td>


                <a href="javascript:void(0);" class="booking pure-button" ng-click="bookFlight(x);"><%= i18n.get("Book") %></a>
            </td>
        </tr>
    </tbody>
    <!--<tbody id="listFlightDataNabBody" >'{{x.idx}}','{{x.price}}','{{x.name}}','{{x.fromCity}}','{{x.fromCode}}','{{x.toCity}}','{{x.toCode}}','{{x.depart}}','{{x.arrive}}','{{x.priceAmt}}','{{x.administrationFee}}'
    </tbody>-->
    <%
        }
    %>
</table>
    </div>


</body>

</html>

