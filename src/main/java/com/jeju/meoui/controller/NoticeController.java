package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.slf4j.*;
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
	@Autowired
	private NoticeCommentService cservice;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	//1. 공지게시판 추가하기(작성폼)
	@RequestMapping(value="/admin/notice/join", method=RequestMethod.GET)
	public String insertNoticeForm(){
		return "admin/boardWrite";
	}
	//1. 공지게시판 추가하기(추가 성공)
	@RequestMapping(value="/admin/notice/join", method=RequestMethod.POST)
	public String insertNotice(@ModelAttribute Notice notice,  HttpSession session){
		int usersNo = (Integer)session.getAttribute("usersNo");
		notice.setUsersNo(usersNo);
		service.createNotice(notice);
		return "redirect:/admin/notice/list?pageNo=1";
	}
	//2. 공지게시판 갱신하기(작성폼)
	@RequestMapping(value="/admin/notice/update", method=RequestMethod.GET)
	public String updateNoticeForm(){
		return "notice/update";
	}
	//2. 공지게시판 갱신하기(갱신 성공)
	@RequestMapping(value="/admin/notice/update", method=RequestMethod.POST)
	public String updateNotice(@ModelAttribute Notice notice , HttpSession session){
		int noticeNo = (Integer)session.getAttribute("noticeNo");
		notice.setNoticeNo(noticeNo);
		service.modifyNotice(notice);
		return "redirect:/admin/notice/list?pageNo=1";
	}
	//3. 공지게시판 삭제
	@RequestMapping(value="/admin/notice/delete/{noticeNo}", method=RequestMethod.GET)
	public String deleteNotice(@PathVariable int noticeNo){
		service.removeNotice(noticeNo);
		return "redirect:/admin/notice/list?pageNo=1";
	}
	//4. 공지사항 페이지별 조회하기
	@RequestMapping(value="/notice/list", method=RequestMethod.GET)
	public String getAllNotice(@RequestParam(defaultValue="1") int pageNo,Model model){
		model.addAttribute("result",service.getByNotice(pageNo));
		return "/notice/list";
	}
	//5. 공지사항 페이지별 조회하기(관리자용)
	@RequestMapping(value="/admin/notice/list", method=RequestMethod.GET)
	public String getAllAdminNotice(@RequestParam(defaultValue="1") int pageNo,Model model){
		model.addAttribute("result",service.getByNotice(pageNo));
		return "/admin/nolist";
	}
	//6. 공지게시판 상세보기
	@RequestMapping(value="/notice/view/{noticeNo}", method=RequestMethod.GET)
	public String selectByNoticeNo(@PathVariable int noticeNo, Model model, HttpSession session){
		session.setAttribute("noticeNo", noticeNo);
	     model.addAttribute("notice", service.findByNotice(noticeNo));
	     return "/notice/view";
	}
	//6. 공지게시판 상세보기(관리자용)
	@RequestMapping(value="/admin/noview/{noticeNo}", method=RequestMethod.GET)
	public String selectByAdminNoticeNo(@PathVariable int noticeNo, Model model, HttpSession session){
		 session.setAttribute("noticeNo", noticeNo);
	     model.addAttribute("notice", service.findByNotice(noticeNo));
	     return "/admin/noticeDetail";
	}
	@RequestMapping(value="/noticecomment/delete/{noticeCommentNo}", method=RequestMethod.GET)
	public String deleteNoticeComment(@PathVariable int noticeCommentNo, HttpSession session){
		int memberNo= (Integer)session.getAttribute("memberNo");
		int noticeNo= (Integer)session.getAttribute("noticeNo");
		cservice.removeNoticeComment(noticeCommentNo,memberNo);
		return "redirect:/notice/view/"+noticeNo;
	}

}
