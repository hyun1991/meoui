package com.jeju.meoui.controller;

import javax.annotation.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Controller
public class SiteController {
	public static final Logger logger = LoggerFactory.getLogger(SiteController.class);
	@Autowired
	private SiteService service;
	@Autowired
	private ServletContext ctx;
	@Resource(name="path")
	private String path;
	// 관광지 추가 폼
	@RequestMapping(value="/site/join", method=RequestMethod.GET)
	public String insertSite(){
		return "site/join";
	}
	
	// 관광지 추가 성공
	@RequestMapping(value="/site/join", method=RequestMethod.POST)
	public String insertSite( Site site, Area area, Ticket ticket, @RequestParam("img") MultipartFile siteImg){
		String fileName = UploadUtil.storeAndGetFileName(siteImg, ctx, path);
		service.createSite(site, area, ticket);
		return "redirect:/meoui";
	}
	
	// 관광지 수정 폼
	@RequestMapping(value="/site/update", method=RequestMethod.GET)
	public String updateSite(){
		return "site/update";
	}
	
	// 관광지 수정 성공
	@RequestMapping(value="/site/update" , method=RequestMethod.POST)
	public String updateSitd(Site site, Area area, Ticket ticket , @RequestParam("img") MultipartFile siteImg){
		String fileName= UploadUtil.storeAndGetFileName(siteImg, ctx, path);
		service.modifySite(site, area, ticket);
		return "redirect:/meoui";
	}
	
	// 관광지 삭제
	public String deleteSite(@PathVariable int siteNo , String siteName){
		service.removeSite(siteName, siteNo);
		return "users/home";
	}
	
	// 관광지 전체 리스트
	@RequestMapping(value="/site/list" , method=RequestMethod.GET)
	public String allSite(Model model ,@RequestParam(defaultValue="1") int pageNo){
		logger.info("pageNo:{}", pageNo);
		model.addAttribute("result", service.selectAllSite(pageNo));
		return "site/list";
	}
	
	// 관광지 이름으로 검색
	@RequestMapping(value="/site/view" , method=RequestMethod.GET)
	public String siteByName(Model model , @PathVariable String siteName){
		model.addAttribute("result", service.selectSiteByName(siteName));
		return "site/view";
	}
}
