package com.jeju.meoui.controller;

import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.format.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class TravlescheduleController {
	@Autowired
	private TravlescheduleService service;
	private Logger logger= LoggerFactory.getLogger(TravlescheduleController.class);
	//	일정 추가하기
	@RequestMapping(value="/schedule/join", method=RequestMethod.POST)
	public String insertTravle(@RequestParam String schedule, @DateTimeFormat(pattern="yyyy-MM-dd") Date travlescheduleDate,@DateTimeFormat(pattern="yyyy-MM-dd") Date end, HttpSession session){
		Travleschedule travleschedule= new Travleschedule();
		int memberNo= (Integer)session.getAttribute("memberNo");
		int siteNo= (Integer)session.getAttribute("siteNo");
		travleschedule.setMemberNo(memberNo);
		travleschedule.setTravlescheduleDate(travlescheduleDate);
		travleschedule.setEnd(end);
		travleschedule.setSchedule(schedule);
		service.createTravle(travleschedule, siteNo);
		return "redirect:/site/list?pageNo=1";
	}
	
	//	일정 전체조회하기(전면 캘린더 도입)
	@RequestMapping(value="/schedule/mylist", method=RequestMethod.GET)
	public String selectAllTravle(@RequestParam int memberNo, Model model){
		model.addAttribute("result", service.getAllTravle(memberNo));
		logger.info("캘린더:{}", service.getAllTravle(memberNo));
		return "schedule/calendar";
	}
	//	일정관련 전체조회(캘린더형식x)
	@RequestMapping(value="/schedule/list", method=RequestMethod.GET)
	public String getAllSchedule(@RequestParam int memberNo, @RequestParam(defaultValue="1")int pageNo, Model model){
		model.addAttribute("result", service.findAllSchedule(pageNo, memberNo));
		return "schedule/schedulelist";
	}
	//	일정관련 내용 삭제하기
	@RequestMapping(value="schedule/delete/{travlescheduleNo}", method=RequestMethod.GET)
	public String deleteSchedule(@PathVariable int travlescheduleNo, HttpSession session){
		int memberNo= (Integer)session.getAttribute("memberNo");
		service.deleteSchedule(travlescheduleNo, memberNo);
		return "redirect:/";
	}
}
