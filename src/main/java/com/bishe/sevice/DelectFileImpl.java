package com.bishe.sevice;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service("DelectFile")
public class DelectFileImpl implements DelectFile {
	public void delectImg(HttpServletRequest request, String imgpath){
		//获取项目根目录
		String basePath = request.getSession().getServletContext().getRealPath("/");
		File file = new File(basePath+imgpath);
		if(file.exists()){
			file.delete();
		}
	}

}
