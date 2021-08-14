package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.BlogDao;
import com.javaex.dao.PostDao;
import com.javaex.vo.BlogVo;
import com.javaex.vo.PostVo;

@Service
public class BlogService {

	@Autowired
	private BlogDao blogDao;
	
	//////////////////////////////// blog main  ////////////////////////////////
	
	//블로그 호출
	public BlogVo getBlog(String id) {
		BlogVo blogVo = blogDao.selectBlog(id);
		return blogVo;
	}
	
	//////////////////////////////// blog main  ////////////////////////////////

	
	//////////////////////////////// blog admin - basic  ////////////////////////////////
	
	//이미지 파일 수정
	public String restoreImg(MultipartFile file) {
		
		//이미지 파일 저장 위치
		String saveDirectory = "C:\\JavaStudy\\upload\\jblog";
		//파일의 원래 이름
		String orgName = file.getOriginalFilename();
		//확장자 획득
		int indexNum = orgName.lastIndexOf(".");
		String exName = file.getOriginalFilename().substring(indexNum);
		
		//저장용 이름(이미지의 이름이 중복될 가능성을 회피
		String saveName =  System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		
		String filePath = saveDirectory + "\\" + saveName;
		
		try {
			//하드 디스크에 이미지를 저장
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(filePath);
			BufferedOutputStream bf = new BufferedOutputStream(out);
			
			bf.write(fileData);
			bf.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//basic 수정용 logoFile 전달
		return saveName;
	}
	
	//블로그 베이직 수정
	public void blogUpdate(BlogVo blogVo, MultipartFile file) {
		//이미지 수정 시 작동
		if(!file.isEmpty()) {
			String logoFile = this.restoreImg(file);
			blogVo.setLogoFile(logoFile);
		}
		blogDao.updateBasic(blogVo);
	}
	
	//////////////////////////////// blog admin - basic  ////////////////////////////////

}
