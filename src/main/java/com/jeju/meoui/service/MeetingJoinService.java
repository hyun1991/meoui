package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class MeetingJoinService {

	@Autowired
	private MeetingJoinDAO dao;
	private Logger logger= LoggerFactory.getLogger(MemberMeetingService.class);
	
	//모임가입
	public void createMeetingJoin(MeetingJoin meetingJoin){
		dao.insertMeetingJoin(meetingJoin);
		
	}
	
	//모임탈퇴
	public void deleteMeetingJoin(int memberNo){
		dao.deleteMeetingJoin(memberNo);
	}
	
	//내가 가입한 모임 리스트 보기
	public HashMap<String, Object> selectMyMeeting(int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		List<MemberMeeting>list = dao.selectMyMeeting(memberNo);
		map.put("list", list);
		logger.info("내모임리스트:{}", list);
		return map;
	}
	
	
}
