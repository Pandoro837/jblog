package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CommentVo;

@Repository
public class CommentDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//코멘트 리스트 호출
	public List<CommentVo> selectCommentList(int postNo) {
		List<CommentVo> commentList = sqlSession.selectList("comment.selectCommentList", postNo);
		return commentList;
	}
	
	//코멘트 추가
	public int insertComment(CommentVo commentVo) {
		sqlSession.insert("comment.insertComment", commentVo);
		int cmtNo =  commentVo.getCmtNo();
		System.out.println("DAO cmt No : " + cmtNo);
		return cmtNo;
	}
	
	//코멘트 넘버로 코멘트 찾기
	public CommentVo selectComment(int commentNo) {
		CommentVo addedComment = sqlSession.selectOne("comment.selectComment", commentNo);
		return addedComment;
	}
	
	//코멘트 삭제
	public int deleteComment(int commentNo) {
		int iCount = sqlSession.delete("comment.deleteComment", commentNo);
		return iCount;
	}
	
}
