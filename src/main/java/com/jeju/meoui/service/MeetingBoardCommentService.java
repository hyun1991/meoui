package com.jeju.meoui.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.meoui.dao.MeetingBoardCommentDAO;
import com.jeju.meoui.dao.MeetingBoardDAO;
import com.jeju.meoui.vo.MeetingBoardComment;

@Service
public class MeetingBoardCommentService {

	private Logger logger= LoggerFactory.getLogger(MeetingBoardCommentService.class);
	
	@Autowired
	private MeetingBoardCommentDAO dao;
	@Autowired
	private MeetingBoardDAO meetingboarddao;
	
	//댓글 불러오기
	public HashMap<String, Object> selectMeetingBoardCommentList(int meetingboardNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		List<MeetingBoardComment>list = dao.selectMeetingBoardCommentList(meetingboardNo);
		map.put("list", list);		
		logger.info("모임게시판댓글목록:{}", list);
		return map;
	}
	
	//댓글 개수 불러오기
	public int selectMeetingBoardCommentCnt(int meetingboardNo){
		return dao.selectMeetingBoardCommentCnt(meetingboardNo);
		
		
		
	}
	
	
	//댓글 쓰기
	@Transactional
	public void insertMeetingBoardComment(MeetingBoardComment meetingboardComment){
		MeetingBoardComment comment = new MeetingBoardComment();
		int meetingboardNo = comment.getMeetingboardNo();
		
		logger.info("미팅보더커맨트서비스 미팅보더넘버:{}",meetingboardNo);
		
		meetingboarddao.updateMeetingBoardCommentCnt(meetingboardNo);
		
		dao.insertMeetingBoardComment(meetingboardComment);
	}
	
	//댓글 삭제 유저용	
	public void deleteMeetingboardComment(int meetingboardCommentNo, int memberNo){
		dao.deleteMeetingboardComment(meetingboardCommentNo, memberNo);
		
		
	}
	
	
}
