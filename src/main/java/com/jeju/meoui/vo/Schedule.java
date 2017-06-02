package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class Schedule {
	private int travlescheduleNo;		//	일정번호(pk)
	private int memberNo;				//	일반고객번호(pk)
	private Date travlescheduleDate;	//	일정날짜;
	private Date end;
	private String schedule;			//	스케쥴내용
	private String siteName;
	private int sitePark;
	private String siteObject;
	private String siteImg;
	private String siteIntroduce;
	private String siteHomepage;
	private String sitePhone;
	private String siteOpenTime;
	private String siteCloseTime;
	private String siteNightOpen;
	private String siteNightCloseTime;
	private String detailsAddress;
	private int usersNo;
	private ArrayList<TravlescheduleDetails>details;
	private ArrayList<Site>site;
}
