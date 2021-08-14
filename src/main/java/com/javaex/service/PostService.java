package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.PostDao;
import com.javaex.vo.PostVo;

@Service
public class PostService {
	
	@Autowired
	private PostDao postDao;
	
	//////////////////////////////// blog main  ////////////////////////////////
	
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
	
	//////////////////////////////// blog main  ////////////////////////////////

	//////////////////////////////// blog admin - post ////////////////////////////////

	//포스트 저장
	public void addPost(PostVo postVo) {
		postDao.insertPost(postVo);
	}
	
	//////////////////////////////// blog admin - post ////////////////////////////////
	
}
