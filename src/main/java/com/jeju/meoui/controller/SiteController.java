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
	private TicketService tservice;
	@Autowired
	private ServletContext ctx;
	@Resource(name="path")
	private String path;
	
	// 관광지 추가 폼
	@RequestMapping(value="/admin/site/join", method=RequestMethod.GET)
	public String insertSite(){
		return "site/join";
	}
	
	// 관광지 추가 성공
	@RequestMapping(value="/admin/site/join", method=RequestMethod.POST)
	public String insertSite( Site site, Area area, HttpSession session , @RequestParam("img") MultipartFile siteImg  ){
		int usersNo = (Integer)session.getAttribute("usersNo");
		site.setUsersNo(usersNo);
		String fileName = UploadUtil.storeAndGetFileName(siteImg, ctx, path);
		site.setSiteImg(fileName);
		service.createSite(site, area);
		return "redirect:/admin/site/list?pageNo=1";
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
	@RequestMapping(value="/admin/site/update", method=RequestMethod.GET)
	public String updateSite(){
		return "site/update";
	}
	
	// 관광지 수정 성공
	@RequestMapping(value="/admin/site/update" , method=RequestMethod.POST)
	public String updateSitd(Site site, Area area, HttpSession session, @RequestParam("img") MultipartFile siteImg){
		int siteNo = (Integer)session.getAttribute("siteNo");
		String fileName= UploadUtil.storeAndGetFileName(siteImg, ctx, path);
		site.setSiteImg(fileName);
		site.setSiteNo(siteNo);
		service.modifySite(site,area);
		return "redirect:/admin/site/list?pageNo=1";
	}
	
	// 관광지 삭제
	@RequestMapping(value="/admin/site/delete/{siteNo}", method=RequestMethod.GET)
	public String deleteSite(@PathVariable  int siteNo , Area area , Site site ,Ticket ticket ){
		service.removeSite(siteNo, area, site, ticket);
		logger.info("관광지삭제 : {}", siteNo);
		return "redirect:/admin/site/list?pageNo=1";
	}
	
	// 관광지 전체 리스트
	@RequestMapping(value="/site/list" , method=RequestMethod.GET)
	public String allSite(Model model ,@RequestParam(defaultValue="1") int pageNo){
		logger.info("pageNo:{}", pageNo);
		model.addAttribute("result", service.selectAllSite(pageNo));
		return "site/resultList";
	}
	// 제주시별 관광지 전체 리스트
	@RequestMapping(value="/site/list/jeju" , method=RequestMethod.GET)
	public String allSiteByJeju(Model model ,@RequestParam(defaultValue="1") int pageNo){
		model.addAttribute("result", service.selectAllSiteByJeju(pageNo));
		return "site/jejuList";
	}
	// 서귀포시별 관광지 전체 리스트
	@RequestMapping(value="/site/list/seoguipo" , method=RequestMethod.GET)
	public String allSiteBySeoguipo(Model model ,@RequestParam(defaultValue="1") int pageNo){
		model.addAttribute("result", service.selectAllSiteBySeoguipo(pageNo));
		return "site/seoguipoList";
	}
	// 관광지 전체 리스트(관리자용)
	@RequestMapping(value="/admin/site/list" , method=RequestMethod.GET)
	public String allSiteAdmin(Model model ,@RequestParam(defaultValue="1") int pageNo){
		logger.info("pageNo:{}", pageNo);
		model.addAttribute("result", service.selectAllSite(pageNo));
		return "admin/siteList";
	}
	
	
	
	// 상세보기
	@RequestMapping(value="/admin/site/details/{siteNo}", method=RequestMethod.GET)
	public String selectStieDetails(@PathVariable int siteNo, Model model,  HttpSession session){
		session.setAttribute("siteNo", siteNo);
		model.addAttribute("result",service.selectSiteByNo(siteNo));
		model.addAttribute("result1", tservice.findTicket(siteNo));
		logger.info("뭐라찍히냐:{}", siteNo);
	     return "site/details";
	}	
	
	// 관광명소 상세보기(사용자용)
	@RequestMapping(value="/site/detail/{siteNo}", method=RequestMethod.GET)
	public String selectBySite(@PathVariable int siteNo, Model model,  HttpSession session){
		session.setAttribute("siteNo", siteNo);
		model.addAttribute("site",service.getBySiteDetail(siteNo));
		model.addAttribute("ticket", tservice.findTicket(siteNo));
		return "site/mdetail";
	}	
	/*
	 * 	//	숙박시설 번호별 조회하기(숙박업주)(완료)
	@RequestMapping(value="/manage/accommodation/view/{accommodationNo}", method=RequestMethod.GET)
	public String viewOwnerAccommodation(Model model, @PathVariable int accommodationNo, HttpSession session){
		session.setAttribute("accommodationNo", accommodationNo);
		model.addAttribute("result", service.getByOwnerAccommodation(accommodationNo));
		return "owner/view";
	 * 
	 */

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
