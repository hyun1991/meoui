package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.util.PagingUtil;
import com.jeju.meoui.vo.*;;

@Service
public class MemberMeetingService {
	
	@Autowired
	private MemberMeetingDAO dao;
	@Autowired
	private MeetingJoinDAO joindao;
	@Autowired
	private MeetingBoardCommentDAO comdao;
	@Autowired
	private MeetingBoardDAO boarddao;
	@Autowired
	private MemberMeetingDAO meetingdao;
	
	private Logger logger= LoggerFactory.getLogger(MemberMeetingService.class);
	//모임생성
	@Transactional
	public void createMemberMeeting(MemberMeeting memberMeeting, MeetingJoin meetingJoin){
		dao.insertMemberMeeting(memberMeeting);
		logger.info("{}",dao.selectMaxMeetingNo());
		int meetingNo= dao.selectMaxMeetingNo();
		meetingJoin.setMeetingNo(meetingNo);
		joindao.insertMeetingJoin(meetingJoin);
		meetingdao.updateMemberMeetingTotalNumber(meetingNo);
	}
	//마지막 번호 찾기
	public int selectMaxMeetingNo(){
		return dao.selectMaxMeetingNo();
	}
	
	
	//모임수정
	public void updataMeetingName(MemberMeeting memberMeeting){
		
		dao.updateMeetingName(memberMeeting);
		logger.info("모임수정:{}", memberMeeting);
	}
	
	//모임삭제(유저용)
		@Transactional
		public void deleteMemberMeeting(int meetingNo, int memberNo){
			
			logger.info("멤버미팅서비스 meeingtno : {}",meetingNo);
			logger.info("멤버미팅서비스 memberNo : {}",meetingNo);
			comdao.deleteMeetingboardCommentAdmin(meetingNo); //댓글 삭제
			logger.info("댓글삭제 완료");
			boarddao.deleteMeetingBoardAdmin(meetingNo);//게시판 삭제											//모임게시판 삭제
			logger.info("모임게시판 삭제완료");
			joindao.deleteMeetingJoinAdmin(meetingNo);	//가입 삭제		
			logger.info("가입삭제 완료");
			dao.deleteMembeMeetingUser(meetingNo, memberNo); //모임삭제		
			logger.info("모임삭제 완료 ");
		}
	
	//모임삭제(관리자용)
		public void deleteMemberMeeting(int meetingNo){
		//comdao.deleteMeetingboardCommentAmin(meetingNo); //댓글 삭제
		//boarddao.deleteMeetingBoardAdmin(meetingNo);//게시판 삭제											//모임게시판 삭제
		//joindao.deleteMeetingJoinAdmin(meetingNo);	//가입 삭제
		//dao.deleteMembeMeetingAdmin(meetingNo);
		
	
	}
		
	//모임 세부 정보 보기
	public MemberMeeting selectMeetingView(int meetingNo){
		logger.info("뷰보기:{}", meetingNo);
		return dao.selectMeetingView(meetingNo);
	}
	
	//모임 리스트 출력 페이징
	public HashMap<String, Object> selectAllmemberMeetingList(int pageNo){	
		int cnt=dao.selectByMax();
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", dao.selectAllMemberMeetingList(pagination.getStartRow(), pagination.getLastRow()));
		return map;		
	}
	
	//모임 이름으로 검색
	public MemberMeeting selectMeetingName(String meetingName){
		return dao.selectMeetingName(meetingName);
	}
	//모임인원 내림차순으로 보기
	public HashMap<String, Object> selectMeetingTotal(int pageNo){
		int cnt=dao.selectByMax();
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", dao.selectMeetingTotal(pagination.getStartRow(), pagination.getLastRow()));
		return map;
	}
	//내가 가입한 모임 보기
	public HashMap<String, Object> selectMyMeeting(int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		List<MemberMeeting>list = dao.selectMyMeeting(memberNo);
		map.put("list", list);		
		logger.info("멤버미팅 내모임리스트:{}", list);
		return map;
	}
	
	
	
}
