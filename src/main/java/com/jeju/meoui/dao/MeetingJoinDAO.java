package com.jeju.meoui.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class MeetingJoinDAO {

	
	@Autowired
	private SqlSessionTemplate template;
	
	public void insertMeetingJoin(MeetingJoin meetingJoin){
		template.insert("MeetingJoin.insertMeetingJoin",meetingJoin);
		
	}
	
	public void deleteMeetingJoin(int memberNo){
		template.delete("MeetingJoin.deleteMeetingJoin",memberNo);
		
	}
	
}
