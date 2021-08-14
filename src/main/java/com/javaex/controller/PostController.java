package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.PostService;
import com.javaex.vo.PostVo;

@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
	//포스트 저장
	@RequestMapping(value="/{id}/admin/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String write(@ModelAttribute PostVo postVo) {
		postService.addPost(postVo);
		return "redirect:/{id}/admin/writeForm";
	}
}
