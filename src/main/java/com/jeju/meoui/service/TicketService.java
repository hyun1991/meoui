package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class TicketService {
	private static final Logger logger = LoggerFactory.getLogger(TicketService.class);
	@Autowired
	private TicketDAO dao;
	
	// 1. 추가
	public void createTicket(Ticket ticket){
		int ticketNo = dao.MaxTicketNo();
		ticket.setTicketNo(ticketNo);
		logger.info("pageNo:{}", ticketNo);
		dao.insetTicket(ticket);
	}
	
	// 2. 티켓 리스트
	public HashMap<String, Object>findTicket(int siteNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		System.out.println(dao.selectTicketList(siteNo));
		map.put("list", dao.selectTicketList(siteNo));
		return map;
	}
	
	// 3. 티켓 수정
	public void modifyTicket(Ticket ticket ){
		dao.updateTicket(ticket);
	}
	
	// 4. 티켓 삭제
	public void removeTicket(int siteNo){
		dao.deleteTicket(siteNo);
	}
}
