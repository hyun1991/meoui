package com.jeju.meoui.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.meoui.vo.MeetingBoard;

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
	
	
	public int meetingBoardCount(){
		return template.selectOne("MeetingBoardMapper.meetingBoardCount");
	}
	//상세보기
	public MeetingBoard selectMeetingBoardView(int meetingboardNo){
		return template.selectOne("MeetingBoardMapper.selectMeetingBoardView", meetingboardNo);
	}
	
	//번호로 삭제
	public void deleteMeetingBoard(int meetingboardNo){
			template.delete("MeetingBoardMapper.meetingBoardDelete",meetingboardNo);
	}
	
}
