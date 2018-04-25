package com.bishe.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.hamcrest.core.Is;
import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bishe.model.Food;
import com.bishe.model.User;
import com.bishe.sevice.DelectFile;
import com.bishe.sevice.FoodService;
import com.bishe.sevice.UploadFile;

@Controller
@RequestMapping(value = "/food")
public class FoodController {
	@Resource
	private FoodService foodService;
	@Resource
	private UploadFile uploadFile;
	@Resource
	private DelectFile delectFile;
	
	@RequestMapping(value = "/addfoodpage")
	public String jumpAddfood(String userid,Model model) {
		System.out.println(userid);
		model.addAttribute("user_id",userid);
		return "addfood";  
    }
	
	@RequestMapping(value = "/addfood",method = RequestMethod.POST)
	public String addfood(Food food,@RequestParam("img") MultipartFile file, HttpServletRequest request)throws Exception {
		System.out.println(food.getfood_img());
		//String food_img=uploadFile.uploadImg(file, request,Integer.valueOf(String.valueOf(foodmassage.get("user_id"))));
		/*food.setfood_img(food_img);
		food.setuser_id(Integer.valueOf(String.valueOf(foodmassage.get("user_id"))));
		food.setfood_id(Integer.valueOf(String.valueOf(foodmassage.get("food_id"))));
		food.setfood_name(String.valueOf(foodmassage.get("food_name")));
		food.setfood_price(BigDecimal.valueOf(Double.valueOf(String.valueOf(foodmassage.get("food_price")))));
		foodService.addFood(food);*/
		
		String food_img=uploadFile.uploadImg(file, request,food.getuser_id());
		food.setfood_img(food_img);
		foodService.addFood(food);
		return "addfood";  
    }
	
	@RequestMapping(value = "/alterfood")
	public String alterfood(Integer primalfoodid,String primalimgpath,Food food,@RequestParam("img") MultipartFile file,HttpServletRequest request) throws IOException {
		User loginuser = (User)request.getSession().getAttribute("user");
		int userid = loginuser.getuser_id();
		//这里的foodid有问题，先用着，foodid应为自动获取
		int foodid = primalfoodid;
		System.out.println(foodid);
		
		String imgpath = primalimgpath;
		System.out.println(imgpath);
		delectFile.delectImg(request, imgpath);
		
		String food_img=uploadFile.uploadImg(file, request,food.getuser_id());
		food.setfood_img(food_img);
		
		foodService.alterFood(foodid, userid, food);
		return "redirect:/foodlistpage";
	}
	
	@RequestMapping(value = "/deletefoodpage")
	public String jumpDeletefood(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if (user!=null) {
			return "deletefood";
		}else {
			return "redirect:/index.jsp";
		}
	}
	
	@RequestMapping(value = "/deletefood")
	public String deletefood(String foodname){
		System.out.println(foodname);
		foodService.deleteFood(foodname);
		return "deletefood";
	}
	
	@RequestMapping(value = "/addfoodtypepage")
	public String jumpAddfoodtype(HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		if (user!=null) {
			return "addfoodtype";
		}else {
			return "redirect:/index.jsp";
		}
	}
	
	@RequestMapping(value = "/addfoodtype")
	@ResponseBody//此注解不能省略 否则ajax无法接受返回值
	public Map<String,Object> addfoodtype(String foodtype,HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		User loginuser = (User)request.getSession().getAttribute("user");
		int userid = loginuser.getuser_id();
		if (foodService.checkFoodType(userid, foodtype)) {
			foodService.addFoodType(userid, foodtype);
			resultMap.put("result", "添加成功");
			return resultMap;
		}else{
			resultMap.put("result", "添加失败，该食品类型以存在");
			return resultMap;
		}
	}

}
