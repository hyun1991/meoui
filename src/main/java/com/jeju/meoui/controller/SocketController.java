package com.jeju.meoui.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class SocketController {
	@RequestMapping("/chat")
	public String viewChattingPage(){
		return "chatting/chat";
	}
}
