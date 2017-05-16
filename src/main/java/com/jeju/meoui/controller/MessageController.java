package com.jeju.meoui.controller;

import javax.websocket.server.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;

@Controller
public class MessageController {
	@Autowired
	private MessageService service;
	private static final Logger logger= LoggerFactory.getLogger(MessageController.class);
	
	//	쪽지 리스트 출력하기
	@RequestMapping(value="/message/list/{memberId}", method=RequestMethod.GET)
	public String MessageAllList(@PathVariable String memberId, Model model){
		model.addAttribute("result", service.getAllMessage(memberId));
		return "messageList";
	}
	/*
	 * 	//	쪽지발송하기
	public void createMessage(Message message){
		dao.insertMessage(message);
	}
	//	쪽지수정하기
	public void modifyMessage(int memberId, int messageNo){
		dao.updateMessage(memberId, messageNo);
	}
	//	쪽지리스트 조회하기
	public List<Message> getAllMessage(int memberId){
		return dao.selectAllMessage(memberId);
	}
	// 쪽지삭제하기
	public void removeMessage(int memberId, int messageNo){
		dao.deleteMessage(memberId, messageNo);
	}
	//	쪽지상세보기
	public Message getByMessage(int memberId, int messageNo){
		return dao.selectByMessage(memberId, messageNo);
	}
	 * */
}
