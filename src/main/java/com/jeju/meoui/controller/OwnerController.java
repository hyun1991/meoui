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
public class OwnerController {
	//	펜션업주 로그인시에 업주번호, 업주아이디 session값에 저장완료 됩니다.
	//	단, 로그아웃 할시에는 둘다 사라집니다.
	@Autowired
	private OwnerService service;
	private static final Logger logger= LoggerFactory.getLogger(OwnerController.class);
	//	펜션업주 추가하기(미완료)
	@RequestMapping(value="/owner/join", method=RequestMethod.GET)
	public String insertForm(){
		return "가입폼";
	}
	//	펜션업주 추가완료(미완료)
	@RequestMapping(value="/owner/join", method=RequestMethod.POST)
	public String insertEnd(@ModelAttribute Owner owner){
		service.createOwner(owner);
		return "펜션업주 로그인 페이지";
	}
	//	펜션업주 로긴(미완료)
	@RequestMapping(value="/owner/login", method=RequestMethod.POST)
	public ResponseEntity<String>ajaxLogin(String ownerId, String ownerPassword, HttpSession session){
		int result= service.ownerLogin(ownerId, ownerPassword, session);
		if(result==1){
			session.setAttribute("ownerId", ownerId);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		else 
			return new ResponseEntity<String>("fail", HttpStatus.OK);
	}
	//	업주 로그아웃(미완료)
	@RequestMapping(value="/owner/logout", method=RequestMethod.GET)
	public String ownerLogout(HttpSession session){
		session.removeAttribute("ownerNo");
		session.removeAttribute("ownerId");
		return "펜션업주 로그인페이지";
	}
	//	업주 추방(미완료)
	@RequestMapping(value="/owner/delete", method=RequestMethod.POST)
	public ResponseEntity<String> deleteOwner(HttpSession session){
		String ownerId= (String)session.getAttribute("ownerId");
		session.removeAttribute("ownerId");
		session.removeAttribute("ownerNo");
		service.removeOwner(ownerId);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	} 
	//	업주 상세뷰
	@RequestMapping(value="/owner/view/{ownerId}", method=RequestMethod.GET)
	public String viewOwner(@PathVariable String ownerId, Model model){
		model.addAttribute("result", service.getByOwner(ownerId));
		return "상세조회 뷰페이지";
	}
	//	업주리스트조회
	@RequestMapping(value="/owner/list", method=RequestMethod.GET)
	public String ownerList(Model model){
		model.addAttribute("result", service.getAllOwner());
		return "리스트 뷰페이지";
	}
}
