package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class ReserveDetailsDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	//	예약상세 추가하기
	public void insertReserveDetails(ReserveDetails details){
		template.insert("ReserveDetailsMapper.insertReserveDetails", details);
	}
	//	예약상세 삭제하기
	public void deleteReserveDetails(int reserveNo){
		template.delete("ReserveDetailsMapper.deleteReserveDetails", reserveNo);
	}
	//	객실종류번호별 예약상세 조회하기
	public List<ReserveDetailsDAO> selectAllByRoomNo(int roomNo){
		return template.selectList("ReserveDetailsMapper.selectAllByRoomNo", roomNo);
	}
	//	예약번호별 객실번호 조회하기
	public int selectByRoomNo(int reserveNo){
		return template.selectOne("ReserveDetailsMapper.selectByRoomNo", reserveNo);
	}
	//	예약번호별 펜션번호 조회하기
	public int selectByAccommodationNo(int reserveNo){
		return template.selectOne("ReserveDetailsMapper.selectByAccommodationNo", reserveNo);
	}

}
