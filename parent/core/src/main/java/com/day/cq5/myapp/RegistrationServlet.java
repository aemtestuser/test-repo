package com.day.cq5.myapp;


import javax.jcr.RepositoryException;
import javax.jcr.Session;

import org.apache.sling.jcr.api.SlingRepository;
import org.apache.felix.scr.annotations.Reference;
import org.apache.jackrabbit.api.security.user.AuthorizableExistsException;
import org.apache.jackrabbit.api.security.user.UserManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

import javax.servlet.ServletException;

import org.apache.felix.scr.annotations.sling.SlingServlet;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
//import org.apache.sling.commons.json.JSONException;
//import org.apache.sling.commons.json.JSONObject;
import org.apache.sling.api.resource.ResourceResolver; 
import org.apache.jackrabbit.api.security.user.User;




import com.sun.security.auth.UserPrincipal;
import com.day.cq.commons.jcr.JcrUtil;
import com.day.cq.security.profile.*;

import javax.jcr.Node; 
import org.apache.sling.api.resource.*;

import java.security.Principal;


@SlingServlet(paths = "/bin/poc/registration"/*, resourceTypes = "company/components/page/contentpage", selectors="data" /*, methods = "GET"*/)
public class RegistrationServlet extends SlingAllMethodsServlet {
	private static final long serialVersionUID = -3960692666512058118L;
	
	private static final Logger LOGGER=  LoggerFactory.getLogger(RegistrationServlet.class);
	
	@Reference
	private SlingRepository repo;
	private static final String USER_BASE_PATH = "home/users/Dess";
	@Override
	protected void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException {
		//Session session = null;
		ResourceResolver resourceResolver = null;
		String regFirstname = request.getParameter("regFirstname");
		String regLastname = request.getParameter("regLastname");
		String regPassword = request.getParameter("regPassword");
		String regUsername = request.getParameter("regUsername");
		String regEmail = request.getParameter("regEmail");
		String errormsg = "";
		try {
		if(regUsername == null || regPassword == null) {
			errormsg = "One";
			throw new IllegalArgumentException("Username and password are needed for user registration");
		}
		resourceResolver = request.getResourceResolver();
		UserManager userManager = resourceResolver.adaptTo(UserManager.class);
		if(userManager == null){
			errormsg = "Two";
			throw new IllegalStateException("Usermanager could not be obtained");
		}
		Principal principal = new UserPrincipal(regUsername);
		
		//my code annesha
		User user = userManager.createUser(regUsername, regPassword, principal, "/home/users/Dess");
		Resource res = resourceResolver.getResource("/home/users/Dess/"+regUsername);
		Node node = res.adaptTo(Node.class);
		node.addNode("profile");
		Resource res1 = resourceResolver.getResource("/home/users/Dess/"+regUsername+"/profile");
		Node node1 = res1.adaptTo(Node.class);
		node1.setProperty("destinationCity","Delhi");
		
		
		
		if(user == null){
			errormsg = "Three";
			throw new IllegalStateException("User could not be created");
		}
		
		
		/*
		Resource res = resourceResolver.getResource("home/users/Dess/arindam");
		
		LOGGER.error("********* Regn :getting Node");
		Node rootNode = res.adaptTo(Node.class);
		LOGGER.error("********* Regn : Existing Root Node ",rootNode.getPath() );
		Node userBaseNode = rootNode.getNode("home/users/Dess/arindam");
		
		LOGGER.error("********* Regn : Existing userbasenode", userBaseNode.getPath());
		Node userNode = userBaseNode.addNode("profile1", "nt:unstructured");
		userNode.setProperty("lastName", regLastname); 
		LOGGER.error("********* Regn : Existing user", userNode.getPath());
		*/
		
		
		org.apache.jackrabbit.api.security.user.Group poc_visitor_group = 
				(org.apache.jackrabbit.api.security.user.Group)userManager.getAuthorizable("dess");
		poc_visitor_group.addMember(user);		
		errormsg = "Four";
		resourceResolver.commit();
		
		
		
		
		} catch (AuthorizableExistsException e) {
			LOGGER.error("********* Regn : Existing user", e);
			resourceResolver.revert();
		} catch (RepositoryException e) {
			LOGGER.error("********* Regn : RepositoryException registering user", e);
			resourceResolver.revert();
		} catch (Exception e) {
			LOGGER.error("********* Regn : Unknown exception registering user", e);
			resourceResolver.revert();
		} finally {
			if (resourceResolver != null && resourceResolver.isLive()) {
				//resourceResolver.close();	// Check if this is good practice to close this
			}
			/*
			if (session != null)
				session.logout();
			}
			*/
		}
		
		
		response.getWriter().print(errormsg+ regUsername + "User successfully created");
		
	}
}
