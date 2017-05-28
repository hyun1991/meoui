package com.jeju.meoui.controller;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jeju.meoui.service.MeetingBoardService;
import com.jeju.meoui.util.UploadUtil;
import com.jeju.meoui.vo.MeetingBoard;

@Controller
public class MeetingBoardController {

	@Autowired
	private MeetingBoardService service;
	@Autowired
	private ServletContext ctx;
	@Resource(name="path")
	private String path;

	private static final Logger logger= LoggerFactory.getLogger(MeetingBoardController.class);
	
	
		//모임게시판 글쓰기
		@RequestMapping(value="/meetingboard/create", method=RequestMethod.GET)
		public String insertMeetingBoardForm(){			
			System.out.println("s여기는 모임게시판 글쓰기 폼");
			return "meetingboard/create";
		}
		//모임게시판 글쓰기 완료
		@RequestMapping(value="/meetingboard/create", method=RequestMethod.POST)
		public String insertMeetingBoard(HttpSession session,
				@ModelAttribute MeetingBoard meetingBoard, 
				Model model, 
			@RequestParam("Img")MultipartFile meetingboardImg ){
			String fileName= UploadUtil.storeAndGetFileName(meetingboardImg, ctx, path);	
			
			int meetingNo = (Integer)session.getAttribute("meetingNo");
			int memberNo=(Integer)session.getAttribute("memberNo");				
			meetingBoard.setMeetingboardImg(fileName);			
			meetingBoard.setMemberNo(memberNo);
			meetingBoard.setMeetingNo(meetingNo);
			
			service.createMeetingBoard(meetingBoard);
			
			logger.info("모임게시판 글쓰는중: {} ", meetingNo);
			//글을 쓰고 난 후에 리스트 게시판으로 안가진다
			return "redirect:/meetingboard/list/"+meetingNo	;
		}
		// 모임게시판 전체 리스트(페이징)
		@RequestMapping(value="/meetingboard/list/{meetingNo}" , method=RequestMethod.GET)
		public String allSite(@PathVariable int meetingNo, Model model ,@RequestParam(defaultValue="1") int pageNo, HttpSession session ){
			session.setAttribute("meetingNo", meetingNo);
			
			model.addAttribute("result", service.selectAllMeetingBoard(pageNo, meetingNo));
			logger.info("모임게시판 미팅넘버: {}",meetingNo);
			logger.info("모임게시판 모델 : {}",model);
			
			return "meetingboard/list";
		}
		
		//모임게시판 글 보기
		@RequestMapping(value="/meetingboard/view/{meetingboardNo}", method=RequestMethod.GET)
		public String MeetingboardView(@PathVariable int meetingboardNo, Model model, HttpSession session){
			
			session.setAttribute("meetingboardNo", meetingboardNo);
			
			logger.info("모임게시판글보기meetingboardNo : {}", meetingboardNo);
			
			model.addAttribute("board", service.selectMeetingBoardView(meetingboardNo));
			
			return "meetingboard/view";
		}
	
		//모임게시판 삭제
		@RequestMapping(value="/meetingboard/delete/{meetingboardNo}", method=RequestMethod.POST)
		public String deleteMeetingboard(@PathVariable int meetingboardNo, HttpSession session){
			int meetingNo = (Integer)session.getAttribute("meetingNo");
			meetingboardNo=(Integer)session.getAttribute("meetingboardNo");
			//session.setAttribute("meetingboardNo", meetingboardNo);
			logger.info("모임게시판 삭제 meetingboardNo : {}", meetingboardNo);
			logger.info("모임게시판 삭제 meetingNo : {}", meetingNo);
			service.deleteMeetingBoard(meetingboardNo);
			//return "redirect:/meetingboard/list/"+meetingNo;
			return "redirect:/meetingboard/list/"+meetingNo;
		}
	
	asd
	
	
	/*//모임게시판 글쓰기
	@RequestMapping(value="metingboard/insert", method=RequestMethod.GET)
	public String insertMeetingBoardForm(){
		
		System.out.println("s여기는 모임게시판 글쓰기 폼");
		return "meetingboard/insert";
	}
	//모임게시판 글쓰기 완료
	@RequestMapping(value="meetingboard/insert", method=RequestMethod.POST)
	public String insertMeetingBoard(HttpSession session,@ModelAttribute MeetingBoard meetingBoard, Model model, 
			@RequestParam("Img")MultipartFile meetingboardImg ){
		String fileName= UploadUtil.storeAndGetFileName(meetingboardImg, ctx, path);	
		int meetingNo = (Integer)session.getAttribute("meetingNo");
		int memberNo=(Integer)session.getAttribute("memberNo");
		
		meetingBoard.setMeetingboardImg(fileName);
		meetingBoard.setMeetingNo(meetingNo);
		meetingBoard.setMemberNo(memberNo);
		service.createMeetingBoard(meetingBoard);
		
		
		return "redirect:/membermeeting/view";
	}
	*/
}
