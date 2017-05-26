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
		template.insert("MemberMeetingMapper.insertMemberMeeting", memberMeeting);	
		
	}

	//모임 수정하기	
	//번호로 가지고 와서 이름, 이미지 수정
	public void updateMeetingName(MemberMeeting memberMeeting){
		template.update("MemberMeetingMapper.updateMeetingName", memberMeeting);		
	}
	
	//모임삭제하기 
	//번호로 가지고와서 삭제
	public void deleteMembeMeeting(int meetingNo){
		template.delete("MemberMeetingMapper.deleteMembermeeting", meetingNo);
	}
	
	//모임 세부 정보 보기
	public MemberMeeting selectMeetingView(int meetingNo){
		return template.selectOne("MemberMeetingMapper.selectMeetingView", meetingNo);
	}
	
	//모임 리스트 출력
	public List<MemberMeeting> selectAllMemberMeetingList(){
		return template.selectList("MemberMeetingMapper.selectAllMemberMeetingList");
	}
	
	//모임명 검색
	public MemberMeeting selectMeetingName(String meetingName){
		return template.selectOne("MemberMeetingMapper.selectMeetingName",meetingName);
	}
	
	//모임인원수별 리스트 조회
	public List<MemberMeeting> selectMeetingTotal(int meetingTotal){
		return template.selectList("MembermeetingMapper.selectMeetingTotal",meetingTotal);	}
	
	//내가 가입한 모임 보기
	public List<MemberMeeting> selectMyMeeting(int memberNo){
		return template.selectList("MemberMeetingMapper.selectMyMeeting",memberNo);
	}
	
	//미팅 맥스넘버 찾기
	public int selectMaxMeetingNo(){
		return template.selectOne("MemberMeetingMapper.selectMaxMeetingNo");
	}
	
	
	
}
