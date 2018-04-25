package com.bishe.sevice;

import com.bishe.model.User;

public interface UserService {
	
	//登陆方法
	User checkLogin(String username,String userpassword);
	
	//注册用户
	void saveUser(User user);

}
