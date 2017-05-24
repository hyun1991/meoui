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
	@Autowired
	private MemberService mService;
	private static final Logger logger= LoggerFactory.getLogger(MessageController.class);
	
	//	쪽지 리스트 출력하기(미구현)
	@RequestMapping(value="/message/list", method=RequestMethod.GET)
	public String messageAllList(@RequestParam String memberId, Model model, @RequestParam(defaultValue="1") int pageNo){
		model.addAttribute("result", service.getAllMessage(memberId, pageNo));
		return "massage/myMassage";
	}
	//	쪽지 읽으면 읽은날짜와 수신자 읽은여부 업데이트(미구현)
	@RequestMapping(value="/message/update", method=RequestMethod.POST)
	public ResponseEntity<String> updateMessage(HttpSession session){
		String memberId= (String)session.getAttribute("memberId");
		int messageNo= Integer.parseInt((String)session.getAttribute("messageNo"));
		service.modifyMessage(memberId, messageNo);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	//	쪽지발송 완료(완료)
	@RequestMapping(value="/message/join", method=RequestMethod.POST)
	public ResponseEntity<String> joinMessage(@ModelAttribute Message message){
		logger.info("쪽지발송중입니다");
		int result= mService.checkId(message.getMessageReceiveId());
		if(result==1){
			service.createMessage(message);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		else
			return new ResponseEntity<String>("fail", HttpStatus.OK);
	}
	
	//	쪽지상세보기(미구현)
	@RequestMapping(value="/message/view")
	public String viewMessage(HttpSession session, Model model, @RequestParam String memberId, @RequestParam int messageNo){
		return null;
	}

}
