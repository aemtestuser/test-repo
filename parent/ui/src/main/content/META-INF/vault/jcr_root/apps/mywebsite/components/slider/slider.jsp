<%--

  mySlider component.

  mySlider

--%><%
%>

<%@include file="/libs/foundation/global.jsp"%>
<%@ page import="com.day.cq.wcm.foundation.Image" %><%
%><%@page session="false" %>


<cq:includeClientLib categories="myslider.libs"/>

<style type="text/css">
.sliderwrapWide{
     width:100%;
    }
.sliderwrapTwoThird{
     width:60%;
    }
	.bx-wrapper .bx-caption span{padding:5px; height:40px; width:80%;}
</style>
 <%

     Image image1 = new Image(resource, "image1");
 image1.setSelector(".img"); // use image script


   Image image2 = new Image(resource, "image2");
 image2.setSelector(".img"); // use image script

  Image image3 = new Image(resource, "image3");
 image3.setSelector(".img"); // use image script

 Image image4 = new Image(resource, "image4");
 image4.setSelector(".img"); // use image script

	%>

	<div class="sliderwrapWide">

<ul class="bxsliderWide">


  <!-- <li><img src="/content/dam/geometrixx-outdoors/brand/brand_3b_4_c05.jpg" title="dess2"/></li> -->
    <li><% image1.draw(out); %></li>
    <li><% image2.draw(out); %></li>
    <li><% image3.draw(out); %></li>
     <li><% image4.draw(out); %></li>


</ul>
</div>
<!-- <div class="sliderwrapTwoThird">

<ul class="bxsliderTwoThird">
  <li><img src="/content/dam/mywebsite/tree_root.jpg" title="dess1" /></li>
  <li><img src="/content/dam/mywebsite/hill_road.jpg" title="dess2"/></li>
  <li><img src="/content/dam/mywebsite/tree_root.jpg" title="dess3"/></li>

</ul>
</div> -->

<script>
        $(document).ready(function(){
            $('.bxsliderWide').bxSlider({
              mode: 'fade',
            speed: 1000,
            auto:true,
            captions: true
    
            });
         /*$('.bxsliderTwoThird').bxSlider({
              mode: 'fade',
            speed: 1000,
            auto:true,
            captions: true
    
   			 });*/
       });
   </script>
<style>
@media screen and (max-width:480px){
        footer{text-align:center;}
	.wideSlider.parsys {
                    /*height: 233px;*/
    margin-top: 25px;
}
                .row.no-gutter {
  margin-left: 0;
  margin-right: 0;
}

.row.no-gutter [class*='col-']:not(:first-child),
.row.no-gutter [class*='col-']:not(:last-child) {
  padding-right: 15px;
  padding-left: 15px;
}
}</style>
