package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class SiteCommentController {
	@Autowired
	private SiteCommentService service;
	private Logger logger= LoggerFactory.getLogger(AccommodationCommentService.class);
	
	//	관광명소 댓글 추가하기
	@RequestMapping(value="/siteComment/insert", method=RequestMethod.POST)
	public String insertSiteComment(@ModelAttribute SiteComment comment, HttpSession session){
		int siteNo=(Integer)session.getAttribute("siteNo");
		int memberNo= (Integer)session.getAttribute("memberNo");
		comment.setSiteNo(siteNo);
		comment.setMemberNo(memberNo);
		service.createSiteComment(comment);
		return "redirect:/site/detail/"+siteNo;
	}
	//	댓글 삭제하기
	@RequestMapping(value="/siteComment/delete/{siteCommentNo}", method=RequestMethod.GET)
	public String deleteSiteComment(@PathVariable int siteCommentNo, HttpSession session){
		int memberNo= (Integer)session.getAttribute("memberNo");
		int siteNo= (Integer)session.getAttribute("siteNo");
		service.deleteSiteComment(siteCommentNo, memberNo);
		return "redirect:/site/detail/"+siteNo;
	}

}
