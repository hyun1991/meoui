package com.jeju.meoui.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class TicketService {
	@Autowired
	private TicketDAO dao;
	@Autowired
	private AgegroupDAO aDao;
	
	public void createTicket(Ticket ticket, AgeGroup ag){
		ag.setAgegroupNo(aDao.MaxNo());
		aDao.insertAgegroup(ag);
		ticket.setAgegroupNo(aDao.MaxNo());
		dao.insetTicket(ticket);
	}
}
