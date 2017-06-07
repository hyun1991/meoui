package com.jeju.meoui.controller;
import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;


@Controller
public class MeetingJoinController {

	@Autowired
	private MeetingJoinService service;
	private static final Logger logger= LoggerFactory.getLogger(MeetingJoinController.class);

	

	//모임 가입하기(완료)
	@RequestMapping(value="membermeeting/post/{meetingNo}", method=RequestMethod.POST)
	public String insertMeetingJoin(@PathVariable int meetingNo, HttpSession session, Model model){
		MeetingJoin meetingJoin = new MeetingJoin();
		int memberNo= (Integer)session.getAttribute("memberNo");
		meetingJoin.setMeetingNo(meetingNo);
		meetingJoin.setMemberNo(memberNo);
		System.out.println(meetingJoin);
		
		service.createMeetingJoin(meetingJoin,meetingNo);
		logger.info("미팅조인:{}", meetingJoin);
		logger.info("미팅조인:{}", meetingNo);
		return "redirect:/membermeeting/list";
		
	}
	
	//모임 탈퇴하기(완료)
	@RequestMapping(value="meetinjoin/list/bye/{meetingNo}", method=RequestMethod.GET)
	public String deleteMeeting(@PathVariable int meetingNo ,HttpSession session){
		int memberNo = (Integer)session.getAttribute("memberNo");
		//int meetingNo = (Integer)session.getAttribute("meetingNo");
		logger.info("미팅조인 탈퇴 회원번호:{}", memberNo);
		logger.info("미팅조인 탈퇴 모임번호:{}", meetingNo);		
		service.deleteMeetingJoin(memberNo, meetingNo);
		return "redirect:/membermeeting/list";
	}
	
	@RequestMapping(value="membermeeting/list", method=RequestMethod.POST)
	public String selectMemberAllList(HttpSession session, Model model){
		int meetingNo=(Integer)session.getAttribute("meetingNo");
		model.addAttribute("join",service.selectMemberAllList(meetingNo));
		logger.info("미팅조인멤버미팅으로멤버넘버 :{}",service.selectMemberAllList(meetingNo));
	
		//session.removeAttribute("meetingNo");
		
		return "membermeeting/list";
	}
	
	
	
	
	
	
}
