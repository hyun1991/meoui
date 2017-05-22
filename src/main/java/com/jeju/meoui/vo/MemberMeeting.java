package com.jeju.meoui.vo;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberMeeting {
	
	private int meetingNo;				//모임번호
	private String meetingName;			//모임이름
	private String meetingImg;			//모임대표이미지
	private int meetingTotalNumber;		//모임인원수


	public MemberMeeting(String meetingName){
			this.meetingName = meetingName;
	}
	public MemberMeeting(String meetingName, String meetingImg) {
		super();
		this.meetingName = meetingName;
		this.meetingImg = meetingImg;
	}
	
}