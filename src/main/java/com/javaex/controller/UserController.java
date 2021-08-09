package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="/user", method = {RequestMethod.GET, RequestMethod.POST})
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//로그인 화면
	@RequestMapping(value="/loginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm() {
		
		System.out.println("loginForm");
		
		return "/user/loginForm";
	}

	//회원가입 화면
	@RequestMapping(value="/joinForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String joinForm() {
		
		System.out.println("joinForm");
		
		return "/user/joinForm";
	}

	//회원가입
	@RequestMapping(value="/join", method = {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute UserVo userVo) {
		
		System.out.println("join");
		System.out.println(userVo.toString());
		
		//userService.join(userVo);
		
		return "/user/joinSuccess";
	}

	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/idCheck", method = {RequestMethod.GET, RequestMethod.POST})
	public boolean idCheck(@ModelAttribute UserVo userVo) {
		
		System.out.println("/idCheck");
		System.out.println(userVo.toString());
		
		return userService.idCheck(userVo);
	}
	
}
