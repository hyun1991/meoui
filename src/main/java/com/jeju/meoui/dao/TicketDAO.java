package com.jeju.meoui.dao;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class TicketDAO {
	private SqlSessionTemplate template;
	
	// 1.티켓 추가
	public void insetTicket(Ticket t){
		template.insert("TicketMapper.insertTicket",t);
	}
	
	// 2.티켓 수정
	public void updateTicket(Ticket t){
		template.update("TicketMapper.updateTicket", t);
	}
	
	// 3.티켓 삭제
	public void deleteTicket(int siteNo){
		template.delete("TicketMapper.deleteTicket", siteNo);
	}
}
