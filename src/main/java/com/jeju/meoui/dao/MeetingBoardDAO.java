package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class MeetingBoardDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	
	
	//글 작성
	public void insertMeetingBoard(MeetingBoard meetingBoard){
		template.insert("MeetingBoardMapper.insertMeetingBoard",meetingBoard);
	}
	
	//리스트 출력
	public List<MeetingBoard> selectAllMeetingBoard(int startRow , int lastRow, int meetingNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("meetingNo", meetingNo);
		map.put("start", startRow);
		map.put("last", lastRow);		
		return template.selectList("MeetingBoardMapper.selectAllmeetinBoard", map);
		}
	
	//게시글 수정
	public void updateMeetingBoard(MeetingBoard meetingBoard){
	//	HashMap<String, Object>map= new HashMap<String, Object>();
		//map.put("meetingNo", meetingNo);
	//	map.put("memberNo", memberNo);
		template.update("MeetingBoardMapper.updateMeetingBoard", meetingBoard);
	}
	
	
	public int meetingBoardCount(){
		return template.selectOne("MeetingBoardMapper.meetingBoardCount");
	}
	
	//게시글 조회 증가
	public void updateMeetingBoardCnt(int meetingboardNo){
		template.update("MeetingBoardMapper.updateMeetingBoardCnt", meetingboardNo);
	}
	
	
	//상세보기
	public MeetingBoard selectMeetingBoardView(int meetingboardNo){
	
		return template.selectOne("MeetingBoardMapper.selectMeetingBoardView", meetingboardNo);
	}
	
	//번호로 삭제
	public void deleteMeetingBoard(int meetingboardNo){
			template.delete("MeetingBoardMapper.meetingBoardDelete",meetingboardNo);
	}
	
	//번호로 삭제(관리자용)
	public void deleteMeetingBoardAdmin(int meetingNo){
			template.delete("MeetingBoardMapper.meetingBoardDeleteAdmin",meetingNo);
	}
	//미팅번호 갯수 불러오기
	public int selectCountMeetingNo(int meetingNo){
		return template.selectOne("MeetingBoardMapper.selectCountMeetingNo",meetingNo);
		
	}
	
	//댓글수 증가
	public void updateMeetingBoardCommentCnt(int meetingboardNo){
		
		template.selectOne("MeetingBoardMapper.updateMeetingBoardCommentCnt", meetingboardNo);
		
	}
	
	
	
	
	
	
	
	
}
