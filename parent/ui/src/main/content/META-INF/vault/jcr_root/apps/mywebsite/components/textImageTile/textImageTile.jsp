<%--

  myTile component.

  Tile Component

--%><%
%><%@include file="/libs/foundation/global.jsp"%>
<%@ page import="com.day.cq.wcm.foundation.Image" %><%
%><%@page session="false" %><%
%><%

%>
<cq:includeClientLib categories="textImageTile.libs"/>

<p>This is a new Text Image Tile</p>

<%
   Image image = new Image(resource, "image");
 image.setSelector(".img"); // use image script
	%>
<div id = "myTile" class="canpaignTileContentNab">
    <a href="<%= properties.get("URL")%>.html" class="track-fromHome">
        <div class="picBoxNab">
            <% image.draw(out); %>
            <div class="desc">
                <div class="country-name"><%=properties.get("Heading")%></div>
                <div class="text"><%=properties.get("Description")%></div>
            </div>
        </div>
    </a>
</div>
