package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Controller
public class TicketController {
	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);
	@Autowired
	private TicketService service;
	
	// 티켓 추가 폼
	@RequestMapping(value="/ticket/insert", method=RequestMethod.GET)
	public String insertSite(){
		return "ticket/insert";
	}
	
	// 티켓 추가 성공
	@RequestMapping(value="/ticket/insert", method=RequestMethod.POST)
	public String insertSite( Ticket ticket,  HttpSession session){
		int usersNo = (Integer)session.getAttribute("usersNo");
		int siteNo = (Integer)session.getAttribute("siteNo");
		ticket.setUsersNo(usersNo);
		ticket.setSiteNo(siteNo);
		service.createTicket(ticket);
		return "redirect:/admin/site/list?pageNo=1";
	}
	
	// 티켓 수정 폼
	@RequestMapping(value="/ticket/update" , method=RequestMethod.GET)
	public String updateSite(){
		return "ticket/update";
	}
	
	// 티켓 수정 성공
	@RequestMapping(value="/ticket/update", method=RequestMethod.POST)
	public String updateSite(Ticket ticket,   HttpSession session){
		int usersNo = (Integer)session.getAttribute("usersNo");
		int siteNo = (Integer)session.getAttribute("siteNo");
		ticket.setUsersNo(usersNo);
		ticket.setSiteNo(siteNo);
		service.modifyTicket(ticket);
		return "redirect:/admin/site/list?pageNo=1";
	}
}
