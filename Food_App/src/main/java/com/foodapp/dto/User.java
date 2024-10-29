package com.foodapp.dto;

public class User {

	//<------------- Private members -------------->
	
	private int user_id;
	private String user_name;
	private String email;
	private String password;
	private String adress;
	private String role;
	private String crate_date;
	private String last_login_date;
	
	
	
	public User(int user_id, String user_name, String email, String password, String adress) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.email = email;
		this.password = password;
		this.adress = adress;
//		this.role = role;
//		this.crate_date = crate_date;
//		this.last_login_date = last_login_date;
	}

	//<------------- Constructor with User_Id -------------->
	
	public User(String user_name, String email, String password, String adress) {
		super();
	
		this.user_name = user_name;
		this.email = email;
		this.password = password;
		this.adress = adress;
		
	}
	
	//<------------- Constructor without User_Id -------------->
	
	public User(String user_name, String email, String password, String adress, String role, String crate_date,
			String last_login_date) {
		super();
		this.user_name = user_name;
		this.email = email;
		this.password = password;
		this.adress = adress;
		this.role = role;
		this.crate_date = crate_date;
		this.last_login_date = last_login_date;
	}
	
	//<------------- Constructor without Parameters -------------->
	
	public User()
	{
	
	}
	
	//<------------- toString Method -------------->
	
	@Override
	public String toString() {
		return user_id+"  "+ user_name + " " + email + " "+ password + " " + adress + " " + role + " " + crate_date + " "
				+ last_login_date ;
	}
	
	//<------------- Public Setters and Getters -------------->
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getCrate_date() {
		return crate_date;
	}
	public void setCrate_date(String crate_date) {
		this.crate_date = crate_date;
	}
	public String getLast_login_date() {
		return last_login_date;
	}
	public void setLast_login_date(String last_login_date) {
		this.last_login_date = last_login_date;
	}
	
}
