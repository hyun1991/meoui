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
	private static final Logger logger= LoggerFactory.getLogger(MeetingJoin.class);

	
	//모임 가입하기
	@RequestMapping(value="membermeeting/join", method=RequestMethod.POST)
	public String insertMeetingJoin(@ModelAttribute MeetingJoin meetingJoin){
		return "membermeeting/view";
	}	
	
	
		
	
	//가입한 리스트 보기
	@RequestMapping(value="/meetingjoin/list", method=RequestMethod.GET)
	public String selectMyMeeting(Model model, HttpSession session){
		int memberNo = (Integer)session.getAttribute("memberNo");		
		model.addAttribute("result", service.selectMyMeeting(memberNo));
		logger.info("미팅조인 가입한 리스트 보기 :[]", memberNo);
		return "meetingjoin/list";
				
	}
	
	
}
