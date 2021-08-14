package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CateDao;
import com.javaex.vo.CateVo;

@Service
public class CateService {

	@Autowired
	private CateDao cateDao;
	
	//////////////////////////////// blog main  ////////////////////////////////

	//카테고리 리스트 호출
	public List<CateVo> getCateList(String id) {
		List<CateVo> cateList = cateDao.selectCateList(id);
		return cateList;
	}
	//////////////////////////////// blog main  ////////////////////////////////

	
	////////////////////////////////blog admin - category ////////////////////////////////
	
	//카테고리 관리용 리스트 호출
	public List<CateVo> getAdminCateList(String id) {
		List<CateVo> adminCateList = cateDao.selectAmdinCateList(id);
		return adminCateList;
	}
	
	//카테고리 추가
	public CateVo addCate(CateVo cateVo) {
		
		//카테고리 추가
		cateDao.insertCate(cateVo);
		int cateNo = cateVo.getCateNo();
		
		//추가된 카테고리 호출
		CateVo addedCate = cateDao.selectCate(cateNo);
		return addedCate;
	}
	
	//카테고리 삭제
	public boolean deleteCate(int cateNo) {
		//성공 여부 확인
		boolean success = false;
		
		//카테고리의 카운트 비교
		int cateCnt = cateDao.selectCateCnt(cateNo);
		
		//카테고리의 포스트 수가 0일때
		if(cateCnt == 0) {
			//카테고리 삭제
			int iCount = cateDao.deleteCate(cateNo);
			
			if(iCount == 1) {
				success = true;
			}
		} 
		return success;
	}
	
	////////////////////////////////blog admin - category ////////////////////////////////

	
}
