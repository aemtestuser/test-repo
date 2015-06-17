<%@include file="/libs/foundation/global.jsp"%>



<cq:include path="clientcontext" resourceType="cq/personalization/components/clientcontext"/>

<div class="mainCenterContainerNab">
    <div class="wideSliderNab">
	<div class="row">
<div class="contentContainerLeftNab sliderHeight col-xs-12 col-sm-12 col-md-8">
        <cq:include path="wideSlider" resourceType="foundation/components/parsys"/>
        </div>
<div class="contentContainerRightNab col-xs-12 col-sm-12 col-md-4 ">
        <cq:include path="SearchRight" resourceType="foundation/components/parsys"/>
        </div>
         <div class="clearFixNab"></div>
    </div>
</div>
    <div class="contentContainerNab row no-gutter">
        <div class="contentContainerLeftNab col-xs-12 col-sm-12 col-md-8">
            <div class="smallTileNab">
                <div class ="canpaignTileSmallNab pullLeftNab col-md-12 col-xs-12 col-sm-12 col-lg-4">
                    <cq:include path="centre" resourceType="foundation/components/parsys"/>
                </div>
                <div class ="canpaignTileSmallNab pullLeftNab col-md-12 col-xs-12  col-sm-12  col-lg-4">
                    <cq:include path="centre2" resourceType="foundation/components/parsys"/>
                </div>
                <div class ="canpaignTileSmallNab pullLeftNab col-md-12 col-xs-12   col-sm-12  col-lg-4">
                    <cq:include path="centre3" resourceType="foundation/components/parsys"/>
				</div>

                <div class="clearFixNab"></div>
            </div>
            <div class="twoThirdFullContentNab col-md-12 col-sm-12">
            	<cq:include path="bigTile" resourceType="foundation/components/parsys"/>
            </div>

        </div>
        <div class="contentContainerRightNab col-xs-12 col-sm-8 col-md-4 ">
            <div class ="canpaignTileBigNab">
            	<cq:include path="sidetile" resourceType="foundation/components/parsys"/>
            </div>
        </div>
        <div class="clearFixNab"></div>
		<div class="contentContainerFullPageWidth row">
				<div class="contentContainerRightNab col-xs-12">
					<cq:include path="fullpagewidth" resourceType="foundation/components/parsys"/>
			</div>
		</div>
    </div>
</div>
<style>
     .pullLeftNab{float:left;}
    .clearFixNab{clear:both;}
    /*.contentContainerLeftNab{float:left; width:70%;}
    .contentContainerRightNab{float:right;width:30%;} 
    .canpaignTileSmallNab{width:33%;}*/
    .canpaignTileBigNab{width:100%;} 
    li{list-style:none;}
    .sliderHeight li img{height:100%;}
    /* <div class ="canpaignTileSmallNab pullLeftNab col-md-4">
                    <cq:include path="centre3" resourceType="foundation/components/parsys"/>
</div> */
</style>