package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.BlogDao;
import com.javaex.dao.CateDao;
import com.javaex.dao.UserDao;
import com.javaex.vo.CateVo;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BlogDao blogDao;
	
	@Autowired
	private CateDao cateDao;
	
	//회원가입
	public boolean join(UserVo userVo) {
		
		//회원 가입
		int iCount = userDao.insertUser(userVo);
		
		if(iCount != 1) {
			return false;
		} else {
			//디폴트 블로그 생성
			blogDao.insertBlog(userVo);
			
			//디폴트 카테고리 생성 
			CateVo cateDefault = new CateVo();
			
			String defaultName = "미분류";
			String defaultDescription = "기본으로 만들어지는 카테고리입니다.";
			String id = userVo.getId();
			
			cateDefault.setCateName(defaultName);
			cateDefault.setDescription(defaultDescription);
			cateDefault.setId(id);
			
			cateDao.insertCate(cateDefault);
			
			return true;
		}
		
	}
	
	//id 중복체크
	public boolean idCheck(UserVo userVo) {
		
		//아이디 중복체크
		UserVo userIdCheck = userDao.selectId(userVo);
		
		if(userIdCheck == null) {
			//중복 x, 가입 가능
			return true;
		} else {
			//중복 o, 가입 불가능
			return false;
		}
		
	}
	
	//로그인
	public UserVo login(UserVo userVo) {
		UserVo authUser = userDao.selectLogin(userVo);
		if(authUser != null) {
			return authUser;
		} else {
			return null;
		}
		
	}
	
}
