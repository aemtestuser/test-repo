<style>
    .exp{
    	font-family: "easyjet_rounded_lightRg",Arial,Verdana,Tahoma,Georgia,sans-serif;
        font-size:0.9em;
        border-radius:5px;
        z-index: 10;
        margin: 25px auto;
        width: 85%;

        border: 0 solid #FE7C00;
        border-width: 1px 0 0 1px;
        background: -webkit-linear-gradient(bottom, #FF5500, #FE7C00);
        background: linear-gradient(bottom, #FF5500, #FE7C00);
        background: -moz-linear-gradient(bottom, #FF5500, #FE7C00);
        box-shadow: 1px 1px 1px rgba(0,0,0,0.2);
        -moz-box-sizing: border-box;
        box-sizing: border-box;
	}
	.expHead{
        color: white;
        font-size: 20px;
    	padding: 17px 9px 10px;
	}
    .expContent{
        width: 99.85%;
        padding: 25px 9px 15px;
        background-color: whitesmoke;
        display: none;
    }
</style>
<cq:includeClientLib categories="expandable.libs"/>

    <div class="exp">
        <div class="expHead eh1">
            Customer Care <span style="float: right; vertical-align: middle;">+</span>
        </div>
        <div class="expContent ec1">
            To share your feedback about our services or express any grievance, let us know at:
			<h4><a href="tel:0080055435543">+8 00 55 435543</a> &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; <a href="mailto:feedback@example.com">feedback@example.com</a></h4>
        </div>
    </div>

    <div class="exp">
        <div class="expHead eh2">
            Baggage Policy <span style="float: right; vertical-align: middle;">+</span>
        </div>
        <div class="expContent ec2">
            Baggage allowances and policies can vary by airline - even if you buy your flights through this website. If your journey includes flights with multiple airlines, your checked baggage allowance may be different:<br/>
			<ul>
            	<li>   1. If your entire journey is with one airline, their checked baggage allowance will apply.<br/></li>
            	<li>   2. If your journey includes connecting flights with more than one airline, the checked baggage policy of the airline that operates the longer leg will apply. For example, if you fly with Virgin Airlines from Lisbon to London Heathrow and connect onto Jet Airways to Paris Orly, the leg with Jet Airways is longer and their baggage policy applies to the whole journey.</li>
            </ul>
        </div>
    </div>

    <div class="exp">
        <div class="expHead eh3">
            Contact us <span style="float: right; vertical-align: middle;">+</span>
        </div>
        <div class="expContent ec3">
            <b>Mailing Address</b><br>&nbsp;&nbsp;WhoozeJet Inc.,<br/>
                            &nbsp;&nbsp;56/Z, Mordorpara,<br/>
                            &nbsp;&nbsp;Isengard-999999<br/><br/>
			<h4><a href="tel:0080055435543">+8 00 55 435543</a> &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; <a href="mailto:feedback@example.com">feedback@example.com</a></h4>
        </div>
    </div>


<script>
    $(document).ready(function(){
    	$('.eh1').click(function(){
			$('.expContent').fadeOut();
			$('.ec1').fadeIn();
        });
    	$('.eh2').click(function(){
			$('.expContent').fadeOut();
			$('.ec2').fadeIn();
        });
    	$('.eh3').click(function(){
			$('.expContent').fadeOut();
			$('.ec3').fadeIn();
        });
	});
</script>