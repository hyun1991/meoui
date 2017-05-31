package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Travleschedule {
	private int travlescheduleNo;		//	일정번호(pk)
	private int memberNo;				//	일반고객번호(pk)
	private Date travlescheduleDate;	//	일정날짜;
	private String schedule;			//	스케쥴내용
	private int siteNo;				//	관광명소번호(pk)


}
