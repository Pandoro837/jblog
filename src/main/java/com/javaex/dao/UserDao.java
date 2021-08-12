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
	public UserVo selectId(UserVo userVo) {
		UserVo idCheck = sqlSession.selectOne("user.selectId", userVo);
		return idCheck;
	}
	
	//회원가입
	public int insertUser(UserVo userVo) {
		int iCount = sqlSession.insert("user.insertUser", userVo);
		return iCount;
	}
	
	//로그인
	public UserVo selectLogin(UserVo userVo) {
		UserVo authUser = sqlSession.selectOne("user.selectLogin", userVo);
		return authUser;
	}
	
}
