package com.bishe.dao;


import java.util.LinkedList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.bishe.model.Food;
import com.bishe.model.User;

public interface FoodDao {
	//添加食物信息
	void insertFood(Food food);
	
	//修改食物信息
    void updateFood(@Param("food_id")int foodid,@Param("user_id")int userid,@Param("food")Food food);
	
	//删除食物信息
	void deleteFood(String foodname);
	
	//根据商家id获取食物列表
	LinkedList<Food> selectFoodByUserId(int userid);
	
	//根据商家id和食品类型获取对应的食品信息
	LinkedList<Food> selectFoodByFoodType(@Param("user_id")int userid,@Param("food_type")String foodtype);
	
	//根据商家id添加食品类型信息
    void insertFoodType(@Param("user_id")int userid,@Param("food_type")String foodtype);
    
    //根据字符串判断是否存在该食物类型
    String selectFoodType(@Param("user_id")int userid,@Param("food_type")String foodtype);
    
    //通过商家id获取食品类型
    LinkedList<String> selectFoodTypeByUserId(@Param("user_id")int userid);

}