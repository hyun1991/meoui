package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomImg {
	private int roomNo;					//	객실종류번호
	private int accommodationNo;		//	숙박시설번호
	private String roomImg;				//	객실이미지파일명
}
