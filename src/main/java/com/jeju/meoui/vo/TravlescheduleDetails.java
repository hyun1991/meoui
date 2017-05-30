package com.jeju.meoui.vo;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TravlescheduleDetails {

	private int siteNo;				//	관광명소번호(pk)
	private int travlescheduleNo;	//	스케쥴번호(외래키)
	private int memberNo;			//	고객번호
}
