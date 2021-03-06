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
public class AccommodationController {
	private static final Logger logger= LoggerFactory.getLogger(AccommodationController.class);
	@Autowired
	private AccommodationService service;
	@Autowired
	private ServletContext ctx;
	@Resource(name="path")
	private String path;
	
	//	숙박시설 추가하기 폼뷰(완료)
	@RequestMapping(value="/manage/accommodation/join", method=RequestMethod.GET)
	public String joinAccommodation(Model model){
		model.addAttribute("result", service.createAccommodationStart());
		return "accommodation/insert";
	}
	//	숙박시설 추가하기 완료(완료)
	@RequestMapping(value="/manage/accommodation/join", method=RequestMethod.POST)
	public String joinAccommodation(HttpSession session, Accommodation accommodation, @RequestParam String accommodationAddress1, @RequestParam String accommodationAddress2, @RequestParam("img") MultipartFile accommodationImg, @RequestParam("file")MultipartFile accommodationDirections, @RequestParam int siteNo){
		int ownerNo= (Integer)session.getAttribute("ownerNo");
		String accommodationAddress= accommodationAddress1+accommodationAddress2;
		accommodation.setSiteNo(siteNo);
		accommodation.setOwnerNo(ownerNo);
		accommodation.setAccommodationAddress(accommodationAddress);
		logger.info("대표이미지 파일명:{}", accommodationImg.getOriginalFilename());
		logger.info("오시는길 파일명:{}", accommodationDirections.getOriginalFilename());
		String fileName1= UploadUtil.storeAndGetFileName(accommodationImg, ctx, path);
		String fileName2= UploadUtil.storeAndGetFileName(accommodationDirections, ctx, path);
		logger.info("대표이미지 파일명(변경):{}", fileName1);
		logger.info("오시는길 파일명(변경):{}", fileName2);
		accommodation.setAccommodationImg(fileName1);
		accommodation.setAccommodationDirections(fileName2);
		service.createAccommodation(accommodation, session);
		return "redirect:/manage/room/join";
	}
	//	숙박시설 페이지별 조회하기(완료)
	@RequestMapping(value="/accommodaion/list", method=RequestMethod.GET)
	public String selectAllAccommodation(Model model, @RequestParam(defaultValue="1") int pageNo){
		logger.info("숙박시설정보:{}", service.getAllAccommodation(pageNo));
		model.addAttribute("result", service.getAllAccommodation(pageNo));
		return "accommodation/list";
	}
	//	숙박시설 페이지별 조회하기(관리자용: 완료)
	@RequestMapping(value="/admin/accommodaion/list", method=RequestMethod.GET)
	public String selectAllAdminAccommodation(Model model, @RequestParam(defaultValue="1") int pageNo){
		model.addAttribute("result", service.getAllAccommodation(pageNo));
		return "admin/aclist";
	}
	
	//숙박시설 페이지별 조회하기(완료)<테스트용>
	@RequestMapping(value="/accommodaion/listTest", method=RequestMethod.GET)
	public String selectAllAccommodationTest(Model model, @RequestParam(defaultValue="1") int pageNo){
		logger.info("숙박시설정보:{}", service.getAllAccommodation(pageNo));
		model.addAttribute("result", service.getAllAccommodation(pageNo));
		return "accommodation/listTest";
	}
		
	//	숙박시설 페이지별 오너번호별 조회하기(완료)
	@RequestMapping(value="/manage/accommodation/list", method=RequestMethod.GET)
	public String selectByOwnerNoAccommodaion(Model model, @RequestParam(defaultValue="1") int pageNo, HttpSession session){
		int ownerNo= (Integer)session.getAttribute("ownerNo");
		model.addAttribute("result", service.getByOwnerNoAccommodation(pageNo, ownerNo));
		return "owner/accommodationlist";
	}

	//	숙박시설 삭제하기(완료)
	@RequestMapping(value="/manage/accommodation/delete/{accommodationNo}", method=RequestMethod.GET)
	public String deleteAccommodation(@PathVariable int accommodationNo){
		service.deleteAccommodation(accommodationNo);
		return "owner/main";
	}
	//	숙박시설 번호별 조회하기(사용자)(완료)
	@RequestMapping(value="/accommodation/view/{accommodationNo}", method=RequestMethod.GET)
	public String viewAccommodation(Model model, @PathVariable int accommodationNo, HttpSession session){
		session.setAttribute("accommodationNo", accommodationNo);
		int memberNo= (Integer)session.getAttribute("memberNo");
		model.addAttribute("result", service.getByAccommodation(accommodationNo, memberNo));
		return "accommodation/view";
	}
	//	숙박시설 번호별 조회하기(숙박업주)(완료)
	@RequestMapping(value="/manage/accommodation/view/{accommodationNo}", method=RequestMethod.GET)
	public String viewOwnerAccommodation(Model model, @PathVariable int accommodationNo, HttpSession session){
		session.setAttribute("accommodationNo", accommodationNo);
		model.addAttribute("result", service.getByOwnerAccommodation(accommodationNo));
		return "owner/view";
	}
	//	숙박시설 번호별 조회하기(관리자)(완료)
	@RequestMapping(value="/admin/accommodation/view/{accommodationNo}", method=RequestMethod.GET)
	public String viewAdminAccommodation(Model model, @PathVariable int accommodationNo, HttpSession session){
		session.setAttribute("accommodationNo", accommodationNo);
		model.addAttribute("result", service.getByOwnerAccommodation(accommodationNo));
		return "admin/acview";
	}
	//	숙박시설 수정하기 폼뷰(숙박업주용)
	@RequestMapping(value="/manage/accommodation/update", method=RequestMethod.GET)
	public String updateOwnerAccommodation(Model model){
		model.addAttribute("result", service.createAccommodationStart());
		return "accommodation/updateForm";
	}
	//	숙박시설 수정하기(완료)
	@RequestMapping(value="/manage/accommodation/update", method=RequestMethod.POST)
	public String updateOwnerAccommodation(HttpSession session,@ModelAttribute Accommodation accommodation, @RequestParam String accommodationAddress1, @RequestParam String accommodationAddress2, @RequestParam("img") MultipartFile accommodationImg,@RequestParam("file")MultipartFile accommodationDirections, @RequestParam int siteNo){	
		int accommodationNo= (Integer)session.getAttribute("accommodationNo");
		String accommodationAddress= accommodationAddress1+accommodationAddress2;
		String fileName1= UploadUtil.storeAndGetFileName(accommodationImg, ctx, path);
		String fileName2= UploadUtil.storeAndGetFileName(accommodationDirections, ctx, path);
		int ownerNo= (Integer)session.getAttribute("ownerNo");
		accommodation.setAccommodationNo(accommodationNo);
		accommodation.setSiteNo(siteNo);
		accommodation.setOwnerNo(ownerNo);
		accommodation.setAccommodationAddress(accommodationAddress);
		accommodation.setAccommodationImg(fileName1);
		accommodation.setAccommodationDirections(fileName2);
		service.modifyAccommodation(accommodation);
		return "redirect:/manage/home";
	}
}
