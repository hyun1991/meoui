package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.google.gson.*;
import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class FreeBoardCommentController {
	@Autowired
	private FreeBoardCommentService commentService;
	@Autowired
	private FreeBoardService service;
	//1. 댓글 추가하기
	@RequestMapping(value="/freeboardComment/insert", method=RequestMethod.POST)
	public String insertFreeboardComment(@ModelAttribute FreeBoardComment freeBoardComment, HttpSession session) {
		int freeboardNo = (Integer)session.getAttribute("freeboardNo");
		int memberNo = (Integer)session.getAttribute("memberNo");
		freeBoardComment.setFreeboardNo(freeboardNo);
		freeBoardComment.setMemberNo(memberNo);
		commentService.createFreeboardComment(freeBoardComment);
		return"redirect:/freeboard/view/"+freeboardNo;
	}
	/*
	//2. 댓글 수정하기
	@RequestMapping(value="/freeboardComment/{freeboardNo}", method=RequestMethod.PATCH)
	public String updateFreeboardComment(@PathVariable int freeboardNo, @ModelAttribute FreeBoardComment freeBoardComment) {
		commentService.modifyFreeboardComment(freeBoardComment);
		return new Gson().toJson(service.findByFreeboard(freeboardNo));
	}
	*/
	//3. 댓글 삭제하기
	@RequestMapping(value="/freeboardComment/delete/{freeboardCommentNo}", method=RequestMethod.GET)
	public String deleteFreeboardComment(HttpSession session, @PathVariable int freeboardCommentNo) {
		int freeboardNo = (Integer)session.getAttribute("freeboardNo");
		int memberNo = (Integer)session.getAttribute("memberNo");
		commentService.removeFreeboardComment(freeboardCommentNo, memberNo);
		return "redirect:/freeboard/view/"+freeboardNo;
	}
}