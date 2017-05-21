package com.jeju.meoui.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;;

@Service
public class MemberMeetingService {
	
	@Autowired
	private MemberMeetingDAO dao;
	
	//모임생성
	public void createMemberMeeting(MemberMeeting memberMeeting){
		dao.insertMemberMeeting(memberMeeting);
	}
	//모임수정
	public void updataMeetingName(MemberMeeting meetingName){
		dao.updateMeetingName(meetingName);
	}
	//모임삭제
	public void deleteMemberMeeting(int meetingNo){
		dao.deleteMembeMeeting(meetingNo);
	}
	//모임 리스트 출력
	public List<MemberMeeting> selectAllmemberMeetingList(){
		
		List<MemberMeeting>list = dao.selectAllMemberMeetingList();
		return list;
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
