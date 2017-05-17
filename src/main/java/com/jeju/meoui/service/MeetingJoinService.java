package com.jeju.meoui.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class MeetingJoinService {

	@Autowired
	private MeetingJoinDAO dao;
	
	public void createMeetingJoin(MeetingJoin meetingJoin){
		dao.insertMeetingJoin(meetingJoin);
		
	}
	
	public void deleteMeetingJoin(int memberNo){
		dao.deleteMeetingJoin(memberNo);
	}
	
}
