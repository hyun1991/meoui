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
	
	//	모임 생성(작업완료)
	@RequestMapping(value="/membermeeting/create", method=RequestMethod.GET)
	public String insertMemberMeeting(){
		return "membermeeting/create";
	}
	//	모임생성 완료(작업완료)
	@RequestMapping(value="/membermeeting/create", method=RequestMethod.POST)
	public String isnertMemberMeeting(HttpSession session, @RequestParam String meetingName, @RequestParam("Img")MultipartFile meetingImg){
		MemberMeeting memberMeeting= new MemberMeeting();
		int meetingAdminNo= (Integer)session.getAttribute("memberNo");
		String fileName= UploadUtil.storeAndGetFileName(meetingImg, ctx, path);
		memberMeeting.setMeetingImg(fileName);
		memberMeeting.setMeetingName(meetingName);
		memberMeeting.setMeetingAdminNo(meetingAdminNo);
		service.createMemberMeeting(memberMeeting);
		logger.info("멤버넘버:{}", memberMeeting);
		return "redirect:/membermeeting/list";
	}

	//모임 업데이트(작업완료)
	@RequestMapping(value="/membermeeting/update/{meetingNo}", method=RequestMethod.GET)
	public String updateMemberMeeting(){
		return "membermeeting/update";
	}
	
	//모임수정 완료
	@RequestMapping(value="/membermeeting/update/{meetingNo}", method=RequestMethod.POST)
	public String updateMemberMeeting(@RequestParam String meetingName, @RequestParam String memberName,
			@RequestParam("Img")MultipartFile meetingImg 
	,HttpSession session, @PathVariable int meetingNo, @PathVariable int meetingTotalNumber){
		MemberMeeting memberMeeting= new MemberMeeting();
		session.setAttribute("meetingNo", meetingNo);
<<<<<<< HEAD
		return "membermeeting/update";		
=======
		session.setAttribute("meetingTotalNumber",meetingTotalNumber);
		memberMeeting.setMeetingName(meetingName);
		service.updataMeetingName(memberMeeting);
		return "redurect:/membermeeting/list";		
>>>>>>> branch 'master' of https://github.com/hyun1991/meoui.git
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
