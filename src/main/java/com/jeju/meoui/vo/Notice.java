package com.jeju.meoui.vo;

import java.sql.*;

import lombok.*;

@Data
public class Notice {
     private int noticeNo;
     private String noticeTitle;
     private String noticeContent;
     private Date noticeDate;
     private int noticeCnt;
     private int usersNo;
}
