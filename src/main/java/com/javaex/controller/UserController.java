package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.UserService;
import com.javaex.vo.UserVo;

@Controller
@RequestMapping(value="/user", method = {RequestMethod.GET, RequestMethod.POST})
public class UserController {
	
	@Autowired
	private UserService userService;

	//////////////////////////////// user - join ////////////////////////////////

	//회원가입 화면
	@RequestMapping(value="/joinForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String joinForm() {
		return "/user/joinForm";
	}
	
	//회원가입
	@RequestMapping(value="/join", method = {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute UserVo userVo) {
		//회원가입 확인
		boolean joinSuccess = userService.join(userVo);
		
		if(joinSuccess == true) {
			return "/user/joinSuccess";
		} else {
			return "/";
		}
		
	}

	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/idCheck", method = {RequestMethod.GET, RequestMethod.POST})
	public boolean idCheck(@ModelAttribute UserVo userVo) {
		boolean idCheck = userService.idCheck(userVo);
		return idCheck;
	}

	//////////////////////////////// user - join ////////////////////////////////

	
	//////////////////////////////// user - login&out ////////////////////////////////

	//로그인 화면
	@RequestMapping(value="/loginForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String loginForm() {
		return "/user/loginForm";
	}
	
	//로그인
	@RequestMapping(value="/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(@ModelAttribute UserVo userLogin, HttpSession session) {

		UserVo authUser = userService.login(userLogin);
		
		if(authUser == null) {
			
			return "redirect:/user/loginForm?result=fail";
		
		} else {
			
			session.setAttribute("authUser", authUser);
			
			return "redirect:/";
		}
		
	}
	
	//로그아웃
	@RequestMapping(value="/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session) {
	
		session.removeAttribute("authUser");
		session.invalidate();
		
		return "redirect:/";
	}
	
	//////////////////////////////// user - login&out ////////////////////////////////
	
}
