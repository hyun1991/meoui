package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class AccommodationCommentController {
	@Autowired
	private AccommodationCommentService service;
	private Logger logger= LoggerFactory.getLogger(AccommodationCommentService.class);
	//	숙박시설 댓글 추가하기
	@RequestMapping(value="/accommodationComment/insert", method=RequestMethod.POST)
	public String insertAccommodationComment(@ModelAttribute AccommodationComment comment, HttpSession session){
		logger.info("숙박시설 댓글 추가하기 시작");
		int accommodationNo=(Integer)session.getAttribute("accommodationNo");
		int memberNo= (Integer)session.getAttribute("memberNo");
		logger.info("숙박시설번호, 현재접속된 회원번호:{}", accommodationNo, memberNo);
		comment.setAccommodationNo(accommodationNo);
		comment.setMemberNo(memberNo);
		service.createAccommodationComment(comment);
		return "redirect:/accommodation/view/"+accommodationNo;
	}
/*
 * 	//	숙박시설 댓글 추가하기
	public void createAccommodationComment(AccommodationComment accommodationComment){
		dao.insertAccommodationComment(accommodationComment);
	}
	//	숙박시설 댓글 수정하기
	public void modifyAccommodationComment(AccommodationComment accommodationComment){
		dao.updateAccommodationComment(accommodationComment);
	}
	//	숙박시설 댓글 삭제하기
	public void removeAccommodationComment(int accommodationCommentNo, int memberNo){
		dao.deleteAccommodationComment(accommodationCommentNo, memberNo);
	}
 * */
}
