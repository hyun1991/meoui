package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class TravlescheduleDAO {
	@Autowired
	private SqlSessionTemplate template;
	//	일정추가하기
	public void insertTravle(Travleschedule travleschedule){
		template.insert("TravlescheduleMapper.insertTravle", travleschedule);
	}
	//	일정수정하기
	public void updateTravle(Travleschedule travleschedule){
		template.update("TravlescheduleMapper.updateTravle", travleschedule);
	}
	//	일정번호별 고객번호 조회하기
	public int selectByMemberNo(int travlescheduleNo){
		return template.selectOne("TravlescheduleMapper.selectByMemberNo", travlescheduleNo);
	}
	//	일정삭제하기
	public void deleteTravle(int travlescheduleNo, int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("travlescheduleNo", travlescheduleNo);
		map.put("memberNo", memberNo);
		template.selectOne("TravlescheduleMapper.deleteTravle", map);
	}
	//	일정번호 및 고객번호별 일정정보 조회하기
	public Travleschedule findByTravle(int travlescheduleNo, int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("travlescheduleNo", travlescheduleNo);
		map.put("memberNo", memberNo);
		return template.selectOne("TravlescheduleMapper.findByTravle", map);
	}
	//	고객번호별 일정전체리스트 조회하기
	public List<Travleschedule> findAllMemberNo(int memberNo){
		return template.selectList("TravlescheduleMapper.findAllMemberNo", memberNo);
	}
	//	최근입력된 일정번호 조회하기
	public int getByTravleNo(){
		return template.selectOne("TravlescheduleMapper.getByTravleNo");
	}
	//	페이지별 회원번호별 일정리스트 조회하기
	public List<Schedule>getBySchedule(int memberNo, int startRow, int lastRow){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("startRow", startRow);
		map.put("lastRow", lastRow);
		return template.selectList("TravlescheduleMapper.getBySchedule", map);
	}
	//	사용자번호별 일정개수 조회
	public int getByMax(int memberNo){
		return template.selectOne("TravlescheduleMapper.getByMax", memberNo);
	}
}
