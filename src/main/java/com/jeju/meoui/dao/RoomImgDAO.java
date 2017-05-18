package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class RoomImgDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	//	객실 이미지 추가하기
	public void insertRoomImg(RoomImg roomImg){
		template.insert("RoomImgMapper.insertRoomImg", roomImg);
	}
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

}
