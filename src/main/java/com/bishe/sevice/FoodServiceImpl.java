package com.bishe.sevice;

import java.util.LinkedList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bishe.dao.FoodDao;
import com.bishe.model.Food;
import com.bishe.model.User;

@Service("foodService")
public class FoodServiceImpl implements FoodService {

	@Resource(name = "foodDao")
	private FoodDao foodDao;

	public void addFood(Food food) {
		foodDao.insertFood(food);
	}

	public void alterFood(int foodid, int userid, Food food) {
		foodDao.updateFood(foodid, userid, food);
	}

	public void deleteFood(String foodname) {
		foodDao.deleteFood(foodname);
	}

	public LinkedList<Food> selectFoodByUserId(int userid) {
		LinkedList<Food> foodlist = foodDao.selectFoodByUserId(userid);
		return foodlist;
	}
	
	//根据商家id和食品类型获取对应的食品信息
	public LinkedList<Food> selectFoodByFoodType(int userid,String foodtype){
		LinkedList<Food> foodlist = foodDao.selectFoodByFoodType(userid, foodtype);
		return foodlist;
	}

	// 根据商家id添加食品类型信息
	public void addFoodType(int userid, String foodtype) {
		foodDao.insertFoodType(userid, foodtype);
	}
	
	//查询该商家是否添加过该食品类型
	public boolean checkFoodType(int userid,String foodtype){
		String check = foodDao.selectFoodType(userid, foodtype);
		if (check==null || check=="") {
			return true;
		}else{
			return false;
		}
	}
	
	//获取商家对应的食品类型信息
	public LinkedList<String> getFoodType(int userid){
		LinkedList<String> foodtype = foodDao.selectFoodTypeByUserId(userid);
		return foodtype;
	}

}
