package com.jeju.meoui.vo;

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
	
}
