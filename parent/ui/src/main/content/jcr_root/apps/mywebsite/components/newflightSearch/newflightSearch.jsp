<%--

  Flight Search component.

    
  This is the Flight Search Component

--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %>
<%@page import="org.apache.sling.commons.json.*,java.sql.*,java.util.*" %>
<%@ page import="java.util.Iterator,
        com.day.text.Text, 
        com.day.cq.wcm.api.PageFilter, com.day.cq.wcm.api.Page" %>
                        <%@page import="java.util.Locale,java.util.ResourceBundle,com.day.cq.i18n.I18n"%>


<%
        String fromLoc=request.getParameter("fromLoc")==null? "":request.getParameter("fromLoc");
		String toLoc=request.getParameter("toLoc")==null? "":request.getParameter("toLoc");
		String oDate=request.getParameter("oDate")==null? "":request.getParameter("oDate");
		String numberOfAdults=request.getParameter("numberOfAdults")==null? "":request.getParameter("numberOfAdults");

// out.print("fromLoc"+fromLoc);
%>
<%--@include file="airportNames.jsp"--%>



<!--Airport DATA Fetch BEGIN-->

<%
   String errdata="None";
	Map<String,String> airportNameMap=new LinkedHashMap<String,String>();
	Map<String,String> airportNameMap2=new LinkedHashMap<String,String>();

try {

    Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
System.out.println("Where is your MySQL JDBC Driver?");

    errdata = e.getMessage();
	e.printStackTrace();

}
Connection connection = null;
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/test","root", "root");

		} catch (SQLException e) {
			errdata = e.getMessage();
			e.printStackTrace();

		}
Statement stmt1 = null, stmt2 = null;
ResultSet rs1 = null, rs2 = null;

		try {
			stmt1 = connection.createStatement();
            String sql1 = "", sql2 = "";

            //sql = "SELECT id,txt_flight_name,txt_flightNumber,txt_depart_time,txt_arrival_time,txt_duration,txt_source_airport,txt_destination_airport,txt_iata_source,txt_iata_destination,txt_source_city,txt_destination_city,txt_source_country,txt_destination_country,num_fare,num_administration_fee from flight_details";
            //sql1 = "SELECT txt_iata_source,txt_source_airport,txt_destination_airport,txt_iata_destination from flight_details";
            sql1 = "SELECT txt_airport_iata, txt_airport_name from airport_master where txt_airport_iata NOT IN('LCA','BEG','OTP','BUD') order by txt_airport_name";
			rs1 = stmt1.executeQuery(sql1);
		    while(rs1.next()){
			    String airportIata=rs1.getString("txt_airport_iata");
                String airportName=rs1.getString("txt_airport_name");
                //String txt_destination_airport = rs1.getString("txt_airport_name");
                //String txt_iata_destination = rs1.getString("txt_airport_iata");
					airportNameMap.put( airportIata, airportName );
                airportNameMap2.put( airportIata, airportName );
                //airportNameMap2.put( txt_iata_destination, txt_destination_airport );
                /*stmt2 = connection.createStatement();
                sql2 = "SELECT txt_source_airport,txt_destination_airport,txt_iata_destination from flight_details where txt_iata_source='"+airportIata+"'";
                rs2 = stmt2.executeQuery(sql2);
                if(rs2.next()){
                    airportName = rs2.getString("txt_source_airport");
                   String txt_destination_airport = rs2.getString("txt_destination_airport");
                   String txt_iata_destination = rs2.getString("txt_iata_destination");
					airportNameMap.put( airportIata, airportName );
                    airportNameMap2.put( txt_iata_destination, txt_destination_airport );
                    }*/
            }



		} catch (Exception e) {
			errdata = e.getMessage();
			e.printStackTrace();

		}
		finally {
		//STEP 6: Clean-up environment
    	if(rs1 != null)
	    	rs1.close();
    	if(stmt1 != null)
	       stmt1.close();
         if(connection != null)
	        connection.close();
         }



