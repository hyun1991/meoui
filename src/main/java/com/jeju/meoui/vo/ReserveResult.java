package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReserveResult {
	private int totalprice;			//	예약총금액 ((숙박금액+(인원수*10000)))*(체크아웃-체크인)
	private int stayPeople;			//	예약인원
	private Date checkIn;			//	체크인
	private Date checkOut;			//	체크아웃
	private String accommodationName;	//	숙박시설명
	private String accommodationAddress;	//	숙박시설 주소
	private String accommodationPhone;		//	숙박시설 연락처
	private int memberNo;					//	회원번호
	private int reserveNo;
	private int ownerNo;
	private String memberName;
	private String memberPhone;
	private String memberAddress;
	private String memberMail;
}
