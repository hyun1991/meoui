package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class MeetingBoardCommentService {

	private Logger logger= LoggerFactory.getLogger(MeetingBoardCommentService.class);
	
	@Autowired
	private MeetingBoardCommentDAO dao;
	
	//댓글 불러오기
	public HashMap<String, Object> selectMeetingBoardCommentList(int meetingboardNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		List<MeetingBoardComment>list = dao.selectMeetingBoardCommentList(meetingboardNo);
		map.put("list", list);		
		logger.info("모임게시판댓글목록:{}", list);
		return map;
	}
	
	//댓글 쓰기
	public void insertMeetingBoardComment(MeetingBoardComment meetingboardComment){
			dao.insertMeetingBoardComment(meetingboardComment);
	}
	
	//댓글 삭제 유저용	
	public void deleteMeetingboardComment(int meetingboardCommentNo, int memberNo){
		dao.deleteMeetingboardComment(meetingboardCommentNo, memberNo);
		
		
	}
	
	
}
