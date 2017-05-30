package com.jeju.meoui.vo;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Site {
	private int siteNo;
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
	private String area;
	private int usersNo;
	private int ticketPrice;
	private String agegroupStandard;
	private String park;
	public Site(String siteName, int sitePark, String siteObject, String siteImg, String siteIntroduce,
			String siteHomepage, String sitePhone, String siteOpenTime, String siteCloseTime, String siteNightOpen,
			String siteNightCloseTime) {
		super();
		this.siteName = siteName;
		this.sitePark = sitePark;
		this.siteObject = siteObject;
		this.siteImg = siteImg;
		this.siteIntroduce = siteIntroduce;
		this.siteHomepage = siteHomepage;
		this.sitePhone = sitePhone;
		this.siteOpenTime = siteOpenTime;
		this.siteCloseTime = siteCloseTime;
		this.siteNightOpen = siteNightOpen;
		this.siteNightCloseTime = siteNightCloseTime;
	}
	public Site(int siteNo, String siteName, int sitePark, String siteObject, String siteImg, String siteIntroduce,
			String siteHomepage, String sitePhone, String siteOpenTime, String siteCloseTime, String siteNightOpen,
			String siteNightCloseTime, int usersNo) {
		super();
		this.siteNo = siteNo;
		this.siteName = siteName;
		this.sitePark = sitePark;
		this.siteObject = siteObject;
		this.siteImg = siteImg;
		this.siteIntroduce = siteIntroduce;
		this.siteHomepage = siteHomepage;
		this.sitePhone = sitePhone;
		this.siteOpenTime = siteOpenTime;
		this.siteCloseTime = siteCloseTime;
		this.siteNightOpen = siteNightOpen;
		this.siteNightCloseTime = siteNightCloseTime;
		this.usersNo = usersNo;
	}
	
	
}
