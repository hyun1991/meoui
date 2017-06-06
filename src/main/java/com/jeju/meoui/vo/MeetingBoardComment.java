package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;



@Data
@AllArgsConstructor
@NoArgsConstructor
public class MeetingBoardComment {
	private int meetingboardCommentNo;
	private String meetingboardCommentContent;
	private Date meetingboardCommentDate;
	private int meetingboardNo;
	private int memberNo;
	private String memberName;
	private int meetingNo;
	
	
}
