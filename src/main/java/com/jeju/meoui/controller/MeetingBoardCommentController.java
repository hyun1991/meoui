package com.jeju.meoui.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.meoui.service.MeetingBoardCommentService;
import com.jeju.meoui.service.MeetingBoardService;
import com.jeju.meoui.service.MeetingJoinService;
import com.jeju.meoui.vo.MeetingBoardComment;

@Controller
public class MeetingBoardCommentController {

	@Autowired
	private MeetingBoardCommentService service;
	
	@Autowired
	private MeetingBoardService boardservice;

	private static final Logger logger = LoggerFactory.getLogger(MeetingBoardCommentController.class);

	// 댓글 추가
	@Transactional
	@RequestMapping(value = "meetingcomment/insert", method = RequestMethod.POST)
	public String insertMeetingBoardComment(@ModelAttribute MeetingBoardComment meetingboardComment,
			HttpSession session) {
		int meetingNo = (Integer) session.getAttribute("meetingNo");
		int meetingboardNo = (Integer) session.getAttribute("meetingboardNo");
		int memberNo = (Integer) session.getAttribute("memberNo");
		meetingboardComment.setMeetingNo(meetingNo);
		meetingboardComment.setMeetingboardNo(meetingboardNo);
		meetingboardComment.setMemberNo(memberNo);
		
		service.insertMeetingBoardComment(meetingboardComment);
		boardservice.updateMeetingBoardCommentCnt(meetingboardNo);
		logger.info("댓글추가 보드번호 : {}", meetingboardNo);
		logger.info("댓글추가 멤버 번호 : {}", meetingboardNo);
		logger.info("댓글추가 미팅번호 : {}", meetingNo);

		return "redirect:/meetingboard/view/" + meetingboardNo;
	}
	//댓글개수
	//@RequestMapping(value="meetingboard/list/commentcnt/{meetingboardNo}", method=RequestMethod.GET)
	//public String selectMeetingBoardComment(@PathVariable int meetingboardNo, HttpSession session, Model model){
		
		//model.addAttribute("comment", service.selectMeetingBoardCommentCnt(meetingboardNo));	
		//logger.info("어떻게 사용하지?:{}",service.selectMeetingBoardCommentCnt(meetingboardNo));
		//return "meetingboard/list";
//	}
	
	// 댓글 삭제 작성자용

	@RequestMapping(value = "meetingcomment/delete/{meetingboardCommentNo}", method = RequestMethod.POST)
	public String deleteMeetingBoardComment(@PathVariable int meetingboardCommentNo, HttpSession session) {
		session.setAttribute("meetingboardCommentNo", meetingboardCommentNo);
		int meetingboardNo = (Integer) session.getAttribute("meetingboardNo");
		int memberNo = (Integer) session.getAttribute("memberNo");
		meetingboardCommentNo = (Integer) session.getAttribute("meetingboardCommentNo");
		logger.info("댓글 삭제 번호  : {}", meetingboardCommentNo);
		logger.info("댓글추가 멤버 번호 : {}", meetingboardNo);
		logger.info("댓글추가 멤버 번호 : {}", memberNo);

		service.deleteMeetingboardComment(meetingboardCommentNo, memberNo);

		return "redirect:/meetingboard/view/" + meetingboardNo;

	}

}
