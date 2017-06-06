package com.jeju.meoui.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeju.meoui.service.MemberMeetingService;
import com.jeju.meoui.vo.MemberMeeting;

@Controller
public class MemberMeetingAjaxController {

		@Autowired
		private MemberMeetingService service;
		private static final Logger logger= LoggerFactory.getLogger(MemberMeetingController.class);
		
		//모임 인기순
		@RequestMapping(value="membeermeeting/list/totalnumber", method=RequestMethod.POST)
		public String selectMeetingTotalNumber(Model model, HttpSession session,@RequestParam(defaultValue="1") int pageNo){
			MemberMeeting meetingNo=new MemberMeeting();
			session.setAttribute("meetingNo", meetingNo);	
			model.addAttribute("list", service.selectMeetingTotal(pageNo));				
			logger.info("컨트롤 시작d:{}",meetingNo);		
			logger.info("컨트롤 시작d:{}",service.selectMeetingTotal(pageNo));
			//logger.info("멤버미팅리스트출력:{}",meetingNo);
			return "membermeeting/list";		
		}
	
}
