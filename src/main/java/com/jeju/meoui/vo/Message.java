package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
public class Message {
	private	int	messageNo;
	private	String messageReceiveId	;	
	private	String messageSendId;		
	private	String messageTitle	;	
	private	String messageContent;		
	private	Date messageDate;
	private	Date messageReceiveDate;	
	private	int	messageReceiveCheck;	
	private	int	memberId;	

}
