package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class MemberMeetingDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	// 모임 생성하기
	public void insertMemberMeeting(MemberMeeting memberMeeting){
		template.insert("MemberMeetingMapper.insetMemberMeeting", memberMeeting);		
	}
	
	//모임 수정하기	
	//이름으로 가지고 와서 이름만 수정
	public void updateMeetingName(String meetingName){
		template.update("MemberMeetingMapper.updateMeetingName", meetingName);		
	}
	
	//모임삭제하기 
	//번호로 가지고와서 삭제
	public void deleteMembeMeeting(int meetingNo){
		template.delete("MemberMeetingMapper.deleteMembermeeting", meetingNo);
	}
	
	//모임 리스트 출력
	public List<MemberMeeting> selectAllMemberMeetingList(){
		return template.selectList("MemberMeetingMapper.selectAllMemberMeetingList");
	}
	
	//모임명 검색
	public MemberMeeting selectMemberName(String meetingName){
		return template.selectOne("MemberMeetingMapper.selectMemberName",meetingName);
	}
	
	//모임인원수별 리스트 조회
	public List<MemberMeeting> selectmemberTotal(int meetintTotal){
		return template.selectList("MembermeetingMapper.selectMeetingTotal",meetintTotal);	}
	
}
