//alert(jsonFlightData);
var flightListing = angular.module('flightListing',[]);

var flightListingCont = {};

flightListingCont.flightListingController = function($scope, $http){
    var json = {};
    //$http.get("/bin/FlightSearchServlet").success(function(response) {$scope.json = response;});
    $scope.json = jQuery.parseJSON(jsonFlightData);

     $scope.bookFlight = function(objVal)
     {
         $http.get("/bin/FlightSearchServlet?sdfd=sdfds&sdfsd=dfg").success(function(response) {
             	$('.fare-summary').show(200);
             	$('#flight_name').html(objVal.name);
                $('#from_city').html(objVal.fromCity+'(&rlm;'+objVal.fromCode+')');
                $('#to_city').html(objVal.toCity+'(&rlm;'+objVal.toCode+')');
                $('#date_time').html(objVal.oDate+' &nbsp;&nbsp; '+objVal.depart+' - '+objVal.arrive);

             	if(objVal.numberOfAdults == '')
                    objVal.numberOfAdults=1;

				var taxes = objVal.sourceAirportTax + objVal.destinationAirportTax;

                $('#numberOfAdults_summary').html(objVal.numberOfAdults+(objVal.numberOfAdults<=1?' adult':' adults'));
                $('#fare').html('&euro; '+objVal.priceAmt);
        
                var flightPrice=objVal.priceAmt*objVal.numberOfAdults;
                //$('#flightPrice').html('&euro; '+flightPrice);

                $('#taxes').html('&euro; '+taxes);
        
                var totalPrice=parseInt(flightPrice)+parseInt(taxes);
                $('#totalPrice').html('&euro; '+totalPrice);


				setCookie('flight_name', objVal.name, 1);
             	setCookie('flightNumber', objVal.flightNumber, 1);
             	setCookie('id', objVal.id, 1);
                setCookie('from_city', objVal.fromCity, 1);
                setCookie('fromCode', objVal.fromCode, 1);
                setCookie('to_city', objVal.toCity, 1);
                setCookie('toCode', objVal.toCode, 1);
                setCookie('oDate', objVal.oDate, 1);
				setCookie('fromAirport', objVal.fromAirport, 1);
				setCookie('toAirport', objVal.toAirport, 1);
             	setCookie('depart', objVal.depart, 1);
				setCookie('arrive', objVal.arrive, 1);
             	setCookie('duration', objVal.duration, 1);
             	setCookie('airportandCode',objVal.toAirport + ' (' + objVal.toCode + ')', 1);

             	setCookie('numberOfAdults', objVal.numberOfAdults, 1);
                setCookie('priceAmt', objVal.priceAmt, 1);

             

                setCookie('taxes', taxes, 1);
                setCookie('logoName', objVal.logoName, 1);

         });
         //alert(objVal.toSource());
        //ajax
        //ajax success, price,flightName, fromCity, fromCode, toCity, toCode, depart, arrive, priceAmt, administrationFee
        //$('#fareCalPrice').html(price);


    }
    /*  $.ajax({
         type: 'POST',    
		 url:'/bin/FlightSearchServlet',
         data:'fromLoc=<%= fromLoc %>',
			//data:'fromLoc='+$('#fromLoc').val()+'&toLoc='+ $('#toLoc').val()+'&oDate='+ $('#oDate').val()+'&numberOfAdults='+ $('#numberOfAdults').val(),
		   success: function(msg){
               		json = jQuery.parseJSON(msg);
              $scope.json = json;//jQuery.parseJSON(msg); 
              // alert($scope.json);

              var json = jQuery.parseJSON(msg); 
               //	alert(msg);
             var city = json.city;


              $('#resultJson').val("Returned From Servlet: " + json);  


              $.each(json , function(idx, obj) { 		    

                  var flightName = obj.name;
                  var iconpath = "/content/dam/mywebsite/flightIcons/" + flightName + ".png";

                  var html = '<tr class="box2all"><td><span class=""><img src="'+iconpath+'" height="23" width="27" alt="'+ flightName +'" title="'+ flightName+'"></span><small>'+obj.name+'</small></td><td class="">'+obj.depart+'</td><td class="">'+obj.arrive+'</td><td class="duration">'+obj.duration+'</td><td>'+obj.price+'</td><td><a herf="javascript:void(0);" class="booking pure-button" onclick="bookFlight('+idx+',\''+obj.price+'\',\''+flightName+'\',\''+obj.fromCity+'\',\''+obj.fromCode+'\',\''+obj.toCity+'\',\''+obj.toCode+'\',\''+obj.depart+'\',\''+obj.arrive+'\',\''+obj.priceAmt+'\',\''+obj.administrationFee+'\');">Book</a></td></tr>';
                               $('#listFlightDataNabBody').append(html);
			});

         }

		 });*/

   // $scope.json = json;
    	 /*$scope.json= [
          {name:'Virgin',depart:'9:30', arrive:'23:55',duration:'17h 55m',price:'Rs.31,545',fromCity:'Kolkata',fromCode:'KOL',toCity:'Delhi',toCode:'DEL',priceAmt:'31545',administrationFee:'2461'},
          {name:'Jet',depart:'11:30', arrive:'22:55',duration:'14h 55m',price:'Rs.81,545',fromCity:'Kolkata',fromCode:'KOL',toCity:'Delhi',toCode:'DEL',priceAmt:'81545',administrationFee:'7965'},
          {name:'Virgin',depart:'8:15', arrive:'23:34',duration:'17h 55m',price:'Rs.31,545',fromCity:'Kolkata',fromCode:'KOL',toCity:'Delhi',toCode:'DEL',priceAmt:'31545',administrationFee:'5462'},
          {name:'Virgin',depart:'9:30', arrive:'20:55',duration:'17h 55m',price:'Rs.41,546',fromCity:'Kolkata',fromCode:'KOL',toCity:'Delhi',toCode:'DEL',priceAmt:'41546',administrationFee:'4946'}

    ];*/


}

flightListing.controller(flightListingCont);

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}