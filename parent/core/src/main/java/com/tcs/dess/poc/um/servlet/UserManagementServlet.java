package com.tcs.dess.poc.um.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;

import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
import org.apache.sling.commons.json.JSONException;
import org.apache.sling.commons.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tcs.dess.poc.bean.User;
import com.tcs.dess.poc.um.UserManagement;
import com.tcs.dess.poc.um.impl.UserManagementImpl;

@SlingServlet(
	    paths={"/bin/authenticate.html","/bin/register.html"},methods="POST")
	@Properties({
	    @Property(name="service.pid", value="com.tcs.dess.poc.um.servlet.UserManagementServlet",propertyPrivate=false),
	    @Property(name="service.description",value="User Management Service call", propertyPrivate=false),
	    @Property(name="service.vendor",value="TCS", propertyPrivate=false)
	})
public class UserManagementServlet extends SlingAllMethodsServlet {
	
	@Reference
	UserManagement userManagement;
	
	private static final String SUCCESS = "success";
	
	private static final String FAILURE = "failure";

	/**
	 * 
	 */
	private static final long serialVersionUID = 7063701624287172906L;
	
	private static final Logger logger = LoggerFactory.getLogger(UserManagementServlet.class);
	

	@Override
	public void doPost(SlingHttpServletRequest request,
			SlingHttpServletResponse response) throws ServletException,
			IOException {
		logger.info("doPost :: Request Path Info - "+request.getRequestPathInfo());
		String requestPath = request.getRequestPathInfo().getResourcePath();
		
		if(requestPath != null){
			if(requestPath.contains("authenticate")){
				authenticate(request,response);
			}else if(requestPath.contains("register")){
				register(request,response);
			}else{
				response.setContentType("text/plain");
				response.setStatus(SlingHttpServletResponse.SC_INTERNAL_SERVER_ERROR);				
				response.getWriter().write(SUCCESS);				
			}
		}else{
			response.setContentType("text/plain");
			response.setStatus(SlingHttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write(FAILURE);
		}
		
	}
	
	private void authenticate(SlingHttpServletRequest request,
			SlingHttpServletResponse response) throws ServletException,
			IOException{
		
		logger.info("authenticate :: Email - "+request.getParameter("email"));
		logger.info("authenticate :: Password - "+request.getParameter("password"));
		
		User user = userManagement.getUser(request);
		//boolean isAuthenticated = userManagement.authenticate(user);
		
		//Dummy code starts. Replace with original method call(s) once DB setup is done
		UserManagementImpl umImpl = (UserManagementImpl)userManagement;
		boolean isAuthenticated = umImpl.authenticate();
		if(isAuthenticated){
			Cookie c1 = new Cookie("email", user.getEmail());
			response.addCookie(c1);			
			
			Cookie c2 = new Cookie("currentcity", "kolkata");
			response.addCookie(c2);
			Cookie c3 = new Cookie("topcity", "mumbai");
			response.addCookie(c3);
			
			response.setStatus(SlingHttpServletResponse.SC_OK);			
			response.setContentType("text/plain");
			response.getWriter().write(SUCCESS);
		}else{
			response.setStatus(SlingHttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.setContentType("text/plain");
			response.getWriter().write(FAILURE);
		}
		
	}
	
	private void register(SlingHttpServletRequest request,
			SlingHttpServletResponse response) throws ServletException,
			IOException{
		logger.info("authenticate :: Email - "+request.getParameter("email"));
		logger.info("authenticate :: Password - "+request.getParameter("password"));
		
		User user = userManagement.getUser(request);
		//Dummy code starts. Replace with original method call once DB setup is done
		UserManagementImpl umImpl = (UserManagementImpl)userManagement;
		boolean isRegistered = umImpl.registerUser();
		if(isRegistered){
			response.setStatus(SlingHttpServletResponse.SC_OK);
			response.setContentType("text/plain");
			response.getWriter().write(SUCCESS);
		}else{
			response.setStatus(SlingHttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.setContentType("text/plain");
			response.getWriter().write(FAILURE);
		}
		
	}
	
	

}
