package com.jeju.meoui.dao.test;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("context.xml")
public class AccommodationCommentDAOTest {
	@Autowired
	private AccommodationCommentDAO dao;
	/*
	 * 40번
멤버번호 62
	 * */
	//	댓글 추가하기
	@Test
	public void insertTest(){
		AccommodationComment ac= new AccommodationComment();
		String content= "테스트입니다.";
		int avg= 1;
		int member= 62;
		int accommodaion= 40;
		ac.setAccommodationCommentContent(content);
		ac.setAccommodationCommentAvg(avg);
		ac.setMemberNo(member);
		ac.setAccommodationNo(accommodaion);
		dao.insertAccommodationComment(ac);

	}
	/*
 * //	댓글 추가하기
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
	//	숙박시설 번호별 댓글 전체삭제하기
	public void deleteAllAccommodationComment(int accommodationNo){
		template.delete("AccommodationCommentMapper.deleteAllAccommodationComment", accommodationNo);
	}
	//	숙박시설번호별 댓글 전체조회하기
	public List<AccommodationComment> selectByAccommodationNo(int accommodationNo){
		return template.selectList("AccommodationCommentMapper.selectByAccommodationNo", accommodationNo);
	}
	//	댓글번호별 회원번호 조회하기
	public int selectByMemberNo(int accommodationCommentNo){
		return template.selectOne("AccommodationCommentMapper.selectByMemberNo", accommodationCommentNo);
	}
	
 * */
}
