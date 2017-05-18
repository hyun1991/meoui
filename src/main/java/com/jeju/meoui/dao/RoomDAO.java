package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class RoomDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	//	객실추가하기
	public void insertRoom(Room room){
		template.insert("RoomMapper.insertRoom", room);
	}
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
	//	객실종류명, 숙박시설번호별 객실종류번호 조회하기
	public int selectByRoomNo(int accommodationNo, String roomName){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("accommodationNo", accommodationNo);
		map.put("roomName", roomName);
		return template.selectOne("RoomMapper.selectByRoomNo", map);
	}

}
