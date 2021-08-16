package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.CommentDao;
import com.javaex.vo.CommentVo;

@Service
public class CommentService {
	
	@Autowired
	private CommentDao commentDao;
	
	//코멘트 리스트 호출
	public List<CommentVo> getCommentList(int postNo) {
		List<CommentVo> commentList = commentDao.selectCommentList(postNo);
		return commentList;
	}
	
	//코멘트 추가
	public CommentVo addComment(CommentVo commentVo) {
		
		//코멘트 추가
		int commentNo = commentDao.insertComment(commentVo);

		//코멘트 넘버로 코멘트 찾기
		CommentVo addedComment = commentDao.selectComment(commentNo);
		
		return addedComment;
	}
	
	//코멘트 삭제
	public boolean deleteComment(int commentNo) {
		//성공 여부 확인
		boolean success = false;
		
		//코멘트 삭제
		int iCount = commentDao.deleteComment(commentNo); 
		if(iCount == 1) {
			success = true;
		}
		
		return success;
		
	}
	
}
