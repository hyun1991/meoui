package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
	private	int	messageNo;					//	쪽지번호	
	private	String messageReceiveId	;		//	수신인아이디
	private	String messageSendId;			//	발신인아이디
	private	String messageTitle	;			//	쪽지제목
	private	String messageContent;			//	쪽지내용
	private	Date messageDate;				//	보낸날짜
	private	Date messageReceiveDate;		//	수신인 읽은날짜
	private	int	messageReceiveCheck;		//	수신인 쪽지 확인여부
	private	int	memberNo;					//	회원번호
	
	private String check;					//	쪽지확인여부를 확인/미확인을 위해 보여주기 위한 필드
	public Message(String messageReceiveId, String messageSendId, String messageTitle, String messageContent,
			int memberNo) {
		super();
		this.messageReceiveId = messageReceiveId;
		this.messageSendId = messageSendId;
		this.messageTitle = messageTitle;
		this.messageContent = messageContent;
		this.memberNo = memberNo;
	}
	
}
