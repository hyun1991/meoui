package com.jeju.meoui.vo;

import java.sql.*;

import lombok.*;

@Data
public class NoticeComment {
	private int noticeCommentNo;
	private String noticeCommentContent;
	private Date noticeCommentDate;
	private int memberNo;
	private int noticeNo;

}