%>
<!--Airport DATA Fetch END-->



<cq:includeClientLib categories="newsearch.libs" />

<script>
    $(document).ready(function() {


        var val1 = "<%=request.getParameter("fromLoc")%>"; 
        //alert(val1);

        if(val1 == "null" || val1 =="")
        {
            //alert("Option 1");
 			$('#readInfo').hide();
            $('#editInfo').show();
        }
        else {
            //alert("Option 2");
             $('#readInfo').show();
			$('#editInfo').hide();
        }

$( "#reSearchButton" ).click(function() {
    //alert( "Button Clicked" );
    $('#readInfo').hide();
    $('#editInfo').show();


});


});
</script>                 

<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<!-- script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script-->

<cq:setContentBundle/>
<% 
final Locale pageLocale = currentPage.getLanguage(false);
final ResourceBundle resourceBundle = slingRequest.getResourceBundle(pageLocale);
I18n i18n = new I18n(resourceBundle);
%>

<% 
    String s="";
 if(currentPage.getPath().contains("DessPoc")){

                if(currentPage.getPath().contains("en_GB")){
                    s+="/content/DessPoc/en_GB/FlightResults.html";
                }
                else if(currentPage.getPath().contains("en_IE")){
                    s+="/content/DessPoc/en_IE/FlightResults.html";
                }
               else if(currentPage.getPath().contains("fr_FR")){
                    s+="/content/DessPoc/fr_FR/FlightResults.html";
                }
                else if(currentPage.getPath().contains("fr_BE")){
                    s+="/content/DessPoc/fr_BE/FlightResults.html";
                }
                else if(currentPage.getPath().contains("de_DE")){
                    s+="/content/DessPoc/de_DE/FlightResults.html";
                }
                else if(currentPage.getPath().contains("de_AU")){
                    s+="/content/DessPoc/de_AU/FlightResults.html";
                    }
                else{
				s+="/content/DessPoc/en_GB/FlightResults.html";
                }

                //out.print("New Website");
        }
%>



