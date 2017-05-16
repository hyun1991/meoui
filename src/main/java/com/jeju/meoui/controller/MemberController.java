package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	private static final Logger logger= LoggerFactory.getLogger(MemberController.class);
	
	//	1. 회원가입(완료)
	@RequestMapping(value="/member/join", method=RequestMethod.POST)
	public String joinMember(@ModelAttribute Member member, @RequestParam String memberAddress1, @RequestParam String memberAddress2){
		logger.info("회원가입 vo:{}", member);
		String memberAddress= memberAddress1+memberAddress2;
		member.setMemberAddress(memberAddress);
		service.createMember(member);
		return "redirect:/";
	}
	//	2-1. 회원수정 폼뷰(미구현)
	@RequestMapping(value="/member/update", method=RequestMethod.GET)
	public String updateMember(){
		return "member/update";
	}
	//	2-2. 회원수정 완료(미구현)
	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String updateMember(@ModelAttribute Member member, HttpSession session){
		logger.info("회원수정 vo:{}", member);
		service.modifyMember(member);
		return "redirect:/logout";
	}
	//	3. 회원탈퇴(완료)
	@RequestMapping(value="/member/delete", method=RequestMethod.POST)
	public ResponseEntity<String> deleteMember(HttpSession session){
		String memberId= (String)session.getAttribute("memberId");
		session.removeAttribute("memberId");
		service.removeMember(memberId);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	//	5. 회원별 정보조회하기(미구현)
	@RequestMapping(value="/member/view/{memberId}", method=RequestMethod.GET)
	public String viewMember(@PathVariable String memberId, Model model){
		model.addAttribute("result", service.getByMember(memberId));
		return "결과폼 필요합니다.";
	}
	//	6. 회원 로그인처리(완료)
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String memberLogin(@RequestParam String memberId, @RequestParam String memberPassword, HttpSession session){
		int result= service.memberLogin(memberId, memberPassword);
		//	세션값 저장한다. 
		if(result==1){
			session.setAttribute("memberId", memberId);
			logger.info("로그인 아이디:{}", session.getAttribute("memberId"));
			return "redirect:/";
		}
		else
			return "redirect:/";
	}
	//	7. 회원 로그아웃(완료)
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String memberLogout(HttpSession session){
		session.removeAttribute("memberId");
		return "redirect:/";
	}
	//	8. 아이디 중복체크(완료)
	@RequestMapping(value="/member/check", method=RequestMethod.POST)
	public ResponseEntity<String> checkId(@RequestParam String memberId){
		logger.info("중복체크 아이디값:{}", memberId);
		int result= service.checkId(memberId);
		if(result==0)
			return new ResponseEntity<String>("success", HttpStatus.OK);
		else 
			return new ResponseEntity<String>("fail", HttpStatus.OK);
	}
}
