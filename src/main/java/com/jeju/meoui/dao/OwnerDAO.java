package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class OwnerDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	//	펜셥업주 추가하기
	public void insertOwner(Owner owner){
		template.insert("OwnerMapper.insertOwner", owner);
	}
	//	펜션업주 추방하기
	public void deleteOwner(String ownerId){
		template.delete("OwnerMapper.deleteOwner", ownerId);
	}
	//	펜션업주 정보조회하기
	public Owner selectByOwner(String ownerId){
		return template.selectOne("OwnerMapper.selectByOwner", ownerId);
	}
	//	펜션업주 업주번호 조회하기
	public int selectByOwnerNo(String ownerId){
		return template.selectOne("OwnerMapper.selectByOwnerNo", ownerId);
	}
	//	업주 로긴.
	public int ownerLogin(String ownerId, String ownerPassword){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("ownerId", ownerId);
		map.put("ownerPassword", ownerPassword);
		return template.selectOne("OwnerMapper.ownerLogin", map);
	}
	//	업주리스트 조회하기
	public List<Owner> selectAllOwner(){
		return template.selectList("OwnerMapper.selectAllOwner");
	}
}
