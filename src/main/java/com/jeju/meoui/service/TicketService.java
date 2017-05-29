package com.jeju.meoui.service;

import java.util.*;

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
	
	// 1. 추가
	public void createTicket(Ticket ticket, AgeGroup ag){
		ag.setAgegroupNo(aDao.MaxNo());
		aDao.insertAgegroup(ag);
		ticket.setAgegroupNo(aDao.MaxNo());
		dao.insetTicket(ticket);
	}
	
	// 2. 티켓 리스트
	public HashMap<String, Object>findTicket(int siteNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("list", dao.selectTicketList(siteNo));
		return map;
	}
	
	// 3. 티켓 수정
	public void modifyTicket(Ticket t , AgeGroup ag){
		aDao.updateAgegroup(ag);
		dao.updateTicket(t);
	}
}
