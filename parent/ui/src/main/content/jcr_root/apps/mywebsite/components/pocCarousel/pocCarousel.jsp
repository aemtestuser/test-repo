<%@include file="/libs/foundation/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<cq:includeClientLib categories="jquerysamples" />
<style type="text/css">
.sliderwrap{
     float:left;
     width:80%;
    }
    .bx-wrapper .bx-caption span{padding:5px; height:40px; width:80%;}
</style>
<script>
        $(document).ready(function(){
        $('.bxslider').bxSlider({
          mode: 'fade',
        speed: 2000,
        auto:true,
        captions: true
        });
       });
</script>
</head>
<body>
	<div class=”sliderwrap”>

		<ul class="bxslider">
          <li><a href="${properties.path1}.html"><img src="${properties.image1}" title="${properties.abstracttext1}"/></a></li>
		  <li><a href="${properties.path2}.html"><img src="${properties.image2}" title="${properties.abstracttext2}"/></a></li>
		  <li><a href="${properties.path3}.html"><img src="${properties.image3}" title="${properties.abstracttext3}"/></a></li>
		  <li><a href="${properties.path4}.html"><img src="${properties.image4}" title="${properties.abstracttext4}"/></a></li>

		</ul>
	</div>
</body>
</html>