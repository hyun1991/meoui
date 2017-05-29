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
	public String insertSite( Site site, Area area, HttpSession session , @RequestParam("img") MultipartFile siteImg  ){
		int usersNo = (Integer)session.getAttribute("usersNo");
		site.setUsersNo(usersNo);
		String fileName = UploadUtil.storeAndGetFileName(siteImg, ctx, path);
		site.setSiteImg(fileName);
		service.createSite(site, area);
		return "redirect:/site/list?pageNo=1";
	}
	/*
	 * String fileName= UploadUtil.storeAndGetFileName(roomImg, ctx, path);
		room.setAccommodationNo(accommodationNo);
		ri.setAccommodationNo(accommodationNo);
		ri.setRoomImg(fileName);
		logger.info("객실이미지1:{}", ri);
		service.createRoom(room, ri);
	 */

	// 관광지 수정 폼
	@RequestMapping(value="/site/update/{siteNo}", method=RequestMethod.GET)
	public String updateSite(){
		return "site/update/{siteNo}";
	}
	
	// 관광지 수정 성공
	@RequestMapping(value="/site/update/{siteNo}" , method=RequestMethod.POST)
	public String updateSitd(Site site, Area area, HttpSession session, @RequestParam("img") MultipartFile siteImg){
		//int siteNo = (Integer)session.getAttribute("siteNo");
		String fileName= UploadUtil.storeAndGetFileName(siteImg, ctx, path);
		//site.setSiteNo(siteNo);
		service.modifySite(site);
		return "redirect:/site/list?pageNo=1";
	}
	
	// 관광지 삭제
	
	@RequestMapping(value="/site/delete/{siteName}", method=RequestMethod.GET)
	public String deleteSite(@PathVariable String siteName ){
		service.removeSite(siteName);
		return "redirect:/site/list?pageNo=1";
	}
	
	// 관광지 전체 리스트
	@RequestMapping(value="/site/list" , method=RequestMethod.GET)
	public String allSite(Model model ,@RequestParam(defaultValue="1") int pageNo){
		logger.info("pageNo:{}", pageNo);
		model.addAttribute("result", service.selectAllSite(pageNo));
		return "site/resultList";
	}
	// 관광지 전체 리스트(관리자용)
	@RequestMapping(value="/admin/site/list" , method=RequestMethod.GET)
	public String allSiteAdmin(Model model ,@RequestParam(defaultValue="1") int pageNo){
		logger.info("pageNo:{}", pageNo);
		model.addAttribute("result", service.selectAllSite(pageNo));
		return "admin/siteList";
	}
	
	
	
	// 상세보기
//	@RequestMapping(value="/site/details/{siteNo}", method=RequestMethod.GET)
	public String selectStieDetails(@PathVariable int siteNo, Model model,  HttpSession session){
		session.setAttribute("siteNo", siteNo);
		model.addAttribute("site",service.selectSiteByNo(siteNo));
		logger.info("뭐라찍히냐:{}", siteNo);
	     return "site/details";
	}	
	

/*
 */
	
	
	/*
	//이름으로 검색
	@RequestMapping(value="/site/view", method=RequestMethod.GET)
	public String selectSiteNameForm(HttpSession session, @RequestParam String siteName){
		session.setAttribute("siteName", siteName);
		return "/site/view";
	}
	
	//이름으로 검색 뷰
	@RequestMapping(value="/site/view", method=RequestMethod.POST)
	public String selectsiteName(Model model, HttpSession session, String siteName){
		String siteName1 = (String)session.getAttribute("siteName");
		model.addAttribute(service.selectSiteByName(siteName1));
		logger.info("사이트에서보는 {} :", siteName1);
		return "redirect:/site/list";
	}
	*/
	
	
	
	
}
