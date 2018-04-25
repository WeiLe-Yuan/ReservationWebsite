package com.bishe.controller;

import java.util.LinkedList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bishe.model.User;
import com.bishe.sevice.FoodService;
import com.bishe.sevice.UserService;


@Controller
public class UserController {
	
	@Resource
	private UserService userService;
	
	@Resource
	private FoodService foodService;
	
	//登陆
	@RequestMapping(value = "/login")
    public String login(User user,Model model,HttpServletRequest request) {
		System.out.println(user.getuser_name());
		System.out.println(user.getuser_password());
		User  defaultuser=(User)request.getSession().getAttribute("user");
		if (defaultuser!=null) {
			return "helloworld";
		}else{
			User loginuser = userService.checkLogin(user.getuser_name(),user.getuser_password());
			if(loginuser!=null){
				request.getSession().setAttribute("user", loginuser);
				LinkedList<String> foodtype = foodService.getFoodType(loginuser.getuser_id());
				request.getSession().setAttribute("foodtype", foodtype);
				return "helloworld";
			}
			else{
		        return "failure";
			}
		}	
    }
	
	//跳转注册压面
	@RequestMapping(value = "/registpage")
	public String jumpRegist(){
		return "regist";
	}
	
	//注册
	@RequestMapping(value = "/regist")
	public String regist(User user) throws Exception{
		//调用Service保存注册用户
		try {
			if (user.getuser_name()==""||user.getuser_password()==""||user.getuser_address()==""||user.getuser_email()=="") {
				System.out.println("信息不能为空");
			} else {
				userService.saveUser(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
            return "regist";
		}
		return "index";
	}
	
	//注销
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request)throws Exception{
		request.getSession().removeAttribute("user");
		return "index";
	}
}
