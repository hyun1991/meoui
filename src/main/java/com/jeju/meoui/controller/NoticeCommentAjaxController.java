package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;

import com.google.gson.*;
import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@RestController
public class NoticeCommentAjaxController {
	@Autowired
	private NoticeCommentService cservice;
	@Autowired
	private NoticeService service;
	@RequestMapping(value="/noticecomment/{noticeNo}", method=RequestMethod.POST)
	public String insertNoticeComment(@PathVariable int noticeNo, @ModelAttribute NoticeComment noticeComment, HttpSession session){
		int memberNo= (Integer)session.getAttribute("memberNo");
		noticeComment.setMemberNo(memberNo);
		cservice.createNoticeComment(noticeComment);
		return new Gson().toJson(service.findByNotice(noticeNo));
	}
	@RequestMapping(value="/noticecomment/{noticeNo}", method=RequestMethod.PATCH)
	public String updateNoticeComment(@PathVariable int noticeNo, @ModelAttribute NoticeComment noticeComment, HttpSession session){
		int memberNo= (Integer)session.getAttribute("memberNo");
		noticeComment.setMemberNo(memberNo);
     	cservice.modifyNoticeComment(noticeComment);
		return new Gson().toJson(service.findByNotice(noticeNo));
	}

	@RequestMapping(value="/noticecomment/{noticeCommentNo}", method=RequestMethod.DELETE)
	public String deleteNoticeComment(@PathVariable int noticeCommentNo,@RequestParam(value="noticeNo") int noticeNo, HttpSession session){
		cservice.removeNoticeComment(noticeCommentNo);
		return new Gson().toJson(service.findByNotice(noticeNo));
	}

}
