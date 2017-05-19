package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class AccommodationCommentDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	//	댓글 추가하기
	public void insertAccommodationComment(AccommodationComment accommodationComment){
		template.insert("AccommodationCommentMapper.insertAccommodationComment", accommodationComment);
	}
	//	댓글 수정하기
	public void updateAccommodationComment(AccommodationComment accommodationComment){
		template.update("AccommodationCommentMapper.updateAccommodationComment", accommodationComment);
	}
	//	댓글 삭제하기
	public void deleteAccommodationComment(int accommodationCommentNo, int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("accommodationCommentNo", accommodationCommentNo);
		map.put("memberNo", memberNo);
		template.delete("AccommodationCommentMapper.deleteAccommodationComment", map);
	}
	//	댓글 오너가 삭제하기
	public void deleteOwnerAccommodationComment(int accommodationCommentNo){
		template.delete("AccommodationCommentMapper.deleteOwnerAccommodationComment", accommodationCommentNo);
	}
	//	숙박시설 번호별 댓글 전체삭제하기
	public void deleteAllAccommodationComment(int accommodationNo){
		template.delete("AccommodationCommentMapper.deleteAllAccommodationComment", accommodationNo);
	}
	//	숙박시설번호별 댓글 전체조회하기
	public List<AccommodationComment> selectByAccommodationNo(int accommodationNo){
		return template.selectList("AccommodationCommentMapper.selectByAccommodationNo", accommodationNo);
	}
	//	숙박시설번호별 회원번호별 댓글 전체조회하기
	public List<AccommodationComment> selectByMemberNoAccommodationNo(int accommodationNo, int memberNo){
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("accommodationNo", accommodationNo);
		map.put("memberNo", memberNo);
		return template.selectList("AccommodationCommentMapper.selectByMemberNoAccommodationNo", map);
	}
	//	댓글번호별 회원번호 조회하기
	public int selectByMemberNo(int accommodationCommentNo){
		return template.selectOne("AccommodationCommentMapper.selectByMemberNo", accommodationCommentNo);
	}
	
}
