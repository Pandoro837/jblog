package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BlogVo;
import com.javaex.vo.UserVo;

@Repository
public class BlogDao {

	@Autowired
	private SqlSession sqlSession;
	
	//회원 가입시, 블로그 생성
	public void insertBlog(UserVo userVo) {
		sqlSession.insert("blog.insertBlog", userVo);
	}
	
	//블로그 찾기
	public BlogVo selectBlog(String id) {
		BlogVo blogVo = sqlSession.selectOne("blog.selectBlog", id);
		return blogVo;
	}
	
	//블로그 베이직 수정
	public void updateBasic(BlogVo blogVo) {
		sqlSession.update("blog.updateBasic", blogVo);
	}
}
