package com.jeju.meoui.service;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class UsersService {
	@Autowired
	private UsersDAO dao;
	
	//	관리자 추가하기
	public void createUsers(Users users){
		dao.insertUsers(users);
	}
	//	관리자 로그인
	public int login(String username, String password, HttpSession session){
		Users users= dao.selectUsers(username);
		int usersNo= users.getUsersNo();
		session.setAttribute("usersNo", usersNo);
		return dao.login(username, password);
	}
	//	관리자 비밀번호 갱신하기
	public void modifyUsers(Users users){
		dao.updateUsers(users);
	}
	//	관리자 정보삭제
	public void removeUsers(String username){
		dao.deleteUsers(username);
	}
	//	관리자 아이디별 정보조회
	public Users selectUsers(String username){
		return dao.selectUsers(username);
	}

}
