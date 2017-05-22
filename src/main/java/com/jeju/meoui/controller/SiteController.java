package com.jeju.meoui.controller;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.jeju.meoui.service.*;

@Controller
public class SiteController {
	@Autowired
	private SiteService service;
	public static final Logger logger = LoggerFactory.getLogger(SiteController.class);
	
	// 관광지 추가 폼
	@RequestMapping(value="/site/join", method=RequestMethod.GET)
	public String insertSite(){
		return "site/join";
	}
	
	// 관광지 추가 성공
	@RequestMapping(value="/site/join", method=RequestMethod.POST)
	public String insertSite1(){
		return "redirect:/users/home";
	}
}
