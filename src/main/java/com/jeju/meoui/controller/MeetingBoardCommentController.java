package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class MeetingBoardCommentController {

	
	@Autowired
	private MeetingBoardCommentService service;
	
	private static final Logger logger= LoggerFactory.getLogger(MeetingBoardCommentController.class);

	

	
	//댓글 추가
	@RequestMapping(value="metingcomment/insert", method=RequestMethod.POST)
	public String insertMeetingBoardComment(@ModelAttribute MeetingBoardComment meetingboardComment,
				HttpSession session){
			int meetingboardNo = (Integer)session.getAttribute("meetingboardNo");
			int memberNo=(Integer)session.getAttribute("memberNo");			
			meetingboardComment.setMeetingboardNo(meetingboardNo);
			meetingboardComment.setMemberNo(memberNo);		
			service.insertMeetingBoardComment(meetingboardComment);
			logger.info("댓글추가 보드번호 : {}", meetingboardNo);
			logger.info("댓글추가 멤버 번호 : {}", meetingboardNo);
			return "redirect:/meetingboard/view/"+meetingboardNo;
	}
	
	//댓글 삭제
	
	@RequestMapping(value="metingcomment/delete/{meetingboardCommentNo}", method=RequestMethod.POST)
	public String deleteMeetingBoardComment(@PathVariable int meetingboardCommentNo, HttpSession session){
		int meetingboardNo=(Integer)session.getAttribute("meetingboardNo");
		int memberNo = (Integer)session.getAttribute("memberNo");
		logger.info("댓글 삭제 번호  : {}", meetingboardCommentNo);
		logger.info("댓글추가 멤버 번호 : {}", meetingboardNo);
		
		service.deleteMeetingboardComment(meetingboardCommentNo, memberNo);
		
		
		return "redirect:/meetingboard/view/"+meetingboardNo;
		
		
	}
	
	
	
	
}
