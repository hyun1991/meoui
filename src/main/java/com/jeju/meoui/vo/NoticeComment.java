package com.jeju.meoui.vo;

import java.sql.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeComment {
	private int noticeCommentNo;
	private String noticeCommentContent;
	private Date noticeCommentDate;
	private int memberNo;
	private int noticeNo;
	private String memberName;

}
