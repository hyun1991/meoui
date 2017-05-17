package com.jeju.meoui.vo;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomImg {
	private int roomNo;					//	객실종류번호
	private int accommodationNo;		//	숙박시설번호
	private int roomImgName;			//	객실이미지파일명
}
