package com.day.cq5.myapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


//import javax.jcr.RepositoryException;
import javax.servlet.ServletException;
//import javax.servlet.http.Cookie;


import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
import org.apache.sling.commons.json.JSONArray;
//import org.apache.sling.commons.json.JSONException;
import org.apache.sling.commons.json.JSONObject;

import com.tcs.dess.poc.db.impl.DBServiceImpl;



@SlingServlet(paths = "/bin/FlightSearchServlet", resourceTypes = "mywebsite/components/contentpage", selectors="data" /*, methods = "GET"*/)
public class FlightSearchServlet extends SlingAllMethodsServlet {
	
@Override	
protected void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException 
{
		
		PrintWriter out = response.getWriter();
		
		String fromLoc=request.getParameter("fromLoc")==null? "":request.getParameter("fromLoc");
		String toLoc=request.getParameter("toLoc")==null? "":request.getParameter("toLoc");
		String oDate=request.getParameter("oDate")==null? "":request.getParameter("oDate");
		String numberOfAdults=request.getParameter("numberOfAdults")==null? "":request.getParameter("numberOfAdults");
		
		//response.setHeader("Content-Type", "application/json");
		//response.getWriter().print("{\"coming\" : \"soon\"}");
		JSONArray jsonArray = new JSONArray();
		try{
		
			
/////////////// mysql test
		String emp_name = "abcd";
		String a = "1";
		try {
			DBServiceImpl dbs = new DBServiceImpl();
			Connection conn = dbs.getConnection();
			if(conn != null)
				a="good";
			else
				a = "not good";
		} catch (Exception e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
			a = "ERR";
			
		}
			
			
			
			
			
			
		//while ( list.hasNext() ) {
			JSONObject jsonNewObject = new JSONObject();
			jsonNewObject.put("idx", "1234");
			jsonNewObject.put("name", "Virgin");
			jsonNewObject.put("depart", "9:40");
			jsonNewObject.put("arrive", "12:20");
			jsonNewObject.put("duration", "17h 55m");
			jsonNewObject.put("price", "Rs.31,545");
			jsonArray.put(jsonNewObject);
			
			jsonNewObject = new JSONObject();
			jsonNewObject.put("idx", "1235");
			jsonNewObject.put("name", "Jet");
			jsonNewObject.put("depart", "10:40");
			jsonNewObject.put("arrive", "12:20");
			jsonNewObject.put("duration", "18h 55m");
			jsonNewObject.put("price", "Rs.61,545");
			jsonArray.put(jsonNewObject);
			
			jsonNewObject = new JSONObject();
			jsonNewObject.put("idx", "1236");
			jsonNewObject.put("name", a);
			jsonNewObject.put("depart", "10:1");
			jsonNewObject.put("arrive", "12:20");
			jsonNewObject.put("duration", "180h 555m");
			jsonNewObject.put("price", "Rs.5678");
			jsonArray.put(jsonNewObject);
		//}
		
		
		}  catch (Exception err) {
			err.printStackTrace();
		} 
		out.print(jsonArray.toString());
}

protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException 
{
		
	PrintWriter out = response.getWriter();
	
	String fromLoc=request.getParameter("fromLoc")==null? "":request.getParameter("fromLoc");
	String toLoc=request.getParameter("toLoc")==null? "":request.getParameter("toLoc");
	String oDate=request.getParameter("oDate")==null? "":request.getParameter("oDate");
	String numberOfAdults=request.getParameter("numberOfAdults")==null? "":request.getParameter("numberOfAdults");
	
	//response.setHeader("Content-Type", "application/json");
	//response.getWriter().print("{\"coming\" : \"soon\"}");
	JSONArray jsonArray = new JSONArray();
	try{
	
		
		
		
		
		
/////////////// mysql test
	String emp_name = "abcd";
	String a = "1";
	try {
		DBServiceImpl dbs = new DBServiceImpl();
		Connection conn = dbs.getConnection();
		if(conn != null)
			a="good";
		else
			a = "not so good";
	} catch (Exception e) {
		System.out.println("Where is your MySQL JDBC Driver?");
		e.printStackTrace();
		a = "ERR";
		
	}
		
		
	//while ( list.hasNext() ) {
		JSONObject jsonNewObject = new JSONObject();
		jsonNewObject.put("name", "Virgin");
		jsonNewObject.put("depart", "9:40");
		jsonNewObject.put("arrive", "12:20");
		jsonNewObject.put("duration", "17h 55m");
		jsonNewObject.put("price", "Rs.31,545");
		jsonArray.put(jsonNewObject);
		
		jsonNewObject = new JSONObject();
		jsonNewObject.put("name", "Jet");
		jsonNewObject.put("depart", "10:40");
		jsonNewObject.put("arrive", "12:20");
		jsonNewObject.put("duration", "18h 55m");
		jsonNewObject.put("price", "Rs.61,545");
		jsonArray.put(jsonNewObject);
		
		jsonNewObject = new JSONObject();
		jsonNewObject.put("name", a);
		jsonNewObject.put("depart", "10:40");
		jsonNewObject.put("arrive", "12:20");
		jsonNewObject.put("duration", "18h 55m");
		jsonNewObject.put("price", "Rs.1234");
		jsonArray.put(jsonNewObject);
	//}
	
	
	}  catch (Exception err) {
		err.printStackTrace();
	} 
	out.print(jsonArray.toString());
}
	
	

}
