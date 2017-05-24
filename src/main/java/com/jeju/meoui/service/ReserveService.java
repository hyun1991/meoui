package com.jeju.meoui.service;

import java.util.*;

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
	@Autowired
	private RoomDAO roomDao;
	@Autowired
	private AccommodationDAO acDao;
	@Autowired
	private MemberDAO memberDao;
	private Logger logger= LoggerFactory.getLogger(ReserveService.class);
	
	//	예약, 예약상세 추가하기
	@Transactional
	public void createReserve(Reserve reserve, HttpSession session){
		int ownerNo= (Integer)session.getAttribute("ownerNo");
		int memberNo= (Integer)session.getAttribute("memberNo");
		reserve.setRoomNo((Integer)session.getAttribute("roomNo"));
		reserve.setOwnerNo(ownerNo);
		reserve.setMemberNo(memberNo);
		dao.insertReserve(reserve);
		ReserveDetails details= new ReserveDetails();
		details.setAccommodationNo((Integer)session.getAttribute("accommodationNo"));
		details.setRoomNo((Integer)session.getAttribute("roomNo"));
		int reservePrice= reserve.getReservePrice();
		int stayPeople= reserve.getStayPeople();
		int reserveTotalPrice= reservePrice+(stayPeople*10000);
		details.setReserveTotalPrice(reserveTotalPrice);
		details.setReserveNo(dao.selectByMaxReserveNo());
		detailsDao.insertReserveDetails(details);
	}
	
	//	회원번호별 예약리스트 조회하기
	public HashMap<String, Object> getAllByMemberNo(int memberNo){
		List<Reserve>list= dao.selectAllByMemberNo(memberNo);
		HashMap<String, Object> map= new HashMap<String, Object>();
		//	실제로 roomNo는 존재하지 않는다.
		//	sql문에서 조인대신 자바 코드로 조인 진행하였습니다.
		for(Reserve result: list){
			ArrayList<Integer> roomResult= new ArrayList<Integer>();
			ArrayList<Integer> acResult= new ArrayList<Integer>();
			if(result.getReserveNo()!=0){
				int roomNo= detailsDao.selectByRoomNo(result.getReserveNo());
				int accommodationNo= detailsDao.selectByAccommodationNo(result.getReserveNo());
				roomResult.add(roomNo);
				acResult.add(accommodationNo);
				//	roomNo만 저장되어있는 List
				for(Integer acNoResult: acResult){
					List<Accommodation> resultAc= acDao.findAllAccommodation(acNoResult);
					map.put("ac", resultAc);
					for(Integer roomNoResult: roomResult){
						List<Room>resultRoom= roomDao.findByRoomNo(roomNoResult);
						map.put("room", resultRoom);
					}
				}
			}
		}
		map.put("list", list);
		return map;
	}
	//	예약취소하기
	public void removeReserve(int reserveNo, int memberNo){
		dao.deleteReserve(reserveNo, memberNo);
		detailsDao.deleteReserveDetails(reserveNo);
	}
	//	숙박업주별 예약리스트 조회하기
	public HashMap<String, Object>getAllByOwnerNo(int ownerNo){
		List<Reserve>list= dao.selectAllByOwnerNo(ownerNo);
		HashMap<String, Object> map= new HashMap<String, Object>();
		for(Reserve result: list){
			ArrayList<Integer> roomResult= new ArrayList<Integer>();
			ArrayList<Integer> acResult= new ArrayList<Integer>();
			if(result.getReserveNo()!=0){
				int memberNo= result.getMemberNo();
				List<Member>mResult= memberDao.findAllMemberNo(memberNo);
				map.put("member", mResult);
				int roomNo= detailsDao.selectByRoomNo(result.getReserveNo());
				int accommodationNo= detailsDao.selectByAccommodationNo(result.getReserveNo());
				roomResult.add(roomNo);
				acResult.add(accommodationNo);
				//	roomNo만 저장되어있는 List
				for(Integer acNoResult: acResult){
					List<Accommodation> resultAc= acDao.findAllAccommodation(acNoResult);
					map.put("ac", resultAc);

					for(Integer roomNoResult: roomResult){
						List<Room>resultRoom= roomDao.findByRoomNo(roomNoResult);
						map.put("room", resultRoom);
					}
				}
			}
		}
		map.put("list", list);
		return map;
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
