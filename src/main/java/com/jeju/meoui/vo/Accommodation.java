package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Accommodation {
	private int accommodationNo;									//	숙박시설 번호
	private String accommodationName;								//	숙박시설이름
	private String accommodationAddress;							//	숙박시설위치
	private String accommodationImg;								//	업체이미지 파일명
	private String accommodationPhone;								//	업체연락처
	private	String accommodationDirections;							//	오시는길 이미지
	private int siteNo;												//	관광명소 번호(샘플 40번)
	private int ownerNo;											//	숙박업주 번호(샘플 41번)
	private ArrayList<Room> room;									//	객실이미지
	private ArrayList<AccommodationComment> accommodationComment;	//	숙박시설 댓글List
	public Accommodation(int accommodationNo, String accommodationName, String accommodationAddress,
			String accommodationImg, String accommodationPhone, String accommodationDirections, int siteNo,
			int ownerNo) {
		super();
		this.accommodationNo = accommodationNo;
		this.accommodationName = accommodationName;
		this.accommodationAddress = accommodationAddress;
		this.accommodationImg = accommodationImg;
		this.accommodationPhone = accommodationPhone;
		this.accommodationDirections = accommodationDirections;
		this.siteNo = siteNo;
		this.ownerNo = ownerNo;
	}
	
}
