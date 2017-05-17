package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Service
public class AccommodationService {
	private static final Logger logger= LoggerFactory.getLogger(AccommodationService.class);
	@Autowired
	private AccommodationDAO dao;
	@Autowired
	private AccommodationCommentDAO commentDao;
	
	//	숙박시설 추가하기
	public void createAccommodation(Accommodation accommodation){
		dao.insertAccommodation(accommodation);
	}
	//	숙박시설 수정하기
	public void modifyAccommodation(Accommodation accommodation){
		dao.updateAccommodation(accommodation);
	}
	//	숙박시설 삭제하기
	@Transactional
	public void deleteAccommodation(int accommodationNo){
		dao.deleteAccommodation(accommodationNo);
		commentDao.deleteAllAccommodationComment(accommodationNo);
	}
	//	숙박시설 페이지별 조회하기
	public HashMap<String, Object> getAllAccommodation(int pageNo){
		int cnt= dao.findByAccommodationMax();
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", dao.selectAllAccommodation(pagination.getStartRow(), pagination.getLastRow()));
		return map;
	}
	//	숙박시설 번호별 조회하기(상세보기)
	@Transactional
	public HashMap<String, Object> getByAccommodation(int accommodationNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		Accommodation accommodation= dao.findByAccommodation(accommodationNo);
		List<AccommodationComment> comment= commentDao.selectByAccommodationNo(accommodationNo);
		map.put("accommodation", accommodation);
		map.put("comment", comment);
		return map;
	}

}
