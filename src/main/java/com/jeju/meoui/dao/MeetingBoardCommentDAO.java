package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class MeetingBoardCommentDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	//댓글 목록 불러오기
	public List<MeetingBoardComment> selectMeetingBoardCommentList(int meetingboardNo){
		 
		return template.selectList("MeetingBoardCommentMapper.selectMeetingBoardCommentList", meetingboardNo);
		
		
	}
	
	//댓글 작성 하기
	public void insertMeetingBoardComment(MeetingBoardComment meetingboardComment){
		template.insert("MeetingBoardCommentMapper.insertMeetingBoardComment", meetingboardComment);
	}
	
	//댓글 삭제 하기(작성자용
	public void deleteMeetingboardComment(int meetingboardCommentNo, int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("meetingboardCommentNo", meetingboardCommentNo);
		map.put("memberNo", memberNo);
		template.delete("MeetingBoardCommentMapper.deleteMeetingboardComment", map);
	}
	
	//댓글 삭제 게시판 만든 사람용
	public void deleteMeetingMeetingboardComment(int meetingboardNo){
		template.delete("MeetingBoardCommentMapper.deleteMeetingMeetingboardComment", meetingboardNo);
		
	}
	//댓글 삭제 하기(관리자용)
	public void deleteMeetingboardCommentAdmin(int meetingNo){
	template.delete("MeetingBoardCommentMapper.deleteMeetingboardCommentAdmin", meetingNo);
	}

	
	
}
