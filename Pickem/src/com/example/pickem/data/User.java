package com.example.pickem.data;

public class User {
	private String firstname;
	private String lastname;
	private String user;
	private String password;
	private String email;
	
	
	
	public User(String firstname, String lastname, String user, String password, String email) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.user = user;
		this.password = password;
		this.email = email;
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
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
