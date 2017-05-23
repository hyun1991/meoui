package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class ErrorController {
	@RequestMapping("/error404")
	public String error404Hanler(HttpServletResponse res, Model model) {
		res.setStatus(HttpServletResponse.SC_OK);
		model.addAttribute("msg", "페이지를 찾을 수 없습니다");
		return "/error/msg";
	}
}
