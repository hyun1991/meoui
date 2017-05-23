package com.jeju.meoui.vo;
import java.util.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reserve {
	private int reserveNo;
	private int stayPeople;
	private int reservePrice;
	private Date checkIn;
	private Date checkOut;
	private int memberNo;
	private int ownerNo;
	private int roomNo;
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
	public Reserve(int stayPeople, int reservePrice) {
		super();
		this.stayPeople = stayPeople;
		this.reservePrice = reservePrice;
	}
	public Reserve(int stayPeople, int reservePrice, Date checkIn, Date checkOut, int roomNo) {
		super();
		this.stayPeople = stayPeople;
		this.reservePrice = reservePrice;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.roomNo = roomNo;
	}
}
