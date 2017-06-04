package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class MeetingJoinDAO {

	
	@Autowired
	private SqlSessionTemplate template;
	
	
	//모임 가입하기(완료)
	public void insertMeetingJoin(MeetingJoin meetingJoin){
		
		template.insert("MeetingJoin.insertMeetingJoin",meetingJoin);
		
	}
		
	//모임 탈퇴하기(완료)
	public void deleteMeetingJoin(int memberNo, int meetingNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("meetingNo", meetingNo);		
		template.delete("MeetingJoin.deleteMeetingJoin",map);
		
	}
	//모임 탈퇴하기 관리자용	
	public void deleteMeetingJoinAdmin(int meetingNo){
		template.delete("MeetingJoin.deleteMeetingJoinAdmin", meetingNo);
	}
	
	
	//내 모임보기
	public List<MemberMeeting> selectMyMeeting(int memberNo){
		return template.selectList("MeetingJoin.selectMyMeeting",memberNo);
	}
	
}
