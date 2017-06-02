package com.jeju.meoui.controller;

import java.text.*;
import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SiteService service;
	@Autowired
	private AccommodationService acServier;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("result2", service.findNewSite());
		model.addAttribute("result", acServier.mainNewAccommodation());
		return "main-03";
	}
	
	@RequestMapping("/manage/home")
	public String home(){
		return "/owner/main";
	}
	@RequestMapping("/test2")
	public String test2(){
		return "main-01";
	}
	@RequestMapping("/admin/home")
	public String admin() {
		return "/admin/adminHome";
	}
	@RequestMapping("/test")
	public String test() {
		return "slide";
	}
	//	테스트용입니다.
	@RequestMapping("/sample")
	public String formTest(){
		return "sample";
	}
}
