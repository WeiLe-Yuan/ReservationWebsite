package com.bishe.controller;

import java.util.LinkedList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bishe.model.Food;
import com.bishe.model.User;
import com.bishe.sevice.FoodService;

@Controller
public class FoodList {
	@Resource
	private FoodService foodService;
	
	@RequestMapping(value = "/foodlistpage")
	public String jumpFoodlist(HttpServletRequest request,Model model,String foodtype) {
		//System.out.println("你好");
		User user=(User)request.getSession().getAttribute("user");
		int userid = user.getuser_id();
		if (foodtype!=null && !foodtype.equals("全部")) {
			System.out.println(foodtype);
			LinkedList<Food> foodslist = foodService.selectFoodByFoodType(userid, foodtype);
			model.addAttribute("foodlist", foodslist);
			return "foodlist";
		}else{
			//System.out.println(user.getuser_id());
			LinkedList<Food> foodlist = foodService.selectFoodByUserId(userid);
			/*for (Food food : foodlist) {
				System.out.println(food.getfood_id());
			}*/
			//System.out.println(foodlist.size());
			model.addAttribute("foodlist",foodlist);
			return "foodlist";
		}
	}
}