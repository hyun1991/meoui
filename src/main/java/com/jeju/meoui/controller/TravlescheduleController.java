package com.jeju.meoui.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class TravlescheduleController {
	@RequestMapping(value="/cal/test", method=RequestMethod.GET)
	public String getTest(){
		return "schedule/calendar";
	}
}
