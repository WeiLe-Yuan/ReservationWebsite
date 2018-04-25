package com.bishe.sevice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface UploadFile {
	public String uploadImg(MultipartFile file, HttpServletRequest request, int user_id) throws IOException;

}
