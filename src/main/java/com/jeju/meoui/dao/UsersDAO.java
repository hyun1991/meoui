package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class UsersDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	//	관리자 추가하기
	public void insertUsers(Users users){
		template.insert("usersMapper.insertUsers", users);
	}
	//	관리자 로그인처리
	public int login(String username, String password){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("username", username);
		map.put("password", password);
		return template.selectOne("usersMapper.login", map);
	}
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

}
