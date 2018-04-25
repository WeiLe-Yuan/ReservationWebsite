package com.bishe.model;

import java.util.LinkedList;

public class User {
	private int user_id;
	private String user_name;
	private String user_password;
	private String user_address;
	private String user_email;
	private LinkedList<Food> foodlist;
		
	
	public int getuser_id() {
		return user_id;
	}
	
    public void setuser_id(int id) {
		this.user_id=id;
	}
	
	public String getuser_name(){
		return user_name;
	}
	
	public void setuser_name(String name) {
		this.user_name=name;
	}
	
	public String getuser_password(){
		return user_password;
	}
	
	public void setuser_password(String password) {
		this.user_password=password;
	}
	
	public String getuser_address(){
		return user_address;
	}
	
	public void setuser_address(String address) {
		this.user_address=address;
	}
	
	public String getuser_email(){
		return user_email;
	}
	
	public void setuser_email(String email) {
		this.user_email=email;
	}
	
	public LinkedList<Food> getfoodlist(){
		return foodlist;
	}
	
	public void setfoodlist(LinkedList<Food> foodlist) {
		this.foodlist=foodlist;
	}
	

}
