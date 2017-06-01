package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class AccommodationDAO {
	@Autowired
	private SqlSessionTemplate template;
	//	숙박시설 추가하기
	public void insertAccommodation(Accommodation accommodation){
		template.insert("AccommodationMapper.insertAccommodation", accommodation);
	}
	//	숙박시설 수정하기
	public void updateAccommodation(Accommodation accommodation){
		template.update("AccommodationMapper.updateAccommodation", accommodation);
	}
	//	숙박시설 삭제하기
	public void deleteAccommodation(int accommodationNo){
		template.delete("AccommodationMapper.deleteAccommodation", accommodationNo);
	}
	//	시설명별 시설번호 조회하기
	public int selectByAccommodationNo(String accommodationName){
		return template.selectOne("AccommodationMapper.selectByAccommodationNo", accommodationName);
	}
	//	시설번호별 관광명소번호 조회하기
	public int selectBySiteNo(int accommodationNo){
		return template.selectOne("AccommodationMapper.selectBySiteNo", accommodationNo);
	}
	//	시설번호별 업주번호 조회하기
	public int selectByOwnerNo(int accommodationNo){
		return template.selectOne("AccommodationMapper.selectByOwnerNo", accommodationNo);
	}
	//	숙박시설 페이지별 조회하기
	public List<Accommodation> selectAllAccommodation(int startRow, int lastRow){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("lastRow", lastRow);
		return template.selectList("AccommodationMapper.selectAllAccommodation", map);
	}
	//	숙박시설 번호별 조회하기
	public Accommodation findByAccommodation(int accommodationNo){
		return template.selectOne("AccommodationMapper.findByAccommodation", accommodationNo);
	}
	//	숙박시설 번호별 여러번 조회하기
	public List<Accommodation> findAllAccommodation(int accommodationNo){
		return template.selectList("AccommodationMapper.findAllAccommodation", accommodationNo);
	}
	//	기본키 MAX값 조회하기
	public int findByAccommodationMax(){
		return template.selectOne("AccommodationMapper.findByAccommodationMax");
	}
	//	숙박명별 조회하기
	public Accommodation selectByAccommodation(String accommodationName){
		return template.selectOne("AccommodationMapper.selectByAccommodation", accommodationName);
	}
	//	숙박시설 오너별 페이지별 조회하기
	public List<Accommodation> selectByOwnerNoAccommodation(int startRow, int lastRow, int ownerNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("lastRow", lastRow);
		map.put("ownerNo", ownerNo);
		return template.selectList("AccommodationMapper.selectByOwnerNoAccommodation", map);
	}
	//	숙박시설 저장된 DB개수 조회하기
	public int selectByMax(){
		return template.selectOne("AccommodationMapper.selectByMax");
	}
	//	최근 업로드된 숙박업소노출
	public List<Accommodation> newAcoomoodation(){
		return template.selectList("AccommodationMapper.newAcoomoodation");
	}
	//	관광명소번호별 펜션정보 조회하기
	public List<Accommodation>findBySiteNo(int siteNo){
		return template.selectList("AccommodationMapper.findBySiteNo", siteNo);
	}
}
