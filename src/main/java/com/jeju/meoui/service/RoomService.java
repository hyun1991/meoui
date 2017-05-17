package com.jeju.meoui.service;

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
/*
 
	//	객실수정하기
	public void updateRoom(Room room){
		template.update("RoomMapper.updateRoom", room);
	}
	//	객실삭제하기
	public void deleteRoom(int accommodationNo, int roomNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("accommodationNo", accommodationNo);
		map.put("roomNo", roomNo);
		template.delete("RoomMapper.deleteRoom", map);
	}
	//	숙박시설번호별 객실조회하기
	public List<Room> selectByAccommodationNo(int accommodationNo){
		return template.selectList("RoomMapper.selectByAccommodationNo", accommodationNo);
	}
	=========================================================================================

	//	객실 이미지 삭제하기
	public void deleteRoomImg(RoomImg roomImg){
		template.delete("RoomImgMapper.deleteRoomImg", roomImg);
	}
	//	객실 이미지 전체삭제하기
	public void deleteAllRoomImg(int roomNo){
		template.delete("RoomImgMapper.deleteAllRoomImg", roomNo);
	}
	//	숙박시설번호별 객실이미지 전체조회
	public List<RoomImg> selectByAccommodationNo(int accommodationNo){
		return template.selectList("RoomImgMapper.selectByAccommodationNo", accommodationNo);
	}
 * */
}
