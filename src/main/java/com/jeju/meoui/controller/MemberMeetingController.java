package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class MemberMeetingController {

	
	@Autowired
	private MemberMeetingService service;
	private static final Logger logger= LoggerFactory.getLogger(MemberController.class);
	
	//모임 생성	
	@RequestMapping(value="/membermeeting/join", method=RequestMethod.POST)
	public String insertMemberMeeting(@ModelAttribute MemberMeeting memberMeeting){
		service.createMemberMeeting(memberMeeting);
		return "*";
	}
	
	//모임수정 폼
	@RequestMapping(value="*", method=RequestMethod.GET)
	public String updateMemberMeeting(){
		return "*";
	}
	//모임수정 완료
	@RequestMapping(value="*", method=RequestMethod.POST)
	public String updateMemberMeeting(@ModelAttribute MemberMeeting meetingName, HttpSession session)
	{
		service.updataMeetingName(meetingName);
		return "*";		
	}
	
	//모임 삭제
	@RequestMapping(value="", method=RequestMethod.GET)
	public String deleteMemberMeeting(){
		return "*";
	}
	
	//모임 삭제 완료	
	@RequestMapping(value="", method=RequestMethod.POST)
		public String deleteMemberMeeting(int meetingNo){
			service.deleteMemberMeeting(meetingNo);
			return "*";		
	}
	
}
