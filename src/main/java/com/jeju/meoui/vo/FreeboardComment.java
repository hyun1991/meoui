package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
public class FreeboardComment {
	private int freeboardCommentNo;			// 자유게시판 댓글 번호
	private String freeboardCommentContent;	// 자유게시판 댓글 내용
	private Date freeboardCommentDate;		// 자유게시판 댓글 작성일
}
