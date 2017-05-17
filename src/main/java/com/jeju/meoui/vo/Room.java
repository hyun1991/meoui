package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Room {
	private int accommodationNo;			//	숙박시설번호
	private int roomNo;						//	객실번호
	private String roomName;				//	객실이름
	private int roomPrice;					//	객실예약금액
	private int roomUseNumber;				//	숙박가능인원
	private ArrayList<RoomImg> roomImg;		//	객실이미지
}
