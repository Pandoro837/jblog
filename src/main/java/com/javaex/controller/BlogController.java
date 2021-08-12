package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.BlogService;
import com.javaex.vo.BlogVo;
import com.javaex.vo.CateVo;
import com.javaex.vo.PostVo;

@Controller
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	
	//블로그 메인 보여주기
	@RequestMapping(value="/{id}", method = {RequestMethod.GET, RequestMethod.POST})
	public String main(Model model, 
					@PathVariable("id") String id, 
					@RequestParam(value="crtCate", required = false, defaultValue = "0") int crtCate, 
					@RequestParam(value="postNo", required = false, defaultValue = "0") int postNo) {

		//블로그 찾기
		BlogVo blogInfo = blogService.getBlog(id);

		//카테고리 리스트 호출
		List<CateVo> cateList = blogService.getCateList(id);
		
		//가장 최근의 카테고리 넘버
		if(crtCate == 0) {
			crtCate = cateList.get(0).getCateNo();
		}
		
		//카테고리에 해당하는 최근 포스트 호출
		PostVo crtPost;
		if(postNo == 0) {
			crtPost = blogService.getCrtPost(crtCate);
		} else {
			crtPost = blogService.getPost(postNo);
		}
		
		
		//해당 카테고리의 포스트 목록
		List<PostVo> crtPostList = blogService.getPostList(crtCate);
		
		//아이디로 가장 최근의 포스트 하나 호출
//		PostVo crtPost = blogService.getCrtPost(id);
//		System.out.println(crtPost);
		
		model.addAttribute("blogInfo", blogInfo);
		model.addAttribute("cateList", cateList);
		model.addAttribute("crtPost", crtPost);
		model.addAttribute("crtPostList", crtPostList);
		
		return "/blog/blog-main";
	}
	
	//////////////////////////////// blog admin - basic  ////////////////////////////////
	
	//블로그 베이직 수정 폼
	@RequestMapping(value="/{id}/admin/basic", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminBasic(Model model, @PathVariable("id") String id) {
		//블로그 찾기
		BlogVo blogInfo = blogService.getBlog(id);
		model.addAttribute("blogInfo", blogInfo);
		
		return "/blog/admin/blog-admin-basic";
	}
	
	//블로그 베이직 수정
	@RequestMapping(value="/{id}/update/basic", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateBasic(@ModelAttribute BlogVo blogUpdate, @RequestParam(value = "file") MultipartFile file) {
		System.out.println("update---------------------------");

		blogService.blogUpdate(blogUpdate, file);
		return "redirect:/{id}/admin/basic";
	}
	
	//////////////////////////////// blog admin - basic ////////////////////////////////

	
	//////////////////////////////// blog admin - category ////////////////////////////////

	//블로그 카테고리 수정 폼
	@RequestMapping(value="/{id}/admin/category", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminCategory(Model model, @PathVariable("id") String id) {
		//블로그 찾기
		BlogVo blogInfo = blogService.getBlog(id);
		
		model.addAttribute("blogInfo", blogInfo);
		
		return "/blog/admin/blog-admin-cate";
	}
	
	//카테고리 관리용 리스트 호출
	@ResponseBody
	@RequestMapping(value="/{id}/admin/category/getList", method = {RequestMethod.GET, RequestMethod.POST})
	public List<CateVo> getCateList(@RequestBody String id) {
		List<CateVo> adminCateList = blogService.getAdminCateList(id);
		return adminCateList;
	}
	
	//블로그 카테고리 추가, ajax로 보여주기 위함
	@ResponseBody
	@RequestMapping(value="/{id}/admin/category/add", method = {RequestMethod.GET, RequestMethod.POST})
	public CateVo addCate(@RequestBody CateVo addCate) {
		CateVo addedCate = blogService.addCate(addCate);
		return addedCate;
	}
	//블로그 카테고리 삭제, ajax로 보여주기 위함
	@ResponseBody
	@RequestMapping(value="/{id}/admin/category/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public boolean addCate(@RequestBody int cateNo) {
		boolean success = blogService.deleteCate(cateNo);
		return success;
	}

	//////////////////////////////// blog admin - category ////////////////////////////////

	
	//////////////////////////////// blog admin - post ////////////////////////////////

	//블로그 포스트 작성 폼
	@RequestMapping(value="/{id}/admin/writeForm", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeForm(Model model, @PathVariable("id") String id) {
		//블로그 찾기
		BlogVo blogInfo = blogService.getBlog(id);
		
		//카테고리 리스트 호출
		List<CateVo> cateList = blogService.getCateList(id);
		
		model.addAttribute("blogInfo", blogInfo);
		model.addAttribute("cateList", cateList);

		return "/blog/admin/blog-admin-write";
	}
	
	//포스트 저장
	@RequestMapping(value="/{id}/admin/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String write(@ModelAttribute PostVo postVo) {
		blogService.addPost(postVo);
		return "redirect:/{id}/admin/writeForm";
	}
	
	//////////////////////////////// blog admin - post ////////////////////////////////

}
