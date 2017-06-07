package com.jeju.meoui.vo;

import java.sql.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SiteComment {
	private int siteCommentNo;
	private String siteCommentContent;
	private Date siteCommentDate;
	private int memberNo;
	private int siteNo;
	private String memberId;
}
