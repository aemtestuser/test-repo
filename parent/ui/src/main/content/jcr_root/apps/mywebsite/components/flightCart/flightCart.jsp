<%--

  Fair Calculator component.

  This is Fair calculator

--%><%
%><%@include file="/libs/foundation/global.jsp"%>
  <%@ page import="java.util.Iterator,
        com.day.text.Text, 
        com.day.cq.wcm.api.PageFilter, com.day.cq.wcm.api.Page" %>
            <%@page import="java.util.Locale,java.util.ResourceBundle,com.day.cq.i18n.I18n"%><%
%><%@page session="false" %><%
%><%
	// TODO add you code here
%>
<%

final Locale pageLocale = currentPage.getLanguage(false);
final ResourceBundle resourceBundle = slingRequest.getResourceBundle(pageLocale);
I18n i18n = new I18n(resourceBundle);

%>
<cq:includeClientLib categories="flightCart.libs"/>

<div class="cart_container">
	<h1><%=i18n.get("Book in three Simple Steps")%></h1>
	<div class="cartSection stepOpen" id="stepOne">
		<div class="cartSectionHeading">
			<p class="pullRight subHeading"><%=i18n.get("Review your flight details")%> </p>
			<h2><span id="step1Cart" class="cartsteps">1</span> <%=i18n.get("Itinerary")%></h2>
		</div>
        <div class="cartStepDetails">
			<div class="cartStepDetailsitinerary">
                <h1><span id="from_city" style="color:black;"></span> <span class="smallText">to</span>  <span id="to_city" style="color:black;"></span> <span class="smallText" id="oDate">Tuesday 30 Dec 2014</span></h1>
						<ul class="itinerarySummary">
                            <li class="vendor">
                                <div class="airLogo">
                                    <span class="airLogo">
                                        <img alt="Airlines Logo" id="airlinesLogo" src="/content/dam/mywebsite/flightIcons/Jet.png">
                                    </span>								
                                </div>
                                <div class="airlineName">
									<span class="name bigTextsmall" id="flight_name"></span>
									<span class="smallTextsmall" id="flightNumberId"></span>
									<span class="smallTextsmall"><%=i18n.get("Economy")%></span>
                                </div>
							</li>
							<li class="start">
                                <span class="placeTime"><span id="fromCode"></span> <strong id="depart"></strong></span> 
									<span class="bigTextsmall" id="oDate1"></span>									
									<span class="smallTextsmall" id="fromAirport"></span>
							</li>
							<li class="details">
								<abbr class="duration weak" title="" id="duration"></abbr>
							</li>
							<li class="end">
								<span class="placeTime"><strong id="arrive">20:35</strong> <span id="toCode"></span></span> 
									<span class="bigTextsmall" id="oDate2"></span>									
									<span class="smallTextsmall" id="toAirport"></span>
							</li>	
							<li class="smallTextsmall">
								<span class="smallTextsmall"><strong><%=i18n.get("Baggage information")%></strong></span>
								<span class="smallTextsmall"><%=i18n.get("Check-in")%>: 15 KG / <%=i18n.get("person")%> <%=i18n.get("Cabin")%>: 7 KG / <%=i18n.get("person")%></span>
								<a href="javascript:void(0);" class="weak"><%=i18n.get("more info")%></a>
							</li>
						</ul>
					</div> 	
			<div class="couponHolder">
						<label class="bigTextsmall" id="discountMsg"><%=i18n.get("Have a coupon code or gift card to redeem?")%></label>
						<div class="applyCouponBUtton">
							<input type="text" autocorrect="off" autocomplete="off" placeholder="Enter your coupon or gift card" title="Enter your coupon or gift card" class="couponGiftCardField" id="coupon" name="coupon">&nbsp;
							<a class="applyCodeButton" id="btnApplyCode" href="javascript:void(0)"><%=i18n.get("Apply code")%></a>
						</div>
					</div>
            <% String s="";
               s+=i18n.get("Continue booking");
            %>
			<div class="totalAmount">
				<span class="totalbah"><%=i18n.get("Total")%></span>
				<strong><span class="totalbah">Rs.</span> <span id="total_amount">14,308</span></strong> 
                <span class="smallTextsmall"><span id="numberOfAdults">1</span> <%=i18n.get("adult(s)")%></span>
                <input type="button" value="<%=s%>" class="bookingContinue" onclick="chnageForm('stepOne','stepTwo');">
			</div>
		</div>
	</div>
	<div class="cartSection stepClose" id="stepTwo">
    	<div class="cartSectionHeading">
			<p class="pullRight subHeading"><%=i18n.get("Tell us who's travelling?")%></p>
			<h2><span id="step1Cart" class="cartsteps">2</span> <%=i18n.get("Travellers")%></h2>
		</div>
		<div class="cartStepDetails donotShow">
			<%=i18n.get("Add Content Step 2")%>
            <input type="button" value="<%=s%>" class="bookingContinue" onclick="chnageForm('stepTwo','stepThree');">
		</div>
    </div>
	<div class="cartSection stepClose" id="stepThree">
    	<div class="cartSectionHeading">
			<p class="pullRight subHeading"><%=i18n.get("How would you like to pay?")%></p>
			<h2><span id="step1Cart" class="cartsteps">3</span> <%=i18n.get("Payment")%></h2>
		</div>
		<div class="cartStepDetails donotShow">
			<%=i18n.get("Add Content Step 3")%>
            <input type="button" value='<%=i18n.get("Payment")%>' class="bookingContinue">
		</div>
    </div>
</div>
<script>
function chnageForm(txt, txt1){
	$('#'+txt).removeClass('stepOpen').addClass('stepClose');
	$('#'+txt+' .cartStepDetails').addClass('donotShow');
	$('#'+txt1).removeClass('stepClose').addClass('stepOpen');
	$('#'+txt1+' .cartStepDetails').removeClass('donotShow');
}
</script>
