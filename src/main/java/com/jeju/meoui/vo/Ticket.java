package com.jeju.meoui.vo;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ticket {
	private int ticketNo;
	private int siteNo;
	private int ticketPrice;
	private int usersNo;
	private String ticketStandard;
}

/*
ticket_no number(10) primary key,
ticket_price number(10),
ticket_standard nvarchar2(50),
site_no number(10) references site(site_no),
users_no number(10) references users(users_no)
);
*/
