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
import com.javaex.dao.CateDao;
import com.javaex.dao.PostDao;
import com.javaex.vo.BlogVo;
import com.javaex.vo.CateVo;
import com.javaex.vo.PostVo;

@Service
public class BlogService {

	@Autowired
	private BlogDao blogDao;
	
	@Autowired
	private CateDao cateDao;

	@Autowired
	private PostDao postDao;
	
	//블로그 호출
	public BlogVo getBlog(String id) {
		BlogVo blogVo = blogDao.selectBlog(id);
		return blogVo;
	}

	//카테고리 리스트 호출
	public List<CateVo> getCateList(String id) {
		List<CateVo> cateList = cateDao.selectCateList(id);
		return cateList;
	}
	
	//카테고리에 해당하는 최근 포스트 호출
	public PostVo getCrtPost(int cateNo) {
		PostVo crtPost = postDao.selectCrtPost(cateNo);
		return crtPost;
	}
	
	//해당 카테고리의 포스트 목록
	public List<PostVo> getPostList(int cateNo) {
		List<PostVo> postList = postDao.selectPostList(cateNo);
		return postList;
	}
	
	//포스트 번호로 포스트 호출
	public PostVo getPost(int postNo) {
		PostVo crtPost = postDao.selectPost(postNo);
		return crtPost;
	}
	
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

	
	//////////////////////////////// blog admin - category ////////////////////////////////
	
	//카테고리 관리용 리스트 호출
	public List<CateVo> getAdminCateList(String id) {
		List<CateVo> adminCateList = cateDao.selectAmdinCateList(id);
		return adminCateList;
	}
	
	//카테고리 추가
	public CateVo addCate(CateVo cateVo) {
		
		//카테고리 추가
		cateDao.insertCate(cateVo);
		int cateNo = cateVo.getCateNo();
		
		//추가된 카테고리 호출
		CateVo addedCate = cateDao.selectCate(cateNo);
		return addedCate;
	}
	
	//카테고리 삭제
	public boolean deleteCate(int cateNo) {
		boolean success = false;
		
		//카테고리의 카운트 비교
		int cateCnt = cateDao.selectCateCnt(cateNo);
		
		//카테고리의 포스트 수가 0일때
		if(cateCnt == 0) {
			//카테고리 삭제
			int iCount = cateDao.deleteCate(cateNo);
			
			if(iCount == 1) {
				success = true;
			}
		} 

		return success;
	}

	//////////////////////////////// blog admin - category ////////////////////////////////

	
	//////////////////////////////// blog admin - post ////////////////////////////////

	//포스트 저장
	public void addPost(PostVo postVo) {
		postDao.insertPost(postVo);
	}
	
	//////////////////////////////// blog admin - post ////////////////////////////////

}
