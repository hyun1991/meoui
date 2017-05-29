package com.jeju.meoui.service;

import java.util.*;

import javax.servlet.http.*;

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
	private MemberDAO memberDao;
	@Autowired
	private SiteDAO siteDao;
	
	//	숙박시설 추가전 보내주어야 하는 관광명소 정보.
	public HashMap<String, Object> createAccommodationStart(){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("list", siteDao.selectSiteList());
		return map;
	}
	//	숙박시설 추가하기
	@Transactional
	public void createAccommodation(Accommodation accommodation, HttpSession session){
		dao.insertAccommodation(accommodation);
		int accommodationNo= dao.findByAccommodationMax();
		session.setAttribute("accommodationNo", accommodationNo);
		//	객실이미지 추가를 위해 세션에 저장해 놓았습니다.
		//	객실이미지 추가후에는 바로 삭제해야 합니다.
	}
	//	숙박시설 수정하기
	public void modifyAccommodation(Accommodation accommodation){
		dao.updateAccommodation(accommodation);
	}
	//	숙박시설 삭제하기
	@Transactional
	public void deleteAccommodation(int accommodationNo){
		commentDao.deleteAllAccommodationComment(accommodationNo);
		logger.info("숙박시설 댓글 전체삭제");
		dao.deleteAccommodation(accommodationNo);
		logger.info("숙박시설 삭제");
	}
	//	숙박시설 페이지별 조회하기
	public HashMap<String, Object> getAllAccommodation(int pageNo){
		int cnt= dao.selectByMax();
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", dao.selectAllAccommodation(pagination.getStartRow(), pagination.getLastRow()));
		return map;
	}
	//	숙박시설 오너별 페이지별 조회하기
	public HashMap<String, Object> getByOwnerNoAccommodation(int pageNo, int ownerNo){
		int cnt= dao.selectByMax();
		logger.info("페이지 시작");
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		logger.info("페이지:{}", pagination);
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", dao.selectByOwnerNoAccommodation(pagination.getStartRow(), pagination.getLastRow(), ownerNo));
		return map;
	}

	//	숙박시설 번호별 조회하기(상세보기, 사용자꺼)
	@Transactional
	public HashMap<String, Object> getByAccommodation(int accommodationNo, int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		Accommodation accommodation= dao.findByAccommodation(accommodationNo);
		List<AccommodationComment> comment= commentDao.selectByAccommodationNo(accommodationNo);
		for(AccommodationComment cm: comment){
			if(cm.getAccommodationCommentAvg()!=0){
				if(cm.getAccommodationCommentAvg()==1)
					cm.setByul("★☆☆☆☆");
				else if(cm.getAccommodationCommentAvg()==2)
					cm.setByul("★★☆☆☆");
				else if(cm.getAccommodationCommentAvg()==3)
					cm.setByul("★★★☆☆");
				else if(cm.getAccommodationCommentAvg()==4)
					cm.setByul("★★★★☆");
				else if(cm.getAccommodationCommentAvg()==5)
					cm.setByul("★★★★★");
			}
		}
		List<AccommodationComment> memberComment= commentDao.selectByMemberNoAccommodationNo(accommodationNo, memberNo);
		for(AccommodationComment mComment: comment){
			//	mComment는 작성자memberNo를 빼기위함.
			int cMemberNo= mComment.getMemberNo();
			if(cMemberNo!=0){
				List<Member>cMember= memberDao.findAllMemberNo(cMemberNo);
				map.put("member", cMember);
			}
		}
		map.put("accommodation", accommodation);
		map.put("comment", comment);
		map.put("memberComment", memberComment);
		return map;
	}
	//	숙박시설 번호별 조회하기(상세보기, 숙박업주꺼)
	@Transactional
	public HashMap<String, Object> getByOwnerAccommodation(int accommodationNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		Accommodation accommodation= dao.findByAccommodation(accommodationNo);
		List<AccommodationComment> comment= commentDao.selectByAccommodationNo(accommodationNo);
		for(AccommodationComment cm: comment){
			if(cm.getAccommodationCommentAvg()!=0){
				if(cm.getAccommodationCommentAvg()==1)
					cm.setByul("★☆☆☆☆");
				else if(cm.getAccommodationCommentAvg()==2)
					cm.setByul("★★☆☆☆");
				else if(cm.getAccommodationCommentAvg()==3)
					cm.setByul("★★★☆☆");
				else if(cm.getAccommodationCommentAvg()==4)
					cm.setByul("★★★★☆");
				else if(cm.getAccommodationCommentAvg()==5)
					cm.setByul("★★★★★");
			}
		}
		map.put("accommodation", accommodation);
		map.put("comment", comment);
		return map;
	}
	//	숙박시설 최근업로드된 메인페이지 노출용 조회
	public HashMap<String,Object>mainNewAccommodation(){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("list", dao.newAcoomoodation());
		return map;
	}

}
