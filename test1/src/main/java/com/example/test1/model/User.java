package com.example.test1.model;

import lombok.Data; 

@Data
public class User {
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	private String userId;
	private String pwd;
	private String userName;
	private String email;
	public String getEmail() {
		return email;
	}
	private String phone;
	private String gender;
	private String status;
	public String getStatus() {
		return status;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	private String addr;

}