package com.jeju.meoui.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class AccommodationCommentService {
	@Autowired
	private AccommodationCommentDAO dao;
	
	//	숙박시설 댓글 추가하기
	public void createAccommodationComment(AccommodationComment accommodationComment){
		dao.insertAccommodationComment(accommodationComment);
	}
	//	숙박시설 댓글 수정하기
	public void modifyAccommodationComment(AccommodationComment accommodationComment){
		dao.updateAccommodationComment(accommodationComment);
	}
	//	숙박시설 댓글 삭제하기
	public void removeAccommodationComment(int accommodationCommentNo, int memberNo){
		dao.deleteAccommodationComment(accommodationCommentNo, memberNo);
	}
}
