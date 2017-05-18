package com.jeju.meoui.vo;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberMeeting {
	
	private int meetingNo;				//모임번호
	private String meetingName;			//모임이름
	private int meetingTotalNumber;		//모임인원수
}
