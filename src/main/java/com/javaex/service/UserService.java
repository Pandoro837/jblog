package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDao;
import com.javaex.vo.UserVo;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	//회원가입
	public void join(UserVo userVo) {
		
		//회원 가입
		userDao.insertUser(userVo);
	}
	
	//id 중복체크
	public boolean idCheck(UserVo userVo) {
		
		//아이디 중복체크
		UserVo userIdCheck = userDao.idCheck(userVo);
		
		if(userIdCheck == null) {
			//중복 x, 가입 가능
			return true;
		} else {
			//중복 o, 가입 불가능
			return false;
		}
		
	}
	
}
