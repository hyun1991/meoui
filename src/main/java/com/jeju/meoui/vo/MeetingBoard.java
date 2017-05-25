package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class MeetingBoard {

	private int meetingboardNo;
	private String meetingboardTitle;
	private String meetingboardContent;
	private Date meetingboarDate;
	private int meetingboardCnt;
	private String meetingboardImg;
	private int memberNo;
	private int meetingNo;
}
