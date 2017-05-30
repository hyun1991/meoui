package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FreeBoardComment {
	private int freeboardCommentNo;			// 자유게시판 댓글 번호
	private String freeboardCommentContent;	// 자유게시판 댓글 내용
	private Date freeboardCommentDate;// 자유게시판 댓글 작성일
	private int freeboardNo;
	private int memberNo;
}
