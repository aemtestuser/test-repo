<%@page import="java.util.Locale,java.util.ResourceBundle,com.day.cq.i18n.I18n"%>
<%
   String errdata="None";
   String jsonFlightData="No Data";
   String sql="";

   int count=0;
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
Statement stmt = null;
ResultSet rs = null;
String air_name = "None";
		try {
            org.apache.sling.commons.json.JSONArray jsonArray = new org.apache.sling.commons.json.JSONArray();
            org.apache.sling.commons.json.JSONObject jsonNewObject = null;
			stmt = connection.createStatement();



			if("".equals(fromLoc) || "".equals(toLoc))
                //sql = "SELECT id,txt_flight_name,txt_flightNumber,txt_depart_time,txt_arrival_time,txt_duration,txt_source_airport,txt_destination_airport,txt_iata_source,txt_iata_destination,txt_source_city,txt_destination_city,txt_source_country,txt_destination_country,num_fare,num_administration_fee from flight_details";
            // sql = "SELECT id,txt_flight_name,txt_flightNumber,txt_depart_time,txt_arrival_time,txt_duration,txt_source_airport,txt_destination_airport,txt_iata_source,txt_iata_destination,txt_source_city,txt_destination_city,txt_source_country,txt_destination_country,num_fare,num_administration_fee from flight_details";
                sql = "SELECT CONCAT(MOD(HOUR(TIMEDIFF(f.txt_depart_time, f.txt_arrival_time)), 24), ' hours ',MINUTE(TIMEDIFF(f.txt_depart_time, f.txt_arrival_time)), ' minutes') as duration, f.txt_flight_code as f_txt_flight_code, f.txt_airline_code as f_txt_airline_code, f.txt_depart_time as f_txt_depart_time, f.txt_arrival_time as f_txt_arrival_time, f.txt_class as f_txt_class, f.num_base_price as f_num_base_price, f.from_airport_code as f_from_airport_code, f.to_airport_code as f_to_airport_code,ai.txt_logo_path as ai_txt_logo_path, ai.txt_airline_name as ai_txt_airline_name,ap.txt_airport_name as ap_txt_airport_name, ap.txt_city as ap_txt_city, ap.txt_timezone as ap_txt_timezone, ap.num_airport_tax as ap_num_airport_tax FROM flight f, airport_master ap, airlines_master ai where f.txt_airline_code=ai.txt_airline_code and f.from_airport_code=ap.txt_airport_iata";
			else
				sql = "SELECT CONCAT(MOD(HOUR(TIMEDIFF(f.txt_depart_time, f.txt_arrival_time)), 24), ' hours ',MINUTE(TIMEDIFF(f.txt_depart_time, f.txt_arrival_time)), ' minutes') as duration, f.txt_flight_code as f_txt_flight_code, f.txt_airline_code as f_txt_airline_code, f.txt_depart_time as f_txt_depart_time, f.txt_arrival_time as f_txt_arrival_time, f.txt_class as f_txt_class, f.num_base_price as f_num_base_price, f.from_airport_code as f_from_airport_code, f.to_airport_code as f_to_airport_code,ai.txt_logo_path as ai_txt_logo_path, ai.txt_airline_name as ai_txt_airline_name,ap.txt_airport_name as ap_txt_airport_name, ap.txt_city as ap_txt_city, ap.txt_timezone as ap_txt_timezone, ap.num_airport_tax as ap_num_airport_tax FROM flight f, airport_master ap, airlines_master ai where f.txt_airline_code=ai.txt_airline_code and f.from_airport_code=ap.txt_airport_iata and LCASE(f.from_airport_code) LIKE '%"+fromLoc.substring(fromLoc.length()-4, fromLoc.length()-1).toLowerCase()+"%' and LCASE(f.to_airport_code) LIKE '%"+toLoc.substring(toLoc.length()-4, toLoc.length()-1).toLowerCase()+"%'";
			rs = stmt.executeQuery(sql);
		    while(rs.next()){
			   //Retrieve by column name
               //int id  = rs.getInt("id");
                //air_name = rs.getString("txt_destination_city");
                jsonNewObject = new org.apache.sling.commons.json.JSONObject();
                //jsonNewObject.put("id", rs.getString("id"));
                jsonNewObject.put("name", rs.getString("ai_txt_airline_name"));
                jsonNewObject.put("flightNumber", rs.getString("f_txt_flight_code"));
                jsonNewObject.put("airlineCode", rs.getString("f_txt_airline_code"));
                jsonNewObject.put("depart", rs.getString("f_txt_depart_time"));
                jsonNewObject.put("arrive", rs.getString("f_txt_arrival_time"));
                jsonNewObject.put("duration", rs.getString("duration"));
                jsonNewObject.put("class", rs.getString("f_txt_class"));
                //jsonNewObject.put("price", rs.getString("f_num_base_price"));
                jsonNewObject.put("fromCode", rs.getString("f_from_airport_code"));
                jsonNewObject.put("toCode", rs.getString("f_to_airport_code"));

				Statement stmt2 = null;
				ResultSet rs2 = null;
				String sql2="";
				String f_from_airport_code=rs.getString("f_from_airport_code");
                String f_to_airport_code=rs.getString("f_to_airport_code");

				sql2="select txt_airport_name,txt_city,num_airport_tax from airport_master where txt_airport_iata='"+f_from_airport_code+"'";
				stmt2 = connection.createStatement();
				rs2 = stmt2.executeQuery(sql2);
                while(rs2.next()){
					jsonNewObject.put("fromAirport", rs2.getString("txt_airport_name"));
                    jsonNewObject.put("fromCity", rs2.getString("txt_city"));
                    jsonNewObject.put("sourceAirportTax", rs2.getString("num_airport_tax"));
                }
                sql2="select txt_airport_name,txt_city,num_airport_tax from airport_master where txt_airport_iata='"+f_to_airport_code+"'";
				stmt2 = connection.createStatement();
				rs2 = stmt2.executeQuery(sql2);
                while(rs2.next()){
					jsonNewObject.put("toAirport", rs2.getString("txt_airport_name"));
                    jsonNewObject.put("toCity", rs2.getString("txt_city"));
                    jsonNewObject.put("destinationAirportTax", rs2.getString("num_airport_tax"));
                }

                //jsonNewObject.put("fromCity", "dfd");
                //jsonNewObject.put("toCity", "dfgd");
                //jsonNewObject.put("fromAirport", "dfgd");
                //jsonNewObject.put("toAirport", "dfgdf");



                //jsonNewObject.put("fromCountry", "cc");
                //jsonNewObject.put("toCountry", "dd");
            
                jsonNewObject.put("priceAmt", rs.getString("f_num_base_price"));
                //jsonNewObject.put("price", rs.getString("txt_destination_city"));
                jsonNewObject.put("administrationFee", "10");
                //jsonNewObject.put("ap_num_airport_tax", rs.getString("ap_num_airport_tax")); 
                jsonNewObject.put("oDate", oDate);
                jsonNewObject.put("numberOfAdults", numberOfAdults);
                jsonNewObject.put("logoName", rs.getString("ai_txt_logo_path"));

                jsonArray.put(jsonNewObject);
                count++;
            }

			jsonFlightData=jsonArray.toString();

		} catch (Exception e) {
			errdata = e.getMessage();
			e.printStackTrace();

		}
		finally {
		//STEP 6: Clean-up environment
    	if(rs != null)
	    	rs.close();
    	if(stmt != null)
	       stmt.close();
         if(connection != null)
	        connection.close();
         }



%>
<script>
    //alert();
</script>