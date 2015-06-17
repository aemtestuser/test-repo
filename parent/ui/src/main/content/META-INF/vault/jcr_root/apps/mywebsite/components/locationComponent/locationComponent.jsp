<%--

  locationComponent component.

  locationComponent for Google Maps

--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%
	// TODO add you code here
%>


<%
    // Getting Latitude for The Fez-Morocco page property

    //if(currentPage.getName().equals("fez_morocco"))
    //{out.print(pageProperties.get("latitude"));  out.print(currentPage.getPath()); }

    String location = properties.get("location",String.class);
    String mapType = properties.get("mapType",String.class);
    String zoom = properties.get("zoom",String.class);
	String latLong = properties.get("latLong",String.class);
// out.print(latLong);
 %>

<div style="padding-bottom:15px;">
<img src="https://maps.googleapis.com/maps/api/staticmap?center=<%= location %>&zoom=<%= zoom %>&size=600x300&maptype=<%= mapType %>
&markers=color:red%7Clabel:A%7C<%= latLong %>" title="<%= location %>"  alt="<%= location %>" width="348" height = "250" />
</div>
