<%--

  myTile component.

  Tile Component

--%><%
%><%@include file="/libs/foundation/global.jsp"%>
<%@ page import="com.day.cq.wcm.foundation.Image" %><%
%><%@page session="false" %><%
%><%

%>
<cq:includeClientLib categories="bigTile.libs"/>



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
            <div class="disp-none">
                <span class="offer-description"><%=properties.get("hoverText")%>
                </span>
       		</div>
        </div>

    </a>
</div>

<!--cq:includeClientLib categories="bigTile.libs" /-->

<script>

        $('.canpaignTileContentNab').mouseover(function(){
            $('.desc').finish().fadeTo('slow',0);
            $('.disp-none').finish().fadeTo('slow',1);
         });


         $('.canpaignTileContentNab').mouseout(function(){
            $('.disp-none').finish().fadeTo('slow',0);
            $('.desc').finish().fadeTo('slow',1);
           });


</script>