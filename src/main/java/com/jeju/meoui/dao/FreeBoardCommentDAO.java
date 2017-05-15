package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class FreeBoardCommentDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	//1. 댓글작성
	public void insertComment(FreeBoardComment comment) {
		template.insert("FreeBoardCommentMapper.insertComment", comment);
	}
	//2. 자유게시판 번호별 댓글 조회하기
	public List<FreeBoardComment> selectCommentList(int freeboardNo) {
		return template.selectList("FreeBoardCommentMapper.selectCommentList", freeboardNo);
	}
	//3. 댓글수정
	public void updateComment(FreeBoardComment comment) {
		template.update("FreeBoardCommentMapper.updateComment", comment);
	}
	//4. 댓글삭제
	public void deleteComment(int freeboardCommentNo, int freeboardNo) {
		template.delete("FreeBoardCommentMapper.deleteComment", freeboardCommentNo);
	}
	//5. 자유게시판 번호별 댓글 전체 삭제하기
	public void deleteAllComment(int freeboardNo) {
		template.delete("FreeBoardCommentMapper.deleteAllComment", freeboardNo);
	}
	//6. 자유게시판 댓글번호별 자유게시판 번호 조회
	public int selectfreeboardCommentNo(int freeboardCommentNo) {
		return template.selectOne("FreeBoardCommentMapper.selectfreeboardCommentNo",freeboardCommentNo);
	}
}
