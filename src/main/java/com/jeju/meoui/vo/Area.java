package com.jeju.meoui.vo;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Area {
	private int areaNo;
	private String areaName;
	private String detailsAddress;
	private int siteNo;
	public Area(String areaName, String detailsAddress, int siteNo) {
		super();
		this.areaName = areaName;
		this.detailsAddress = detailsAddress;
		this.siteNo = siteNo;
	}
	public Area(String areaName, String detailsAddress) {
		super();
		this.areaName = areaName;
		this.detailsAddress = detailsAddress;
	}
	
	
}
