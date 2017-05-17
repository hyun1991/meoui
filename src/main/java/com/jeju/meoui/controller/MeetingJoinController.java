package com.jeju.meoui.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class MeetingJoinController {

	@Autowired
	private MeetingJoinService service;
	
	@RequestMapping(value="*", method=RequestMethod.POST)
	public String insertMeetingJoin(@ModelAttribute MeetingJoin meetingJoin){
		service.createMeetingJoin(meetingJoin);
		return "*/";
	}
	
	
	
	
}
