package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;;

@Service
public class MemberMeetingService {
	
	@Autowired
	private MemberMeetingDAO dao;
	private Logger logger= LoggerFactory.getLogger(MemberMeetingService.class);
	//모임생성
	public void createMemberMeeting(MemberMeeting memberMeeting){
		dao.insertMemberMeeting(memberMeeting);
	}
	
	//모임수정
	public void updataMeetingName(MemberMeeting memberMeeting){
		dao.updateMeetingName(memberMeeting);
	}
	//모임삭제
	public void deleteMemberMeeting(int meetingNo){
		dao.deleteMembeMeeting(meetingNo);
	}
	//모임 리스트 출력
	public HashMap<String, Object> selectAllmemberMeetingList(){	
		HashMap<String, Object>map= new HashMap<String, Object>();
		List<MemberMeeting>list = dao.selectAllMemberMeetingList();
		map.put("list", list);
		logger.info("모임리스트:{}", list);
		return map;
	}
	
	//모임 이름으로 검색
	public MemberMeeting selectMeetingName(String meetingName){
		return dao.selectMeetingName(meetingName);
	}
	//모임인원 오름차순으로 보기
	public List<MemberMeeting> selectMeetingTotal(int meetingTotal){
		return dao.selectMeetingTotal(meetingTotal);
	}
	//내가 가입한 모임 보기
	public MemberMeeting selectMyMeeting(int memberNo){
		return dao.selectMyMeeting(memberNo);
	}	
	
	
}
