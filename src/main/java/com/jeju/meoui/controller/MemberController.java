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
	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String updateMember(@ModelAttribute Member member, HttpSession session){
		logger.info("회원수정 vo:{}", member);
		service.modifyMember(member);
		return "redirect:/";
	}
	//	3. 회원탈퇴
	@RequestMapping(value="/member/delete", method=RequestMethod.POST)
	public String deleteMember(HttpSession session){
		String memberId= (String)session.getAttribute("memberId");
		service.removeMember(memberId);
		return "redirect:/";
	}
	//	4-1. 회원 비밀번호 찾기 폼뷰
	@RequestMapping(value="/member/pwsearch", method=RequestMethod.GET)
	public String selectByMemberPassword(){
		return "/member/pwsearch";
	}
	//	4-2. 회원 비밀번호 찾기 완료.
	@RequestMapping(value="/member/pwsearch", method=RequestMethod.POST)
	public String selectByMemberPassword(String memberName, String memberMail, String memberId, Model model){
		model.addAttribute("result", service.searchByMemberPassword(memberName, memberId, memberMail));
		return "결과폼 필요합니다.";
	}
	//	5. 회원별 정보조회하기
	@RequestMapping(value="/member/view/{memberId}", method=RequestMethod.GET)
	public String viewMember(@PathVariable String memberId, Model model){
		model.addAttribute("result", service.getByMember(memberId));
		return "결과폼 필요합니다.";
	}
	//	6. 회원 로그인처리
	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public String memberLogin(@RequestParam String memberId, @RequestParam String memberPassword, HttpSession session){
		int result= service.memberLogin(memberId, memberPassword);
		//	세션값 저장한다. 
		if(result==1)
			session.setAttribute("memberId", memberId);
		return "redirect:/";
	}
	//	7. 회원 로그아웃
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String memberLogout(HttpSession session){
		session.removeAttribute("memberId");
		return "redirect:/";
	}
	//	8. 아이디 중복체크
	@RequestMapping(value="/member/check", method=RequestMethod.POST)
	public ResponseEntity<String> checkId(@RequestParam String memberId){
		int result= service.checkId(memberId);
		if(result==0)
			return new ResponseEntity<String>("suuccess", HttpStatus.OK);
		else
			return new ResponseEntity<String>("fail", HttpStatus.OK);
	}
	//	9-1. 회원 비밀번호 찾기 폼뷰
	@RequestMapping(value="/member/idsearch", method=RequestMethod.GET)
	public String selectByMemberId(){
		return "/member/pwsearch";
	}
	//	9-2. 회원 비밀번호 찾기 완료.
	@RequestMapping(value="/member/idsearch", method=RequestMethod.POST)
	public String selectByMemberId(String memberName, String memberMail, Model model){
		model.addAttribute("result", service.searchByMemberId(memberName, memberMail));
		return "결과폼 필요합니다.";
	}
	
}
