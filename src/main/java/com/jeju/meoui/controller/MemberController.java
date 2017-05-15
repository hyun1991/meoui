package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	private static final Logger logger= LoggerFactory.getLogger(MemberController.class);
	
	//	1. 회원가입
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String joinMember(@ModelAttribute Member member){
		logger.info("회원가입 vo:{}", member);
		service.createMember(member);
		return "redirect:/";
	}
	//	2-1. 회원수정 폼뷰
	@RequestMapping(value="/member/update", method=RequestMethod.GET)
	public String updateMember(){
		return "member/update";
	}
	//	2-2. 회원수정 완료.
	public String updateMember(@ModelAttribute Member member, HttpSession session){
		logger.info("회원수정 vo:{}", member);
		service.modifyMember(member);
		return "";
	}
}
