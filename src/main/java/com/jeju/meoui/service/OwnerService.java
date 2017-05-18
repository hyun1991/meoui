package com.jeju.meoui.service;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class OwnerService {
	@Autowired
	private OwnerDAO dao;
	
	//	펜션업주 추가하기
	public void createOwner(Owner owner){
		dao.insertOwner(owner);
	}
	//	펜션업주 추방하기
	public void removeOwner(String ownerId){
		dao.deleteOwner(ownerId);
	}
	//	펜션업주 정보조회하기
	public Owner getByOwner(String ownerId){
		return dao.selectByOwner(ownerId);
	}
	//	펜션업주로긴
	public int ownerLogin(String ownerId, String ownerPassword, HttpSession session){
		int ownerNo= dao.selectByOwnerNo(ownerId);
		session.setAttribute("ownerNo", ownerNo);
		return dao.ownerLogin(ownerId, ownerPassword);
	}
	//	업주리스트 전체조회하기
	public List<Owner> getAllOwner(){
		List<Owner>list= dao.selectAllOwner();
		return list;
	}
}
