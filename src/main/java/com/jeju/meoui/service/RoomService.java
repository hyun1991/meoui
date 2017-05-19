package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class RoomService {
	@Autowired
	private RoomDAO dao;
	@Autowired
	private RoomImgDAO roomImgDao;
	private static final Logger logger= LoggerFactory.getLogger(RoomService.class);
	//	객실, 객실이미지 추가하기 
	@Transactional
	public void createRoom(Room room, RoomImg roomImg){
		dao.insertRoom(room);
		int roomNo= dao.selectByRoomNo(room.getAccommodationNo(), room.getRoomName());
		logger.info("객실번호:{}", roomNo);
		roomImg.setRoomNo(roomNo);
		roomImgDao.insertRoomImg(roomImg);
	}
	//	숙박시설번호별 객실정보 및 객실이미지 정보 조회하기
	@Transactional
	public HashMap<String, Object>getByRoom(int accommodationNo){
		List<Room>room= dao.selectByAccommodationNo(accommodationNo);
		List<RoomImg>roomImg= roomImgDao.selectByAccommodationNo(accommodationNo);
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("room", room);
		map.put("roomImg", roomImg);
		return map;
	}
	//	객실삭제하기
	@Transactional
	public void removeRoom(int accommodationNo, int roomNo){
		dao.deleteRoom(accommodationNo, roomNo);
		roomImgDao.deleteAllRoomImg(roomNo);
	}
}
