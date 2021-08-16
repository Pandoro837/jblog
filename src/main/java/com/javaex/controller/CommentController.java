package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.CommentService;
import com.javaex.vo.CommentVo;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	//코멘트 리스트 호출
	@ResponseBody
	@RequestMapping(value="/{id}/cmtList", method = {RequestMethod.GET, RequestMethod.POST})
	public List<CommentVo> commentList(@RequestBody int postNo){
//		System.out.println("코멘트 리스트");
//		System.out.println("포스트 넘버 : " + postNo);
		List<CommentVo> commentList = commentService.getCommentList(postNo);
//		System.out.println(commentList + "controller");
		
		return commentList;
	}
	
	//코멘트 추가
	@ResponseBody
	@RequestMapping(value="/{id}/addCmt", method = {RequestMethod.GET, RequestMethod.POST})
	public CommentVo addComment(@RequestBody CommentVo commentVo){
		System.out.println("코멘트 추가");
		System.out.println("코멘트 정보 : " + commentVo.toString());
		
		CommentVo addedComment = commentService.addComment(commentVo);
		System.out.println(addedComment);
		
		return addedComment;
	}
	
	//코멘트 삭제
	@ResponseBody
	@RequestMapping(value="/{id}/deleteCmt", method = {RequestMethod.GET, RequestMethod.POST})
	public boolean deleteComment(@RequestBody int commentNo) {
		System.out.println("코멘트 삭제");
		System.out.println("코멘트 번호 : " + commentNo);
		
		boolean success = commentService.deleteComment(commentNo);
		
		System.out.println("성공 여부 : " + success);
		
		return success;
	}
	
}
