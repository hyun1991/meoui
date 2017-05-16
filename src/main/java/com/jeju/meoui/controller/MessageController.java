package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class MessageController {
	@Autowired
	private MessageService service;
	private static final Logger logger= LoggerFactory.getLogger(MessageController.class);
	
	//	쪽지 리스트 출력하기(미구현)
	@RequestMapping(value="/message/list/{memberId}", method=RequestMethod.GET)
	public String messageAllList(@PathVariable String memberId, Model model){
		model.addAttribute("result", service.getAllMessage(memberId));
		return "messageList";
	}
	//	쪽지 읽으면 읽은날짜와 수신자 읽은여부 업데이트(미구현)
	@RequestMapping(value="/message/update", method=RequestMethod.POST)
	public ResponseEntity<String> updateMessage(HttpSession session){
		String memberId= (String)session.getAttribute("memberId");
		int messageNo= Integer.parseInt((String)session.getAttribute("messageNo"));
		service.modifyMessage(memberId, messageNo);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	//	쪽지발송 폼 (미구현)
	@RequestMapping(value="/message/join", method=RequestMethod.GET)
	public String joinMessage(){
		return "쪽지발송jsp";
	}
	//	쪽지발송 완료(미구현)
	@RequestMapping(value="/message/join", method=RequestMethod.POST)
	public String joinMessage(@ModelAttribute Message message){
		service.createMessage(message);
		return "redirect:/";		//	쪽지발송 후 redirect할 곳.
	}
	
	//	쪽지상세보기(미구현)
	@RequestMapping(value="/message/view")
	public String viewMessage(HttpSession session, Model model, @RequestParam String memberId, @RequestParam int messageNo){
		return null;
	}

}
