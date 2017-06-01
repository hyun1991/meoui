package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class ReserveDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	//	예약추가하기
	public void insertReserve(Reserve reserve){
		template.insert("ReserveMapper.insertReserve", reserve);
	}
	//	예약수정하기
	public void updateReserve(Reserve reserve){
		template.update("ReserveMapper.updateReserve", reserve);
	}
	//	예약취소하기
	public void deleteReserve(int reserveNo, int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("reserveNo", reserveNo);
		map.put("memberNo", memberNo);
		template.delete("ReserveMapper.deleteReserve", map);
	}
	//	업주번호별 예약리스트 조회하기
	public List<Reserve>selectAllByOwnerNo(int ownerNo){
		return template.selectList("ReserveMapper.selectAllByOwnerNo", ownerNo);
	}
	//	회원번호별 예약리스트 조회하기
	public List<Reserve>selectAllByMemberNo(int memberNo){
		return template.selectList("ReserveMapper.selectAllByMemberNo", memberNo);
	}
	//	예약번호별 업주번호 조회하기
	public int electByOwner(int reserveNo){
		return template.selectOne("ReserveMapper.electByOwner", reserveNo);
	}
	//	회원번호별 에약번호 조회하기
	public int selectByReserveNo(int memberNo){
		return template.selectOne("ReserveMapper.selectByReserveNo", memberNo);
	}
	//	최근 추가된 예약리스트 예약번호 조회하기(MAX값)
	public int selectByMaxReserveNo(){
		return template.selectOne("ReserveMapper.selectByMaxReserveNo");
	}
	//	예약리스트 전체조회하기
	public List<Reserve>getByAllReserve(){
		return template.selectList("ReserveMapper.getByAllReserve");
	}
}
