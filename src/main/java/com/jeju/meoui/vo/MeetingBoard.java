package com.jeju.meoui.vo;




import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class MeetingBoard {

	private int meetingboardNo;
	private String meetingboardTitle;
	private String meetingboardContent;
	private Date meetingboardDate;
	private int meetingboardCnt;
	private String meetingboardImg;
	private int memberNo;
	private int meetingNo;
	private String memberName;
}
