package com.tcs.dess.poc.bean;

import org.apache.felix.scr.annotations.Component;

@Component
public class User {
	
	public static transient String USER_PROFILE_TABLE_NAME = "user_profile";
	
	private String email;
	
	private String password;
	
	private String salutation;
	
	private String firstname;
	
	private String lastname;
	
	private String gender;
	
	private String currentcity;
	
	private String topcity;
	
	private String contactnumber;
	
	private String oktocontact;
	

	public String getSalutation() {
		return salutation;
	}

	public void setSalutation(String salutation) {
		this.salutation = salutation;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCurrentcity() {
		return currentcity;
	}

	public void setCurrentcity(String currentcity) {
		this.currentcity = currentcity;
	}

	public String getTopcity() {
		return topcity;
	}

	public void setTopcity(String topcity) {
		this.topcity = topcity;
	}

	public String getContactnumber() {
		return contactnumber;
	}

	public void setContactnumber(String contactnumber) {
		this.contactnumber = contactnumber;
	}

	public String getOktocontact() {
		return oktocontact;
	}

	public void setOktocontact(String oktocontact) {
		this.oktocontact = oktocontact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [email=" + email + ", password=" + password + "]";
	}
}
