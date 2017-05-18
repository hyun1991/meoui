package com.jeju.meoui.vo;

import java.sql.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
     private int noticeNo;
     private String noticeTitle;
     private String noticeContent;
     private Date noticeDate;
     private int noticeCnt;
     private int usersNo;
	public Notice(String noticeTitle, String noticeContent, Date noticeDate, int noticeCnt, int usersNo) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeCnt = noticeCnt;
		this.usersNo = usersNo;
	}
     
}
