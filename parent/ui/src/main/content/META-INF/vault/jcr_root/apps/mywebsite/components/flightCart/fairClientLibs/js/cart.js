$(document).ready(function(){

    $('#flight_name').html(getCookie('flight_name'));
    if( getCookie('id') == 'undefined' )
		$('#flightNumberId').html(getCookie('flightNumber'));
    else
    	$('#flightNumberId').html(getCookie('flightNumber')+'-'+getCookie('id'));

    $('#airlinesLogo')[0].setAttribute('src', (getCookie('flight_name')=='Jet')?'/content/dam/mywebsite/flightIcons/Jet.png':'/content/dam/mywebsite/flightIcons/Virgin.png');
    $('#from_city').html(getCookie('from_city'));
    $('#to_city').html(getCookie('to_city'));
    $('#oDate').html(getCookie('oDate'));
    $('#fromAirport').html(getCookie('fromAirport'));
    $('#toAirport').html(getCookie('toAirport'));
    $('#fromCode').html(getCookie('fromCode'));
    $('#toCode').html(getCookie('toCode'));
	$('#depart').html(getCookie('depart'));
    $('#arrive').html(getCookie('arrive'));
    $('#duration').html(getCookie('duration'));
    $('#oDate1').html(getCookie('oDate'));
    $('#oDate2').html(getCookie('oDate'));
    $('#numberOfAdults').html(getCookie('numberOfAdults'));
	var total_amount = parseInt(getCookie('numberOfAdults')) * parseInt(getCookie('priceAmt')) + parseInt(getCookie('taxes'));
	$('#total_amount').html(total_amount);

    $('#btnApplyCode').click(function(){
        var discount=verifyCouponCode();
        if( discount>0 ) {
            var total=parseInt($('#total_amount')[0].innerHTML);
            var discountedTotal = total * (100-discount)/100;
            $('#total_amount').html(discountedTotal);
            $('#btnApplyCode').unbind();
            $('#btnApplyCode').hide(300);
            $('#discountMsg').html('Discount of '+discount+"% has been applied");
            $('#discountMsg').css({'color':'green'});
            $('#coupon')[0].setAttribute('disabled','disabled');
        }
        else{
            $('#discountMsg').html('Invalid Coupon Code or gift card! Please try again...');
            $('#discountMsg').css({'color':'red'});
        }
    });

    function verifyCouponCode(){
        var couponCodes = [
                { code:'WHJ10', discount:'10' },		//List of Coupon codes to verify from
                { code:'WHJ20', discount:'20' }
            ];
        var enteredCoupon = $('#coupon')[0].value;
        for(var i=0; i<couponCodes.length; i++)
            if(couponCodes[i].code == enteredCoupon)
                return couponCodes[i].discount;
		return 0;	
    }

});

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}