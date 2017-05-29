package com.jeju.meoui.vo;

import java.util.Date;

import lombok.*;

@Data
public class FreeBoard {
	private int freeboardNo;			// 자유게시판 번호
	private String freeboardTitle;		// 자유게시판 제목
	private String freeboardContent;	// 자유게시판 내용
	private Date freeboardDate;			// 자유게시판 작성일
	private int freeboardCnt;			// 자유게시판 조회수
	private String freeboardImg;			// 자유게시판 업로드 파일명
	private int memberNo;
}