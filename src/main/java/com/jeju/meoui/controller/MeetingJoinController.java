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
	@RequestMapping(value="membermeeting/post", method=RequestMethod.POST)
	public String insertMeetingJoin(HttpSession session){
		System.out.println("1111111111111111111111");
		MeetingJoin meetingJoin = new MeetingJoin();
		int meetingNo= (Integer)session.getAttribute("meetingNo");
		int memberNo= (Integer)session.getAttribute("memberNo");
		meetingJoin.setMeetingNo(meetingNo);
		meetingJoin.setMemberNo(memberNo);
		System.out.println(meetingJoin);
		service.createMeetingJoin(meetingJoin);
		logger.info("미팅조인:{}", meetingJoin);
		logger.info("미팅조인:{}", meetingNo);
		return "redirect:/membermeeting/list";
		
	}
	
	//모임 탈퇴하기
	@RequestMapping(value="membermeeting/view/", method=RequestMethod.GET)
	public String deleteMeeting(@PathVariable int memberNo, HttpSession session){
		memberNo = (Integer)session.getAttribute("memberNo");
		service.deleteMeetingJoin(memberNo);
		return "redirect:membermeeting/list";
	}
}