<form id="myform" action="<%=s%>" method="GET">
    <div id="editInfo" style="display:none;">
    <div class="searchFieldNab">
    	<label for="fromLoc"><%= i18n.get("Flying from")%><span class="redNab">*</span></label>
		<input type="text" name="fromLoc" id="fromLoc" list="fromLocs">
        <datalist id="fromLocs">
    	<%
            //Map<String,String> airportNameMap=new HashMap<String,String>();
            //airportNameMap.put("test","tbest");
		for (Map.Entry<String, String> entry : airportNameMap.entrySet())
        {
            %>
			<option value="<%=entry.getValue()+" ("+entry.getKey()+")"%>"></option>
            <%
		}
    	%>
		</datalist>
    </div>


     <!-- demo test code -->

    <div class="searchFieldNab" ng-app = "" ng-controller = "countryController">
    	<label for="fromLoc"><%= i18n.get("Flying from")%><span class="redNab">*</span></label>
		<input type="text" name="fromLoc" id="fromLoc" list="froms" ng-model="fromlocation">
        <datalist id="froms">
            <option ng-repeat = "x in names | filter:fromlocation">{{x.country}}</option>
		</datalist>
    </div>

        <!-- test using jquery -->
	<div class="searchFieldNab ui-widget">
            <label for="toLoc"><%= i18n.get("Going to")%><span class="redNab">*</span></label>
            <input id="toLoc">
    </div>
      <!-- demo test code over -->


	<div class="searchFieldNab">
        <label for="toLoc"><%= i18n.get("Going to")%><span class="redNab">*</span></label>
		<input type="text" name="toLoc" id="toLoc" list="toLocs">
        <datalist id="toLocs">
    	<%
            //Map<String,String> airportNameMap=new HashMap<String,String>();
            //airportNameMap.put("test","tbest");
		for (Map.Entry<String, String> entry : airportNameMap2.entrySet())
        {
            %>
			<option value="<%=entry.getValue()+" ("+entry.getKey()+")"%>"></option>
            <%
		}
    	%>
		</datalist>
    </div>
    <div class="searchFieldNab">
        <label for="oDate"><%= i18n.get("Date of Journey")%><span class="redNab">*</span><span class="readOutHidden">D D/M M/Y Y Y Y</span></label>
		<input type="text" name="oDate" id="oDate" value="01/01/2015">
        <button id="oDateCalendar"  type="button" alt="Calendar">
            <img src="/content/dam/mywebsite/searchPodCalendar.gif" alt="Outbound calendar">
        </button>
    </div>
    <div class="searchFieldNab">
        <label for="acDestinationAirport"><%= i18n.get("Adults")%></label>
        <select name="numberOfAdults" id="numberOfAdults" ><option value="0">0</option>
            <option value="1" selected="selected">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
            <option value="32">32</option>
            <option value="33">33</option>
            <option value="34">34</option>
            <option value="35">35</option>
            <option value="36">36</option>
            <option value="37">37</option>
            <option value="38">38</option>
            <option value="39">39</option>
            <option value="40">40</option>
        </select>
    </div>
    <div class="searchFieldNab">
        <input type="submit" name="submitSearch" id="searchPodSubmitButton" class="buttonCTA orangeWhite" value='<%= i18n.get("Search Flights")%> >>' title="Show flights" />
    </div>
    </div>
    <div id="readInfo" style="display:none;">
        <h2 class="searchresHeading"><%=i18n.get("Searched Info")%></h2>

       <label for="acOriginAirport"><%=i18n.get("Flying from")%> <span class="whiteNabVal"><%= request.getParameter("fromLoc") %></span> <%=i18n.get("to")%> <span class="whiteNabVal"><%= request.getParameter("toLoc") %></span> <%=i18n.get("on")%> <span class="whiteNabVal"><%= request.getParameter("oDate") %></span></label>

<div class="noOfAdult">

    <label for="acDestinationAirport"><%=i18n.get("No of Adults")%> :: <span class="whiteNabVal"><%= request.getParameter("numberOfAdults") %></span></label></div>


	<input type="button" name="reSearch" id="reSearchButton" class="buttonCTA orangeWhite" value="Search Flights Again >>" title="Re-Search flights" />

    </div>
</form>

<script>
    /***** search angular script ****/

/*
		Map<String,String> airportNameMap=new LinkedHashMap<String,String>();
		function countryController($scope){
            for (Map.Entry<String, String> entry : airportNameMap.entrySet())
       		 {
                 var str = entry[0].getValue();
           		 $scope.names = [
                    {country : str},
                    {country : 'Frankfurt (FRA)'},
                    {country : 'London Luton (LTN)'},
                    {country : 'Paris Beauvais (BVA)'}
   		 		];
			}
        }
*/

    function countryController($scope){
         $scope.names = [
          {country : 'Barcelona El Prat (BCN)'},
		  {country : 'Frankfurt (FRA)'},
          {country : 'London Luton (LTN)'},
          {country : 'Paris Beauvais (BVA)'}
   		 ];
         }

    /* autocomplete using jquery*/




 $(function() {
    var availableTags = [
		<%
		for (Map.Entry<String, String> entry : airportNameMap2.entrySet())
        {
            %>
			<%="\""+entry.getValue()+" ("+entry.getKey()+")\","%>
            <%
		}
    	%>
    ];
    $( "#toLoc" ).autocomplete({
      source: availableTags
    });
  });


    /*
   $(function() {
    var availableTags = [
      "Barcelona El Prat (BCN)",
      "Frankfurt (FRA)",
      "London Luton (LTN)",
      "Paris Beauvais (BVA)"
    ];
    $( "#toLoc" ).autocomplete({
      source: availableTags
    });
    });*/

</script>
