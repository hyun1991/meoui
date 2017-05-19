package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
public class Reserv {
	private int reserveNo;				//	예약번호
	private int stayPeople;				//	숙박인원
	private Date checkIn;				//	체크인
	private Date checkOut;				//	체크아웃
	private int memberNo;				//	예약한 회원번호
	private int ownerNo;				//	펜션정보 업로드 업주번호
}
