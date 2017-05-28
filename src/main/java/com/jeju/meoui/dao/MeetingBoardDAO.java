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
	
	
	public int meetingBoardCount(){
		return template.selectOne("MeetingBoardMapper.meetingBoardCount");
	}
}
