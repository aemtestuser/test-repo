package com.tcs.dess.poc.um.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.tcs.dess.poc.bean.User;
import com.tcs.dess.poc.db.DBService;
import com.tcs.dess.poc.um.UserManagement;

@Service(value=UserManagement.class)
@Component(metatype=true, immediate=true)
public class UserManagementImpl implements UserManagement {
	
	@Reference
	private DBService dbService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserManagementImpl.class);
	
	@Override
	public boolean authenticate(User user) {
		if(user == null){
			logger.warn("authenticate :: User object is NULL. Cannot authenticate.");
			return false;
		}
		
		final String email = user.getEmail();
		final String password = user.getPassword();
		
		logger.info("authenticate :: authenticating with userid - "+email+" & password - "+password);
		if(email == null || password == null || "".equals(email) || "".equals(password)){
			logger.warn("authenticate :: email or password is not valid for authentication or checking for existance.");
			return false;
		}
		Connection connection = null;
		boolean isAuthenticated = false;
		try{
			connection = dbService.getConnection();
			if(connection == null){
				logger.warn("authenticate :: DB connection is NULL. Cannot authenticate.");
				return false;
			}
			final Statement statement = connection.createStatement();
			final ResultSet resultSet = statement.executeQuery("select email from "+User.USER_PROFILE_TABLE_NAME+" where email = '"+email+"' and password = '"+password+"'");
			isAuthenticated = resultSet.first();
			statement.close();			
		}catch(Exception e){
			logger.error("Exception occurred while connecting database.",e);
		}finally{
			dbService.disposeConnection(connection);
		}		
		return isAuthenticated;
	}

	@Override
	public boolean registerUser(User user) {
		if(user == null || user.getEmail() == null || user.getPassword() == null){
			logger.warn("authenticate :: User object or required values are null. Cannot register.");
			return false;
		}
		logger.info("registerUser :: Registering - "+user);
		boolean isRegistered = false;
		Connection connection = null;
		try{
			connection = dbService.getConnection();
			if(connection == null){
				logger.warn("registerUser :: Cannot register. DB Connection is NULL.");
			}
			Statement stmt = connection.createStatement();
			//TODO
			final String SQL = "insert into "+User.USER_PROFILE_TABLE_NAME+" values()";
			stmt.executeUpdate(SQL);
			stmt.close();
			dbService.commit(connection);
			isRegistered = true;
		}catch(Exception e){
			logger.error("Error occurred while registering user.",e);
			dbService.rollback(connection);
		}finally{
			dbService.disposeConnection(connection);
		}
		return isRegistered;
	}

	@Override
	public boolean userExists(User user) {		
		return authenticate(user);
	}

	@Override
	public User getUser(HttpServletRequest request) {
		User user = new User();
		if(request == null){
			logger.warn("getUserFromHttpRequest :: Http Request object is null. Returning blank user");
			return user;
		}
		
		try{			
			user.setContactnumber(request.getParameter("contactnumber"));
			user.setCurrentcity(request.getParameter("currentcity"));
			user.setEmail(request.getParameter("email"));
			user.setFirstname(request.getParameter("firstname"));
			user.setGender(request.getParameter("gender"));
			user.setLastname(request.getParameter("lastname"));
			user.setOktocontact(request.getParameter("oktocontact"));
			user.setPassword(request.getParameter("password"));
			user.setSalutation(request.getParameter("salutation"));
			user.setTopcity(request.getParameter("topcity"));
			
		}catch(Exception e){
			logger.error("Error occured while extracting the user information from HTTP request",e);
		}
		return user;
	}
	
	@Override
	public User getUser() {
		// TODO Not Implemented
		return null;
	}

	//TODO :: Remove the below methods and the corresponding references after setting up the DB.
	public String testMethod() {
		if(dbService == null){
			logger.info("testMethod :: DBService is NULL");
		}else{
			logger.info("testMethod :: DBService is not NULL");
		}
		return "This is a test method.";
	}
	public boolean authenticate(){
		Double r = Math.random();
		if(r < 0.5D){
			logger.info("authenticate :: [Dummy] User Authenticated");
			return true;
		}else{
			logger.info("authenticate :: [Dummy] User is NOT Authenticated");
			return false;
		}	
	}
	public boolean registerUser(){
		Double r = Math.random();
		if(r < 0.5D){
			logger.info("authenticate :: [Dummy] User registered");
			return true;
		}else{
			logger.info("authenticate :: [Dummy] User is NOT registered");
			return false;
		}	
	}
	public boolean userExists(){
		Double r = Math.random();
		if(r < 0.5D){
			logger.info("authenticate :: [Dummy] User Exists");
			return true;
		}else{
			logger.info("authenticate :: [Dummy] User does NOT exist.");
			return false;
		}	
	}

	@Override
	public boolean logout(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	

}
