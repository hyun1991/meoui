package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@RestController
public class FreeBoardCommentController {
	@Autowired
	private FreeBoardCommentService commentService;
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardCommentController.class);
	//1. 댓글 추가하기(미완료)
	@RequestMapping(value="/freeboardComment/{freeboardNo}", method=RequestMethod.POST)
	public String insertFreeboardComment(@PathVariable int freeboardNo, @ModelAttribute FreeBoardComment freeBoardComment) {
		return null;
		//return commentService.createFreeboardComment(freeBoardComment);
	}
	//2. 댓글 수정하기(미완료)
	@RequestMapping(value="/freeboardComment/{freeboardNo}", method=RequestMethod.PATCH)
	public String updateFreeboardComment(@PathVariable int freeboardNo, @ModelAttribute FreeBoardComment freeBoardComment) {
		return null;
		//return commentService.modifyFreeboardComment(freeBoardComment);
	}
	//3. 댓글 삭제하기(미완료)
	@RequestMapping(value="/freeboardComment/{freeboardNo}", method=RequestMethod.DELETE)
	public String deleteFreeboardComment(HttpSession session, @PathVariable int freeboardNo, @RequestParam int memberNo) {
		return null;
	//	return commentService.removeFreeboardComment(freeboardNo, memberNo);
	}
}