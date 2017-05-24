package com.jeju.meoui.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;
@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	//1. 공지게시판 추가하기(작성폼)
	@RequestMapping(value="/notice/join", method=RequestMethod.GET)
	public String insertNoticeForm(){
		return "notice/insert";
	}
	//1. 공지게시판 추가하기(추가 성공)
	@RequestMapping(value="/notice/join", method=RequestMethod.POST)
	public String insertNotice(@ModelAttribute Notice notice){
		service.createNotice(notice);
		return "redirect:/notice/list?pageNo=1";
	}
	//2. 공지게시판 갱신하기(작성폼)
	@RequestMapping(value="/notice/update", method=RequestMethod.GET)
	public String updateNoticeForm(@RequestParam int noticeNo,Model model){
		model.addAttribute(service.findByNotice(noticeNo));
		return "notice/update";
	}
	//2. 공지게시판 갱신하기(갱신 성공)
	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
	public String updateNotice(Notice notice){
		service.modifyNotice(notice);
		return "redirect:/notice/list?pageNo=1";
	}
	//3. 공지게시판 삭제
	@RequestMapping(value="/notice/delete/{noticeNo}", method=RequestMethod.DELETE)
	public String deleteNotice(@PathVariable int noticeNo){
		service.removeNotice(noticeNo);
		return "redirect:/home";
	}
	//4. 공지사항 페이지별 조회하기
	@RequestMapping(value="/notice/list", method=RequestMethod.GET)
	public String getAllNotice(@RequestParam(defaultValue="1") int pageNo,Model model){
		model.addAttribute("result",service.getByNotice(pageNo));
		return "/notice/list";
	}
	//5. 공지게시판 상세보기
	@RequestMapping(value="/notice/view/{noticeNo}", method=RequestMethod.GET)
	public String selectByNoticeNo(@PathVariable int noticeNo, Model model){
	     model.addAttribute("notice", service.findByNotice(noticeNo));
	     return "/notice/view";
	}
	
	
}
