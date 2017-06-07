package com.jeju.meoui.controller;
import java.io.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.validation.*;
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
	public void insertMeetingJoin(@PathVariable int meetingNo, HttpSession session, Model model,HttpServletResponse response) throws IOException{
		MeetingJoin meetingJoin = new MeetingJoin();
		int memberNo= (Integer)session.getAttribute("memberNo");
		meetingJoin.setMeetingNo(meetingNo);
		meetingJoin.setMemberNo(memberNo);
		service.createMeetingJoin(meetingJoin,meetingNo);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("<script>alert('모임활동은 마이페이지내 나의 모임리스트 참고해주세요'); history.go(-1);</script>");
		out.flush();
		out.close();	
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
