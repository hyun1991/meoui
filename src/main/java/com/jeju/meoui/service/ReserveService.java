package com.jeju.meoui.service;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class ReserveService {
	@Autowired
	private ReserveDAO dao;
	@Autowired
	private ReserveDetailsDAO detailsDao;
	private Logger logger= LoggerFactory.getLogger(ReserveService.class);
	
	//	예약, 예약상세 추가하기
	@Transactional
	public void createReserve(Reserve reserve, HttpSession session){
		int ownerNo= (Integer)session.getAttribute("ownerNo");
		int memberNo= (Integer)session.getAttribute("memberNo");
		reserve.setOwnerNo(ownerNo);
		reserve.setMemberNo(memberNo);
		dao.insertReserve(reserve);
		ReserveDetails details= new ReserveDetails();
		details.setAccommodationNo((Integer)session.getAttribute("accommodationNo"));
		details.setRoomNo((Integer)session.getAttribute("roomNo"));
		details.setReserveTotalPrice(reserve.getReservePrice());
		details.setReserveNo(dao.selectByMaxReserveNo());
		detailsDao.insertReserveDetails(details);
	}

/*
 
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
	=========================================================================
	//	예약상세 추가하기
	public void insertReserveDetails(ReserveDetails details){
		template.insert("ReserveDetailsMapper.insertReserveDetails", details);
	}
	//	예약상세 삭제하기
	public void deleteReserveDetails(int accommodationNo, int roomNo, int reserveNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("accommodationNo", accommodationNo);
		map.put("roomNo", roomNo);
		map.put("reserveNo", reserveNo);
		template.delete("ReserveDetailsMapper.deleteReserveDetails", map);
	}
	//	객실종류번호별 예약상세 조회하기
	public List<ReserveDetails> selectAllByRoomNo(int roomNo){
		return template.selectList("ReserveDetailsMapper.selectAllByRoomNo", roomNo);
	}
	=====================================================================
 */
}
