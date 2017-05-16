package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
public class Message {
	private	int	messageNo;					//	쪽지번호	
	private	String messageReceiveId	;		//	수신인아이디
	private	String messageSendId;			//	발신인아이디
	private	String messageTitle	;			//	쪽지제목
	private	String messageContent;			//	쪽지내용
	private	Date messageDate;				//	보낸날짜
	private	Date messageReceiveDate;		//	수신인 읽은날짜
	private	int	messageReceiveCheck;		//	수신인 쪽지 확인여부
	private	int	memberId;					//	회원번호
}
