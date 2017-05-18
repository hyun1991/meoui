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
	
	//	숙박시설 추가하기 폼뷰
	@RequestMapping(value="/manage/accommodation/join", method=RequestMethod.GET)
	public String joinAccommodation(){
		return "accommodation/insert";
	}
	//	숙박시설 추가하기 완료
	@RequestMapping(value="/manage/accommodation/join", method=RequestMethod.POST)
	public String joinAccommodation(HttpSession session, Accommodation accommodation, @RequestParam String accommodationAddress1, @RequestParam String accommodationAddress2, @RequestParam("img") MultipartFile accommodationImg, @RequestParam("file")MultipartFile accommodationDirections, @RequestParam(defaultValue="40") int siteNo){
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
	//	숙박시설 페이지별 조회하기
	@RequestMapping(value="/accommodaion/list", method=RequestMethod.GET)
	public String selectAllAccommodation(Model model, @RequestParam(defaultValue="1") int pageNo){
		logger.info("숙박시설정보:{}", service.getAllAccommodation(pageNo));
		model.addAttribute("result", service.getAllAccommodation(pageNo));
		return "accommodation/attractionlist";
	}
	//	숙박시설 페이지별 오너번호별 조회하기getByOwnerNoAccommodation(int pageNo, int ownerNo)
	@RequestMapping(value="/manage/accommodaion/list", method=RequestMethod.GET)
	public String selectByOwnerNoAccommodaion(Model model, @RequestParam(defaultValue="1") int pageNo, HttpSession session){
		int ownerNo= (Integer)session.getAttribute("ownerNo");
		model.addAttribute("result", service.getByOwnerNoAccommodation(pageNo, ownerNo));
		return "owner/accommodationlist";
	}
	/*
	 * 
	 * 서비스단
	 * 
	 * 
	 * 
	//	숙박시설 수정하기
	public void modifyAccommodation(Accommodation accommodation){
		dao.updateAccommodation(accommodation);
	}
	//	숙박시설 삭제하기
	@Transactional
	public void deleteAccommodation(int accommodationNo){
		dao.deleteAccommodation(accommodationNo);
		commentDao.deleteAllAccommodationComment(accommodationNo);
	}
	//	숙박시설 페이지별 조회하기
	public HashMap<String, Object> getAllAccommodation(int pageNo){
		int cnt= dao.findByAccommodationMax();
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", dao.selectAllAccommodation(pagination.getStartRow(), pagination.getLastRow()));
		return map;
	}
	//	숙박시설 번호별 조회하기(상세보기)
	@Transactional
	public HashMap<String, Object> getByAccommodation(int accommodationNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		Accommodation accommodation= dao.findByAccommodation(accommodationNo);
		List<AccommodationComment> comment= commentDao.selectByAccommodationNo(accommodationNo);
		map.put("accommodation", accommodation);
		map.put("comment", comment);
		return map;
	}
	 * */
}
