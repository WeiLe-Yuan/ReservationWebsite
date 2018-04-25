package com.bishe.sevice;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bishe.dao.UserDao;
import com.bishe.model.User;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Resource(name = "userDao")
	private UserDao userDao;
	
	public User checkLogin(String username,String userpassword){
		User user=userDao.selectUserByName(username);
		if (user!=null&&user.getuser_password().equals(userpassword)) {
			return user;
		}else {
			return null;
		}
	}
	
	public void saveUser(User user) {
		if (userDao.selectUserByName(user.getuser_name())==null) {
			userDao.saveUser(user);
			System.out.println("用户注册成功");
		}else {
			System.out.println("用户名已存在");
		}
	}

}
