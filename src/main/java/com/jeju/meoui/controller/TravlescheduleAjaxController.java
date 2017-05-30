package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;

import com.google.gson.*;
import com.jeju.meoui.service.*;

@RestController
public class TravlescheduleAjaxController {
	@Autowired
	private TravlescheduleService service;
	private Logger logger= LoggerFactory.getLogger(TravlescheduleController.class);
	//	일정 전체조회하기 데이터 가져오기.
	@RequestMapping(value="/schedule/data", method=RequestMethod.GET)
	public String selectAllTravleData(HttpSession session, HttpServletResponse response){
		response.setContentType("text/html; charset=utf-8");
		int memberNo= (Integer)session.getAttribute("memberNo");
		return new Gson().toJson(service.getAllTravle(memberNo));
	}
}
