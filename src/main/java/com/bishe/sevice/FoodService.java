package com.bishe.sevice;

import java.util.LinkedList;

import com.bishe.model.Food;

public interface FoodService {
	//添加食品信息
	public void addFood(Food food);
	
	//修改食品信息
	public void alterFood(int foodid,int userid,Food food);
	
	//删除食品信息
	public void deleteFood(String foodname);
	
	//根据商家id获取食品信息
	public LinkedList<Food> selectFoodByUserId(int userid);
	
	//根据商家id和食品类型获取对应的食品信息
	public LinkedList<Food> selectFoodByFoodType(int userid,String foodtype);
	
	//根据商家id添加食品类型信息
	public void addFoodType(int userid,String foodtype);
	
	//查询该商家是否添加过该食品类型
	public boolean checkFoodType(int userid,String foodtype);
	
	//获取商家对应的食品类型信息
	public LinkedList<String> getFoodType(int userid);

}
