package com.jeju.meoui.controller;

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
	@RequestMapping(value="meoui/noticecomment/{noticeNo}", method=RequestMethod.POST)
	public String insertNoticeComment(@PathVariable int noticeNo, @ModelAttribute NoticeComment noticeComment){
		cservice.createNoticeComment(noticeComment);
		return new Gson().toJson(service.findByNotice(noticeNo));
	}
	@RequestMapping(value="meoui/noticecomment/{noticeNo}", method=RequestMethod.PATCH)
	public String updateNoticeComment(@PathVariable int noticeNo, @ModelAttribute NoticeComment noticeComment){
		cservice.modifyNoticeComment(noticeComment);
		return new Gson().toJson(service.findByNotice(noticeNo));
	}
	@RequestMapping(value="meoui/noticecomment/{noticeNo}", method=RequestMethod.DELETE)
	public String deleteNoticeComment(@PathVariable int noticeCommentNo, @RequestHeader(value="noticeNo")int noticeNo){
		cservice.removeNoticeComment(noticeCommentNo, noticeNo);
		return new Gson().toJson(service.findByNotice(noticeNo));
	}

}
