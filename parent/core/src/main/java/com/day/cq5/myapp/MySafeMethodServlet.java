package com.day.cq5.myapp;

import java.io.IOException;

import javax.servlet.ServletException;

import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingSafeMethodsServlet;



@SlingServlet(paths = "/bin/company/repo", methods="GET")
public class MySafeMethodServlet extends SlingSafeMethodsServlet {

	protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException 
	{
		response.setHeader("Content-Type", "application/json");
		response.getWriter().print("{\"coming\":\"soon\"}");
		
	}
}
