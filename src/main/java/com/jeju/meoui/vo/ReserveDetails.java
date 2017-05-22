package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReserveDetails {
	private int reserveNo;	//	숙박시설번호
	private int roomNo;		//	객실종류번호
	private int accommodationNo;	//	예약번호
	private Date reserveDate;		//	예약일자
	private int reserveTotalPrice;	//	예약총금액
	public ReserveDetails(int roomNo, int accommodationNo, int reserveTotalPrice) {
		super();
		this.roomNo = roomNo;
		this.accommodationNo = accommodationNo;
		this.reserveTotalPrice = reserveTotalPrice;
	}
	public ReserveDetails(int reserveNo, int roomNo, int accommodationNo, int reserveTotalPrice) {
		super();
		this.reserveNo = reserveNo;
		this.roomNo = roomNo;
		this.accommodationNo = accommodationNo;
		this.reserveTotalPrice = reserveTotalPrice;
	}
	
}

