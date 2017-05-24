package com.jeju.meoui.vo;

import org.hibernate.validator.constraints.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
	private int usersNo;
	@Length(min=5, max=20)
	private String username;
	@Length(min=5, max=20)
	private String password;
}
