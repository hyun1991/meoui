package com.jeju.meoui.controller;

import java.io.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class UsersController {
	@Autowired
	private UsersService service;
	//	로그인 폼
	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public String loginForm(){
		return "admin/loginForm";
	}
	//	로그인 완료
	@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	public ResponseEntity<String> login(@RequestParam String username, @RequestParam String password, HttpSession session, HttpServletResponse res) throws IOException{
		int result= service.login(username, password, session);
		if(result>0){
			String go2= (String)session.getAttribute("go2");
			session.removeAttribute("go2");
			if(go2==null)
				go2="/meoui/admin/login";		
			session.setAttribute("username", username);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		else 
			return new ResponseEntity<String>("fail", HttpStatus.OK);
	}
	//	관리자 추가하기(완료)
	@RequestMapping(value="/admin/join", method=RequestMethod.GET)
	public String insertForm(){
		return "/admin/join";
	}
	//	관리자 추가완료(완료)
	@RequestMapping(value="/admin/join", method=RequestMethod.POST)
	public String insertEnd(@ModelAttribute Users users){
		service.createUsers(users);
		return "redirect:/admin/home";
	}
	//	업주 로그아웃(완료)
	@RequestMapping(value="/admin/logout", method=RequestMethod.GET)
	public String ownerLogout(HttpSession session){
		session.removeAttribute("username");
		session.removeAttribute("usersNo");
		return "redirect:/admin/login";
	}
	
	
	/*
	
	//	관리자 비밀번호 갱신하기
	public void updateUsers(Users users){
		template.update("usersMapper.updateUsers", users);
	}
	//	관리자 정보삭제
	public void deleteUsers(String username){
		template.delete("usersMapper.deleteUsers", username);
	}
	//	관리자 아이디별 정보조회
	public Users selectUsers(String username){
		return template.selectOne("usersMapper.selectUsers", username);
	}

	 * */
}
