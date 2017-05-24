package com.jeju.meoui.controller;

import java.io.*;

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
	
	//	쪽지 페이지별 리스트 출력하기(완료)
	@RequestMapping(value="/message/list", method=RequestMethod.GET)
	public String messageAllList(@RequestParam String messageReceiveId, Model model, @RequestParam(defaultValue="1") int pageNo){
		model.addAttribute("result", service.getAllMessage(messageReceiveId, pageNo));
		return "message/myMassage";
	}

	//	쪽지발송 완료(완료)
	@RequestMapping(value="/message/join", method=RequestMethod.POST)
	public String joinMessage(@RequestParam String messageSendId, @RequestParam String messageReceiveId, @RequestParam String messageTitle,
			@RequestParam String messageContent, @RequestParam int memberNo, HttpSession session,HttpServletResponse response) throws IOException{
		logger.info("쪽지발송중입니다");
		String memberId= (String)session.getAttribute("memberId");
		Message message= new Message(messageReceiveId, messageSendId, messageTitle, messageContent, memberNo);
		int result= mService.checkId(message.getMessageReceiveId());
		if(result==1){
			service.createMessage(message);
			return "redirect:/message/list?messageReceiveId="+memberId+"&pageNo=1"; 
		}
		else{
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('수신인이 확인되지 않습니다.'); history.go(-1);</script>");
			out.flush();
			out.close();
			return null;
		}
	}
	
	//	쪽지상세보기(완료)
	@RequestMapping(value="/message/view", method=RequestMethod.GET)
	public String viewMessage(HttpSession session, Model model, @RequestParam int messageNo){
		session.setAttribute("messageNo", messageNo);
		model.addAttribute("result", service.getByMessage(messageNo));
		return "message/view";
	}
	
	//	쪽지삭제하기(완료)
	@RequestMapping(value="/message/delete/{messageNo}", method=RequestMethod.GET)
	public String deleteMessage(@PathVariable int messageNo, HttpSession session){
		String memberId= (String)session.getAttribute("memberId");
		service.removeMessage(messageNo);
		return "redirect:/message/list?messageReceiveId="+memberId+"&pageNo=1";
	}

}
