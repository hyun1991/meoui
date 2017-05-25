package com.jeju.meoui.controller;

import javax.annotation.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Controller
public class MeetingBoardController {

	@Autowired
	private MeetingBoardService service;
	@Autowired
	private ServletContext ctx;
	@Resource(name="path")
	private String path;

	
	//모임게시판 글쓰기
		@RequestMapping(value="metingboard/list", method=RequestMethod.GET)
		public String insertMeetingBoardForm(){
			
			System.out.println("s여기는 모임게시판 글쓰기 폼");
			return "meetingboard/list";
		}
		//모임게시판 글쓰기 완료
		@RequestMapping(value="meetingboard/list", method=RequestMethod.POST)
		public String insertMeetingBoard(HttpSession session,@ModelAttribute MeetingBoard meetingBoard, Model model, 
				@RequestParam("Img")MultipartFile meetingboardImg ){
			String fileName= UploadUtil.storeAndGetFileName(meetingboardImg, ctx, path);	
			int meetingNo = (Integer)session.getAttribute("meetingNo");
			int memberNo=(Integer)session.getAttribute("memberNo");	
			
			meetingBoard.setMeetingboardImg(fileName);
			meetingBoard.setMeetingNo(meetingNo);
			meetingBoard.setMemberNo(memberNo);
			service.createMeetingBoard(meetingBoard);
			
			return "redirect:/membermeeting/view";
		}
		// 모임게시판 전체 리스트
		@RequestMapping(value="/meetingboard/list" , method=RequestMethod.GET)
		public String allSite(Model model ,@RequestParam(defaultValue="1") int pageNo){
			model.addAttribute("result", service.selectAllMeetingBoard(pageNo));
			return "membermeeting/list";
		}
	
	
	
	
	
	
	/*//모임게시판 글쓰기
	@RequestMapping(value="metingboard/insert", method=RequestMethod.GET)
	public String insertMeetingBoardForm(){
		
		System.out.println("s여기는 모임게시판 글쓰기 폼");
		return "meetingboard/insert";
	}
	//모임게시판 글쓰기 완료
	@RequestMapping(value="meetingboard/insert", method=RequestMethod.POST)
	public String insertMeetingBoard(HttpSession session,@ModelAttribute MeetingBoard meetingBoard, Model model, 
			@RequestParam("Img")MultipartFile meetingboardImg ){
		String fileName= UploadUtil.storeAndGetFileName(meetingboardImg, ctx, path);	
		int meetingNo = (Integer)session.getAttribute("meetingNo");
		int memberNo=(Integer)session.getAttribute("memberNo");
		
		meetingBoard.setMeetingboardImg(fileName);
		meetingBoard.setMeetingNo(meetingNo);
		meetingBoard.setMemberNo(memberNo);
		service.createMeetingBoard(meetingBoard);
		
		
		return "redirect:/membermeeting/view";
	}
	*/
}
