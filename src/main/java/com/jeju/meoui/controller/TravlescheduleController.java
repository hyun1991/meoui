package com.jeju.meoui.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.format.annotation.*;
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
	public String insertTravle(@RequestParam String schedule, @DateTimeFormat(pattern="yyyy-MM-dd") Date travlescheduleDate, HttpSession session){
		Travleschedule travleschedule= new Travleschedule();
		int memberNo= (Integer)session.getAttribute("memberNo");
		int siteNo= (Integer)session.getAttribute("siteNo");
		travleschedule.setMemberNo(memberNo);
		travleschedule.setTravlescheduleDate(travlescheduleDate);
		travleschedule.setSchedule(schedule);
		service.createTravle(travleschedule, siteNo);
		return "redirect:/site/list?pageNo=1";
	}

}
