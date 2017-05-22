package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reserve {
	private int reserveNo;				//	예약번호
	private int stayPeople;				//	숙박인원
	private int reservePrice;			//	예약금액
	private Date checkIn;				//	체크인
	private Date checkOut;				//	체크아웃
	private int memberNo;				//	예약한 회원번호
	private int ownerNo;				//	펜션정보 업로드 업주번호
	public Reserve(int stayPeople, int reservePrice, Date checkIn, Date checkOut) {
		super();
		this.stayPeople = stayPeople;
		this.reservePrice = reservePrice;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
	}
	public Reserve(int stayPeople, int reservePrice, Date checkIn, Date checkOut, int memberNo, int ownerNo) {
		super();
		this.stayPeople = stayPeople;
		this.reservePrice = reservePrice;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.memberNo = memberNo;
		this.ownerNo = ownerNo;
	}
	
}

