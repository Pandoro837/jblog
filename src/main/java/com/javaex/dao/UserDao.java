package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//아이디 중복체크
	public UserVo idCheck(UserVo userVo) {
		return sqlSession.selectOne("user.selectId", userVo);
	}
	
	//회원가입
	public void insertUser(UserVo userVo) {
		sqlSession.insert("user.insertUser", userVo);
	}
	
}
