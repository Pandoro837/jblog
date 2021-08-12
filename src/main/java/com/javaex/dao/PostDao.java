package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.PostVo;

@Repository
public class PostDao {

	@Autowired
	private SqlSession sqlSession;
	
	//포스트 저장
	public void insertPost(PostVo postVo) {
		sqlSession.insert("post.insertPost", postVo);
	}
	
	//카테고리에 해당하는 최근 포스트 호출
	public PostVo selectCrtPost(int cateNo) {
		PostVo crtPost = sqlSession.selectOne("post.selectCrtPost", cateNo);
		return crtPost;
	}
	
	//해당 카테고리의 포스트 목록
	public List<PostVo> selectPostList(int cateNo) {
		List<PostVo> postList = sqlSession.selectList("post.selectPostList", cateNo);
		return postList;
	}
	
	//포스트 번호로 포스트 호출
	public PostVo selectPost(int postNo) {
		PostVo postVo = sqlSession.selectOne("post.selectPost", postNo);
		return postVo;
	}
	
	//아이디로 가장 최근의 포스트 하나 호출
//	public PostVo selectCrtPost(String id) {
//		PostVo crtPost = sqlSession.selectOne("post.selectCrtPost", id);
//		return crtPost;
//	}
	
}
