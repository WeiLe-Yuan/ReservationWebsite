package com.bishe.sevice;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service("UploadFile")
public class UploadFileImpl implements UploadFile {
	public String uploadImg(MultipartFile file, HttpServletRequest request, int user_id)throws IOException{
		//获取项目根目录
        //String basePath = "E:\\eclipse\\workspace\\ReservationWebsite\\src\\main\\webapp\\";
		String basePath = request.getSession().getServletContext().getRealPath("/");
		System.out.println(basePath);
        //设置图片上传目录
        String saveFilePath = "img\\uploadFile\\"+user_id;
        /* 构建文件目录 */
        File fileDir = new File(basePath + saveFilePath);
           if (!fileDir.exists()) {
                fileDir.mkdirs();
           }
        //上传的文件名
        String filename=file.getOriginalFilename();
        //文件的扩张名
        String extensionName = filename.substring(filename.lastIndexOf(".") + 1);
        //生成新的图片名字
        String newfileName = UUID.randomUUID()+"."+extensionName;  
         
        FileCopyUtils.copy(file.getBytes(), new File(basePath + saveFilePath + "\\" + newfileName));
        System.out.println(basePath + saveFilePath + "\\" + newfileName);
        return saveFilePath+"\\" + newfileName;
	}
}
