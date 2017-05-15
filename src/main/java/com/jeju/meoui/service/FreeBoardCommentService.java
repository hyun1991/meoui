package com.jeju.meoui.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class FreeBoardCommentService {
	@Autowired
	private FreeBoardCommentDAO commentDAO;
	
	//1. 댓글 추가하기
	public void createFreeboardComment(FreeBoardComment freeBoardComment) {
		commentDAO.insertComment(freeBoardComment);
	}
	//2. 댓글 수정하기
	public void modifyFreeboardComment(FreeBoardComment freeBoardComment) {
		commentDAO.updateComment(freeBoardComment);
	}
	//3. 댓글 삭제하기
	public void removeFreeboardComment(int freeboardCommentNo, int memberNo) {
		commentDAO.deleteComment(freeboardCommentNo, memberNo);
	}
}
