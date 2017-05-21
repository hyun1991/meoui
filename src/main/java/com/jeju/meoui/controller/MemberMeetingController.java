package com.jeju.meoui.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.meoui.service.MemberMeetingService;
import com.jeju.meoui.vo.MemberMeeting;

@Controller
public class MemberMeetingController {

	
	@Autowired
	private MemberMeetingService service;
	private static final Logger logger= LoggerFactory.getLogger(MemberMeetingController.class);
	
	//모임 생성	
	@RequestMapping(value="/membermeeting/create", method=RequestMethod.GET)
	public String insertMemberMeeting(@ModelAttribute MemberMeeting memberMeeting){
		logger.info("모임생성 vo:{}", memberMeeting);
		service.createMemberMeeting(memberMeeting);
		return "membermeeting/create";
	}
	
	//모임수정 폼
	@RequestMapping(value="/membermeeting/update", method=RequestMethod.GET)
	public String updateMemberMeeting(){
		return "*";
	}
	//모임수정 완료
	@RequestMapping(value="/membermeeting/update", method=RequestMethod.POST)
	public String updateMemberMeeting(@ModelAttribute MemberMeeting meetingName, HttpSession session)
	{
		service.updataMeetingName(meetingName);
		return "*";		
	}
	
	//모임 삭제
	@RequestMapping(value="/membermeeting/delete", method=RequestMethod.GET)
	public String deleteMemberMeeting(){
		return "*";
	}
	
	//모임 삭제 완료	
	@RequestMapping(value="/membermeeting/delete", method=RequestMethod.POST)
		public String deleteMemberMeeting(int meetingNo){
			service.deleteMemberMeeting(meetingNo);
			return "*";		
	}
	// 리스트 출력
	@RequestMapping(value="/membermeeting/list", method=RequestMethod.GET)
	public String AllMemberMeeting(Model model){
		 System.out.println("여기까지 가나?");
		 logger.info("리스트출력1 vo:{}", model);
		model.addAttribute("result", service.selectAllmemberMeetingList());
		return "membermeeting/list";
	}
	
	
}
