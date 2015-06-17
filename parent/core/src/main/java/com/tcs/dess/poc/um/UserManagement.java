package com.tcs.dess.poc.um;

import javax.servlet.http.HttpServletRequest;

import com.tcs.dess.poc.bean.User;

public interface UserManagement {	
	
	/**
	 * Authenticate the passed User based on its email and password.
	 * @param user
	 * @return
	 */
	public boolean authenticate(User user);
	
	/**
	 * Register the user in the persistent storage. Here the database
	 * @param user
	 * @return
	 */
	public boolean registerUser(User user);
	
	/**
	 * Checks whether the user exists in the persistent area or not. Here the database.
	 * @param user
	 * @return
	 */
	public boolean userExists(User user);
	
	
	/**
	 * Creates a user instance from HTTPServletRequest object
	 * @param HTTPServletRequest
	 * @return A User instance
	 */
	public User getUser(HttpServletRequest request);
	
	/**
	 * Implement this method if the User is retrieved from database.
	 * @return User
	 */
	public User getUser();
	
	public boolean logout(User user);
	
}
