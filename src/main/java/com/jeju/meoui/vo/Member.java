package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	private int memberNo;					//	회원번호(PK)
	private String memberId;				//	회원아이디
	private String memberPassword;			//	패스워드
	private String memberName;				//	이름
	private String memberPhone;				//	연락처
	private String memberAddress;			//	주소지
	private String memberMail;				//	이메일
	private String memberJob;				//	직업
	private String memberGender;			//	성별
	private Date memberStartdate;			//	가입일
	private String memberHobby;				//	취미
	public Member(String memberId, String memberPassword, String memberName, String memberPhone, String memberAddress,
			String memberMail, String memberJob, String memberGender, String memberHobby) {
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.memberMail = memberMail;
		this.memberJob = memberJob;
		this.memberGender = memberGender;
		this.memberHobby = memberHobby;
	}
	public Member(String memberId, String memberPassword, String memberName, String memberPhone, String memberMail,
			String memberJob, String memberGender, Date memberStartdate, String memberHobby) {
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberMail = memberMail;
		this.memberJob = memberJob;
		this.memberGender = memberGender;
		this.memberStartdate = memberStartdate;
		this.memberHobby = memberHobby;
	}
	
}
