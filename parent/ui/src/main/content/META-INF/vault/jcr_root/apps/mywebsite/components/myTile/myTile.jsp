<%@include file="/libs/foundation/global.jsp"%>
<%@ page import="com.day.cq.wcm.foundation.Image" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>



<cq:includeClientLib categories="tile.libs"/>
    <%
   Image image = new Image(resource, "image");
 image.setSelector(".img"); // use image script


Date mydate = properties.get("mydate", new Date());
String dateString = mydate.toString();
//out.print(mydate);
//SimpleDateFormat format = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy");
//Date parsed = format.parse(dateString);
//out.print(parsed);

String months[] = {"January", "February", "March", "April",
                     "May", "June", "July", "August", "September",
                     "October", "November", "December"};

%>


<div class="flightSmallTileContainer col-sm-6 col-md-6 col-lg-12">
	<div class="smallTileNab">
		<div class="tileSmallImageNab">
			<div class="smallTilePriceNab">
				<span class="character characters-2">14</span>
				<div class="units-holder">
					<div class="currency"><%=properties.get("currency")%></div>
					<div class="units"><%=properties.get("units")%></div>
				</div>
			</div>

  <div><% image.draw(out); %></div>

		</div>
		<div class="tileSmallTextNab">
			<div class="inner">
				<div class="cut-overflow">
					<span class="city"><%=properties.get("origin")%></span>
					<span class="country"><%=properties.get("destination")%></span>
					<span class="desc"><%=properties.get("Alert")%></span>
					<div class="claim d-none">
						<span class="date">Available from <%=  mydate.getDate() %> of <%=  months[mydate.getMonth()] %></span>
							<div class="claim-button">
                                <a href="javascript:void(0);" class="track-fromBanner" onclick="setSearchVal('<%=properties.get("originAirport")%>', '<%=properties.get("destinationAirport")%>', '<%=properties.get("mydate" , new Date())%>');">
								<span class="text-mess">Get This Fare</span>
								<span class="icon-mess icon-font">&gt;</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
        <div class="clearFixNab"></div>
	</div>

</div>

<script>
    function setSearchVal(origin, destination, mydate){
        $("#fromLoc").focus();
        var temp = "";
        if(origin == "Larnaca"){
			temp = "Larnaca International Airport (LCA)";
            $("#fromLoc").val(temp);
        } else
        	$("#fromLoc").val(origin);

		if(destination == "Belgrade"){
			temp = "Belgrade Nikola Tesla Airport (BEG)";
            $("#toLoc").val(temp);
        } else
        	$("#toLoc").val(destination);


        //        $("#toLoc").val(destination);

        $("#oDate").val(mydate);
    }

    /*$("a.track-fromBanner").on("click", function() {
var origin ="";
	 origin = "<%=properties.get("origin")%>";
    alert(origin);

    $("#fromLoc").val(origin);


    var destination = "<%=properties.get("destination")%>";
    //alert(destination);
    $("#toLoc").val(destination);

    var mydate = "<%=properties.get("mydate" , new Date())%>";

    //alert(mydateTest);
    $("#oDate").val(mydate);



    });*/
</script>