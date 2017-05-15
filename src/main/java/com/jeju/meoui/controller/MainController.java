package com.jeju.meoui.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {
	@RequestMapping("/")
	public String home() {
		return "home";
	}
}
