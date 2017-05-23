package com.jeju.meoui.controller;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.jeju.meoui.service.*;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService service;
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	//1 .자유게시판 추가하기(작성폼)
	@RequestMapping(value="/freeboard/join", method=RequestMethod.GET)
	public String insertFreeboardForm() {
		return "freeboard/insert.jsp";
	}
	//1-1.자유게시판 추가 성공d
	@RequestMapping(value="/freeboard/join", method=RequestMethod.POST)
	public String insertFreeboard(ModelAndView model) {
		return "redirect:/freeboard/list?pageNo=1";
	}
	//2. 자유게시판 수정하기(작성폼)
	@RequestMapping(value="/freeboard/update", method=RequestMethod.GET)
	public String updateFreeboardForm() {
		return "freeboard/updatejsp";
	}
	//2-1. 자유게시판 수정하기 수정 성공
	@RequestMapping(value="/freeboard/update", method=RequestMethod.POST)
	public String updateFreeboardSuccess(ModelAndView model) {
		return "redirect:/freeboard/list?pageNo=1";
	}
	//3. 자유게시판 삭제하기
	@RequestMapping(value="/freeboard/delete/{freeboardNo}", method=RequestMethod.DELETE)
	public String deleteFreeboard(int noticeNo) {
		return "redirect:/home";
	}
	//4. 자유게시판 페이지별 조회하기
	@RequestMapping(value="/freeboard/list", method=RequestMethod.GET)
	public String getAllFreeboard(ModelAndView model, int pageNo) {
		return "freeboard/list.jsp";
	}
	//5. 자유게시판 번호별 조회
	@RequestMapping(value="/freeboard/view/{freeboardNo}", method=RequestMethod.GET)
	public String selectByFreeboard(ModelAndView model, int noticeNo) {
		return "freeboard/view.jsp";
	}
}
