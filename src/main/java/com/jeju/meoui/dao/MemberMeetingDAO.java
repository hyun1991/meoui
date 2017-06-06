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
	
	
	// 모임 생성하기 완료
	public void insertMemberMeeting(MemberMeeting memberMeeting){
		template.insert("MemberMeetingMapper.insertMemberMeeting", memberMeeting);	
		
	}

	//모임 수정하기	
	//번호로 가지고 와서 이름, 이미지 수정
	public void updateMeetingName(MemberMeeting memberMeeting){
		template.update("MemberMeetingMapper.updateMeetingName", memberMeeting);		
	}
	
	//모임삭제하기 
	//번호로 가지고와서 생성한 사람이 삭제
	public void deleteMembeMeetingUser(int meetingNo, int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("meetingNo", meetingNo);
		map.put("memberNo", memberNo);
		template.delete("MemberMeetingMapper.deleteMemberMeetingUser", map);
	}
	//모임삭제하기 
	//번호로 가지고와서 관리자가
	public void deleteMembeMeetingAdmin(int meetingNo){
		template.delete("MemberMeetingMapper.deleteMemberMeetingAdmin", meetingNo);
	}
	
	
	//모임 세부 정보 보기
	public MemberMeeting selectMeetingView(int meetingNo){
		return template.selectOne("MemberMeetingMapper.selectMeetingView", meetingNo);
	}
	
	//모임 리스트 출력 페이징
	public List<MemberMeeting> selectAllMemberMeetingList(int startRow, int lastRow){
		HashMap<String, Object>map= new HashMap<String, Object>();		
		map.put("startRow", startRow);
		map.put("lastRow", lastRow);
		
		return template.selectList("MemberMeetingMapper.selectAllMemberMeetingList", map);
	}
	
	//모임명 검색
	public MemberMeeting selectMeetingName(String meetingName){
		return template.selectOne("MemberMeetingMapper.selectMeetingName",meetingName);
	}
	
	//모임인원수별 리스트 조회
	public List<MemberMeeting> selectMeetingTotal(int startRow, int lastRow){
		HashMap<String, Object>map= new HashMap<String, Object>();		
		map.put("startRow", startRow);
		map.put("lastRow", lastRow);
		return template.selectList("MembermeetingMapper.selectMeetingTotal", map);	}
	
	//내가 가입한 모임 보기
	public List<MemberMeeting> selectMyMeeting(int memberNo){
		return template.selectList("MemberMeetingMapper.selectMyMeeting",memberNo);
	}
	
	//미팅 맥스넘버 찾기
	public int selectMaxMeetingNo(){
		return template.selectOne("MemberMeetingMapper.selectMaxMeetingNo");
	}
	//등록된 미팅넘버 검사
	public int selectByMax(){
		return template.selectOne("MemberMeetingMapper.selectByMax");
	}
	
	
	//토탈넘버 증가
	public void updateMemberMeetingTotalNumber(int meetingNo){
		template.update("MemberMeetingMapper.updateMemberMeetingTotalNumber", meetingNo);
		
	}
	
	
	
}
