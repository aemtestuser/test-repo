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




<div id = "myTile" class="canpaignTileContentNab">

<%
   Image image = new Image(resource, "image");
 image.setSelector(".img"); // use image script

//String linkToURL = properties.get("Heading");

	%>
	<!--a href="<%= properties.get("URL")%>" class="track-fromHome"-->
    <a href="http://en.wikipedia.org/wiki/<%= properties.get("Heading")%>" class="track-fromHome" target="_blank">
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
<style>
    .contentContainerRightNab .desc .country-name {
    color: #0C3B8E;
    font: 24px/24px "CoreSansN25";
    text-transform: uppercase;
}

 .contentContainerRightNab .desc .text {
    color: #fff;
    font: 14px/18px "CoreSansN45";
    margin: 8px 0 2px;
}
</style>