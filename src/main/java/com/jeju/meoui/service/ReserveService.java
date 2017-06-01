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
					System.out.println(acNoResult);
					List<Accommodation> resultAc= acDao.findAllAccommodation(acNoResult);
					for(int i=0; i<resultAc.size(); i++){
						map.put("ac", resultAc);
						continue;
					}
					logger.info("숙박시설:{}", resultAc);
					continue;
				}
				for(Integer roomNoResult: roomResult){
					List<Room>resultRoom= roomDao.findByRoomNo(roomNoResult);
					for(int i=0; i<resultRoom.size(); i++){
						map.put("room", resultRoom);
					}
					logger.info("룸:{}", resultRoom);
					continue;
				}
			}
			continue;
		}
		map.put("list", list);
		logger.info("서비스단 맵:{}", map);
		return map;
	}
	//	예약취소하기
	@Transactional
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
	public HashMap<String, Object>getAllReserve(){
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("list", dao.getByAllReserve());
		return map;
	}
}
