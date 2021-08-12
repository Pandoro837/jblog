package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CateVo;

@Repository
public class CateDao {

	@Autowired
	private SqlSession sqlSession;
	
	//카테고리 리스트 호출
	public List<CateVo> selectCateList(String id) {
		List<CateVo> cateList = sqlSession.selectList("cate.selectCateList", id);
		return cateList;
	}
	
	//카테고리 관리용 리스트 호출
	public List<CateVo> selectAmdinCateList(String id) {
		List<CateVo> adminCateList = sqlSession.selectList("cate.selectAmdinCateList", id);
		return adminCateList;
	}
	
	//카테고리 추가
	public int insertCate(CateVo cateVo) {
		int iCount = sqlSession.insert("cate.insertCate", cateVo);
		return iCount;
	}
	
	//추가된 카테고리 호출
	public CateVo selectCate(int cateNo) {
		CateVo cateVo = sqlSession.selectOne("cate.selectCate", cateNo);
		return cateVo;
	}
	
	//카테고리 하나의 카운트 가져오기
	public int selectCateCnt(int cateNo) {
		int cnt = sqlSession.selectOne("cate.selectCateCnt", cateNo);
		return cnt;
	}
	
	//카테고리 삭제
	public int deleteCate(int cateNo) {
		int iCount = sqlSession.delete("cate.deleteCate", cateNo);
		return iCount;
	}
}
