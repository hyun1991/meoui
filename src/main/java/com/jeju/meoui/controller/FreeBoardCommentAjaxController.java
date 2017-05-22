package com.jeju.meoui.controller;

import java.io.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;

import com.google.gson.*;
import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@RestController
public class FreeBoardCommentAjaxController {
	@Autowired
	private FreeBoardCommentService commentService;
	@Autowired
	private FreeBoardService service;
	//1. 댓글 추가하기
	@RequestMapping(value="/freeboardComment/{freeboardNo}", method=RequestMethod.POST)
	public String insertFreeboardComment(@PathVariable int freeboardNo ,@ModelAttribute FreeBoardComment freeBoardComment) {
		commentService.createFreeboardComment(freeBoardComment);
		return new Gson().toJson(service.findByFreeboard(freeboardNo));
	}
	//2. 댓글 수정하기
	@RequestMapping(value="/freeboardComment/{freeboardNo}", method=RequestMethod.PATCH)
	public String updateFreeboardComment(@PathVariable int freeboardNo, @ModelAttribute FreeBoardComment freeBoardComment) {
		commentService.modifyFreeboardComment(freeBoardComment);
		return new Gson().toJson(service.findByFreeboard(freeboardNo));
	}
	//3. 댓글 삭제하기
	@RequestMapping(value="/freeboardComment/{freeboardNo}", method=RequestMethod.DELETE)
	public String deleteFreeboardComment(HttpSession session, @PathVariable int freeboardCommentNo, @RequestHeader(value="freeboardNo")int freeboardNo) {
		commentService.removeFreeboardComment(freeboardCommentNo, freeboardNo);
		return new Gson().toJson(service.findByFreeboard(freeboardNo));
	}
}