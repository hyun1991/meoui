package com.jeju.meoui.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class FreeBoardCommentService {
	@Autowired
	private FreeBoardCommentDAO commentDAO;
	
	//1. 댓글 추가하기(미완료)
	public void createFreeboardComment(FreeBoardComment freeBoardComment) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		commentDAO.insertComment(freeBoardComment);
		commentDAO.incrementComments(freeBoardComment.getFreeboardCommentNo());
		map.put("comments", commentDAO.selectfreeboardCommentNo(freeBoardComment.getFreeboardCommentNo()));
		map.put("commentscnt", commentDAO.selectCommentsCnt(freeBoardComment.getFreeboardCommentNo()));
		System.out.println(map);
	}
	//2. 댓글 수정하기
	public void modifyFreeboardComment(FreeBoardComment freeBoardComment) {
		commentDAO.updateComment(freeBoardComment);
	}
	//3. 댓글 삭제하기(미완료)
	public void removeFreeboardComment(int freeboardCommentNo, int memberNo, int freeboardNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		commentDAO.deleteComment(freeboardCommentNo, memberNo);
		commentDAO.deleteAllComment(memberNo);
		map.put("comments", commentDAO.selectfreeboardCommentNo(freeboardCommentNo));
		map.put("commentscnt", commentDAO.selectCommentsCnt(freeboardNo));
		System.out.println(map);
	}
}
