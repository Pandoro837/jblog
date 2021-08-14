package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.CateService;
import com.javaex.vo.CateVo;

@Controller
public class CateController {

	@Autowired
	private CateService cateService;

	//////////////////////////////// blog admin - category ////////////////////////////////
	
	//카테고리 관리용 리스트 호출
	@ResponseBody
	@RequestMapping(value="/{id}/admin/category/getList", method = {RequestMethod.GET, RequestMethod.POST})
	public List<CateVo> getCateList(@RequestBody String id) {
		List<CateVo> adminCateList = cateService.getAdminCateList(id);
		return adminCateList;
	}
	
	//블로그 카테고리 추가, ajax로 보여주기 위함
	@ResponseBody
	@RequestMapping(value="/{id}/admin/category/add", method = {RequestMethod.GET, RequestMethod.POST})
	public CateVo addCate(@RequestBody CateVo addCate) {
		CateVo addedCate = cateService.addCate(addCate);
		return addedCate;
	}
	//블로그 카테고리 삭제, ajax로 보여주기 위함
	@ResponseBody
	@RequestMapping(value="/{id}/admin/category/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public boolean addCate(@RequestBody int cateNo) {
		boolean success = cateService.deleteCate(cateNo);
		return success;
	}
	
	//////////////////////////////// blog admin - category ////////////////////////////////

}
