package com.jeju.meoui.controller;

import javax.annotation.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Controller
public class MemberMeetingController {
	
	
	@Autowired
	private MemberMeetingService service;
	@Autowired
	private ServletContext ctx;
	@Resource(name="path")
	private String path;
	private static final Logger logger= LoggerFactory.getLogger(MemberMeetingController.class);
	
	//	모임 생성	
	@RequestMapping(value="/membermeeting/create", method=RequestMethod.GET)
	public String insertMemberMeeting(){
		return "membermeeting/create";
	}
	//	모임생성 완료
	@RequestMapping(value="/membermeeting/create", method=RequestMethod.POST)
	public String isnertMemberMeeting(@RequestParam String meetingName, @RequestParam("Img")MultipartFile meetingImg){
		MemberMeeting memberMeeting= new MemberMeeting();
		String fileName= UploadUtil.storeAndGetFileName(meetingImg, ctx, path);
		memberMeeting.setMeetingImg(fileName);
		memberMeeting.setMeetingName(meetingName);
		service.createMemberMeeting(memberMeeting);
		return "redirect:/membermeeting/list";
	}

	
	//모임수정 완료
	@RequestMapping(value="/membermeeting/update/{meetingNo}", method=RequestMethod.GET)
	public String updateMemberMeeting(@PathVariable int meetingNo, @ModelAttribute MemberMeeting memberMeeting, 
	HttpSession session, Model model){
		session.setAttribute("meetingNo", meetingNo);
		model.addAttribute("result", service.selectAllmemberMeetingList());
		return "membermeeting/update";		
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
			return "membermeeting/update";		
	}
	// 리스트 출력
	@RequestMapping(value="/membermeeting/list", method=RequestMethod.GET)
	public String AllMemberMeeting(Model model){	
		logger.info("컨트롤 시작");
		model.addAttribute("result", service.selectAllmemberMeetingList());
		return "membermeeting/list";
	}
	
	
}
