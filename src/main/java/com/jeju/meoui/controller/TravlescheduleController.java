package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class TravlescheduleController {
	@Autowired
	private TravlescheduleService service;
	//	일정 추가하기
	@RequestMapping(value="/schedule/join", method=RequestMethod.POST)
	public String insertTravle(@ModelAttribute Travleschedule travleschedule, HttpSession session){
		int memberNo= (Integer)session.getAttribute("memberNo");
		int siteNo= (Integer)session.getAttribute("siteNo");
		travleschedule.setMemberNo(memberNo);
		service.createTravle(travleschedule, siteNo);
		return "redirect:/site/list?pageNo=1";
	}
	/*
	 * 	//	일정추가하기
	@Transactional
	public void createTravle(Travleschedule travleschedule, int siteNo){
		dao.insertTravle(travleschedule);
		int travlescheduleNo= dao.getByTravleNo();
		TravlescheduleDetails details= new TravlescheduleDetails();
		details.setMemberNo(travleschedule.getMemberNo());
		details.setSiteNo(siteNo);
		details.setTravlescheduleNo(travlescheduleNo);
		detailDao.insertTravleDetails(details);
	 * */
}
