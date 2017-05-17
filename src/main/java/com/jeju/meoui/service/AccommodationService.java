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
	@Autowired
	private RoomDAO roomDao;
	@Autowired
	private RoomImgDAO roomImgDao;
	
	//	숙박시설 추가하기
	@Transactional
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
	public HashMap<String, Object> getAllAccommodation(int pageNo){
		int cnt= dao.findByAccommodationMax();
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", dao.selectAllAccommodation(pagination.getStartRow(), pagination.getLastRow()));
		return map;
	}
	/*

	//	숙박시설 번호별 조회하기
	public Accommodation findByAccommodation(int accommodationNo){
		return template.selectOne("AccommodationMapper.findByAccommodation", accommodationNo);
	}
	//	숙박시설DB개수 조회하기
	public int findByAccommodationMax(){
		return template.selectOne("AccommodationMapper.findByAccommodationMax");
	}
	//	숙박명별 조회하기
	public Accommodation selectByAccommodation(String accommodationName){
		return template.selectOne("AccommodationMapper.selectByAccommodation", accommodationName);
	}
	==============================================================================================
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
	=================================================================================================
 * */
}
