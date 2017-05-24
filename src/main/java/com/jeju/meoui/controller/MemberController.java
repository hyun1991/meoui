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
	//	회원 로그인시에 회원번호, 회원아이디 session값에 저장완료 됩니다.
	//	단, 로그아웃 할시에는 둘다 사라집니다.
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
	//	2-1. 회원수정 폼뷰()
	@RequestMapping(value="/member/update/{memberId}", method=RequestMethod.GET)
	public String updateMember(@PathVariable String memberId, Model model){
		model.addAttribute("result", service.getByMember(memberId));
		return "member/update";
	}
	//	2-2. 회원수정 완료()
	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String updateMember(@ModelAttribute Member member, @RequestParam String memberAddress1, @RequestParam String memberAddress2, HttpSession session){
		logger.info("회원수정 vo:{}", member);
		String memberAddress= memberAddress1+memberAddress2;
		member.setMemberAddress(memberAddress);
		service.modifyMember(member);
		return "redirect:/member/view/"+member.getMemberId();
	}
	//	3. 회원탈퇴(완료)
	@RequestMapping(value="/member/delete", method=RequestMethod.POST)
	public ResponseEntity<String> deleteMember(HttpSession session){
		String memberId= (String)session.getAttribute("memberId");
		session.removeAttribute("memberId");
		session.removeAttribute("memberNo");
		service.removeMember(memberId);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	//	5. 회원별 정보조회하기(완료)
	@RequestMapping(value="/member/view/{memberId}", method=RequestMethod.GET)
	public String viewMember(@PathVariable String memberId, Model model){
		model.addAttribute("result", service.getByMember(memberId));
		return "mypage";
	}
	//	6. 회원 로그인처리(완료)
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public ResponseEntity<String> memberLogin(@RequestParam String memberId, @RequestParam String memberPassword, HttpSession session){
		logger.info("일반회원:{}", memberId, memberPassword);
		int result= service.memberLogin(memberId, memberPassword, session);
		logger.info("결과값:{}", result);
		if(result==1){
			session.setAttribute("memberId",memberId);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		else 
			return new ResponseEntity<String>("fail", HttpStatus.OK);
	}
	//	7. 회원 로그아웃(완료)
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public String memberLogout(HttpSession session){
		session.invalidate();
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
	//	9. 관리자에게 제공되는 회원 전체리스트
	@RequestMapping(value="/admin/member/list", method=RequestMethod.GET)
	public String selectAllMember(Model model, @RequestParam(defaultValue="1") int pageNo){
		model.addAttribute("result", service.selectAllMember(pageNo));
		return "member/memberlist";
	}
	//	10. 관리자에게 제공되는 회원 추방권한
	@RequestMapping(value="/admin/member/delete/{memberId}", method=RequestMethod.GET)
	public String deleteMember(@PathVariable String memberId){
		service.removeMember(memberId);
		return "redirect:/admin/member/list?pageNo=1";
	}
}
