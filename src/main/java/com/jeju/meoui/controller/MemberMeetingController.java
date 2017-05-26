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
	public String isnertMemberMeeting(HttpSession session, @RequestParam String meetingName, 
		@RequestParam("Img")MultipartFile meetingImg){
		MemberMeeting memberMeeting= new MemberMeeting();
		MeetingJoin meetingJoin = new MeetingJoin();
		int meetingAdminNo= (Integer)session.getAttribute("memberNo");
		int memberNo = (Integer)session.getAttribute("memberNo");
		int meetingNo=service.selectMaxMeetingNo();
		String fileName= UploadUtil.storeAndGetFileName(meetingImg, ctx, path);
		meetingJoin.setMemberNo(memberNo);
		logger.info("meetingNo:{}", meetingNo);
		meetingJoin.setMeetingNo(meetingNo);
		logger.info("meetingNo:{}", meetingNo);
		memberMeeting.setMeetingImg(fileName);
		memberMeeting.setMeetingName(meetingName);
		memberMeeting.setMeetingAdminNo(meetingAdminNo);
		
		service.createMemberMeeting(memberMeeting, meetingJoin);
		logger.info("멤버넘버:{}", memberMeeting);
		return "redirect:/membermeeting/list";
	}

	//모임 수정(작업완료)
	@RequestMapping(value="/membermeeting/update", method=RequestMethod.GET)
	public String updateMemberMeeting(){
		return "membermeeting/update";
	}
	
	
	//모임수정 완료
	@RequestMapping(value="/membermeeting/update", method=RequestMethod.POST)
	public String updateMemberMeeting(@RequestParam String meetingName, @RequestParam String memberName,
			@RequestParam("Img")MultipartFile meetingImg ,HttpSession session, Model model){
		MemberMeeting memberMeeting= new MemberMeeting();	
		int meetingNo = (Integer)session.getAttribute("meetingNo");
		String fileName= UploadUtil.storeAndGetFileName(meetingImg, ctx, path);
		memberMeeting.setMeetingName(meetingName);
		memberMeeting.setMeetingImg(fileName);	
		model.addAttribute("membermeeting", memberMeeting);
		logger.info("멤머미팅완료 멤버넘버:{}", meetingNo);
		return "redurect:/membermeeting/list";
	}
	
	//모임 상세 보기(작업중)
	@RequestMapping(value="/membermeeting/view/{meetingNo}", method=RequestMethod.GET)
	public String selectMeetingView(@PathVariable int meetingNo, Model model, HttpSession session){
		session.setAttribute("meetingNo", meetingNo);
		model.addAttribute("meeting",service.selectMeetingView(meetingNo));
		logger.info("멤머미팅 멤버넘버:{}", meetingNo);
		return "membermeeting/view";
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
	// 리스트 출력(작업완료)
	@RequestMapping(value="/membermeeting/list", method=RequestMethod.GET)
	public String AllMemberMeeting(Model model, HttpSession session){	
		MemberMeeting meetingNo=new MemberMeeting();
		session.setAttribute("meetingNo", meetingNo);
		logger.info("컨트롤 시작");
		model.addAttribute("result", service.selectAllmemberMeetingList());
		logger.info("멤머미팅리스트출력 세션멤버미팅:", meetingNo);
		return "membermeeting/list";
	}
	//가입한 모임 리스트 보기(작업완료)
	@RequestMapping(value="/meetingjoin/list", method=RequestMethod.GET)
	public String selectMyMeeting(Model model, HttpSession session){
			int memberNo = (Integer)session.getAttribute("memberNo");		
			model.addAttribute("result", service.selectMyMeeting(memberNo));
			logger.info("멤버미팅 가입한 리스트 보기 :[]", model);
			return "meetingjoin/list";
					
		}
	
}
