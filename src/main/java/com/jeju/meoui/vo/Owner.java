package com.jeju.meoui.vo;

import java.util.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Owner {
	private int ownerNo;
	private String ownerId;
	private String ownerPassword;
	private String ownerName;
	private String ownerPhone;
	private String ownerAddress;
	private String ownerMail;
	private Date ownerStartdate;
	private String ownerBrn;
}
