package com.bishe.model;

import java.math.BigDecimal;

public class Food {
	private int food_id;
	private int user_id;
	private String food_name;
	private BigDecimal food_price;
	private String food_img;
	private String food_type;
	
	public void setfood_id(int id){
		this.food_id=id;
	}
	
	public int getfood_id(){
		return food_id;
	}
	
	public void setuser_id(int id){
		this.user_id=id;
	}
	
	public int getuser_id(){
		return user_id;
	}
	
	public void setfood_name(String name){
		this.food_name=name;
	}
	
	public String getfood_name(){
		return food_name;
	}
	
	public void setfood_price(BigDecimal price){
		this.food_price=price;
	}
	
	public BigDecimal getfood_price(){
		return food_price;
	}
	
	public void setfood_img(String img){
		this.food_img=img;
	}
	
	public String getfood_img(){
		return food_img;
	}
	
	public void setfood_type(String foodtype){
		this.food_type=foodtype;
	}
	
	public String getfood_type(){
		return food_type;
	}

}
