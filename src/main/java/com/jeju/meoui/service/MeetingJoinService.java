package com.jeju.meoui.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.meoui.dao.MeetingJoinDAO;
import com.jeju.meoui.dao.MemberMeetingDAO;
import com.jeju.meoui.vo.MeetingJoin;
import com.jeju.meoui.vo.MemberMeeting;

@Service
public class MeetingJoinService {

	@Autowired
	private MeetingJoinDAO dao;
	@Autowired
	private MemberMeetingDAO meetingdao;
	private Logger logger= LoggerFactory.getLogger(MeetingJoinDAO.class);
	private Logger memterlogger= LoggerFactory.getLogger(MemberMeetingDAO.class);
	
	//모임가입
	@Transactional
	public void createMeetingJoin(MeetingJoin meetingJoin, int meetingNo){
		dao.insertMeetingJoin(meetingJoin);
		meetingdao.updateMemberMeetingTotalNumber(meetingNo);
		logger.info("미팅조인dao:",meetingJoin);
		memterlogger.info("멤버미팅미팅번호dao:",meetingNo);
		
	}
	
	//모임탈퇴(완료)
	public void deleteMeetingJoin(int memberNo, int meetingNo){
		
		dao.deleteMeetingJoin(memberNo, meetingNo);
	}
	
	//내 모임보기
	
	public HashMap<String, Object> selectMyMeetingJoin(int meetingNo, int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		List<MeetingJoin>list = dao.selectMyMeetingJoin(meetingNo, memberNo);;
		map.put("list", list);		
		logger.info("미팅조인 내가입리스트{}", list);
		return map;	
	}
	
	//내 모임보기
	public HashMap<String, Object> selectMyMeetingJoinMemberNo(int memberNo){
		
		HashMap<String, Object>map= new HashMap<String, Object>();
		List<MeetingJoin>list = dao.selectMyMeetingJoinMemberNo(memberNo);;
		map.put("list", list);		
		logger.info("미팅조인 내가입리스트2{}", list);
		return map;	
	}
	
	
	
	public  HashMap<String, Object> selectMemberAllList(){
		HashMap<String, Object>map= new HashMap<String, Object>();
		List<MeetingJoin>list = dao.selectMemberAllList();
		map.put("list", list);
		return map;
	}
	
	
	
	//모임탈퇴 관리자용
	
	
	
	//내가 가입한 모임 리스트 보기
	/*public HashMap<String, Object> selectMyMeeting(int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		List<MemberMeeting>list = dao.selectMyMeeting(memberNo);
		map.put("list", list);
		
		logger.info("미팅조인 내모임리스트:{}", list);
		return map;
	}*/
	
	
}
