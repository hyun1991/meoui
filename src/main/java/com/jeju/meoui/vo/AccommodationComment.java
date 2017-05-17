package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccommodationComment {
	private int accommodationCommentNo;					//	댓글번호
	private String accommodationCommentContent;			//	댓글본문
	private Date accommodationCommentDate;				//	댓글 작성일
	private int accommodationCommentAvg;				//	평점
	private int	accommodationNo;						//	숙박시설번호
	private int memberNo;								//	댓글작성자
}
