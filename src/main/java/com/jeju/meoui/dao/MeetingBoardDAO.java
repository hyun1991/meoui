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

	
	public void insertMeetingBoard(MeetingBoard meetingBoard){
		template.insert("MeetingBoard.insertMeetingBoard",meetingBoard);
	}
	
	public List<MeetingBoard> selectAllMeetingBoard(int startRow , int lastRow){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("start", startRow);
		map.put("last", lastRow);
		return template.selectList("MeetingBoardMapper.selectAllmeetinBoard", map);
		}
	
	public int meetingBoardCount(){
		return template.selectOne("MeetingBoardMapper.meetingBoardCount");
	}
}
