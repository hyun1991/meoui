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
public class RoomController {
	@Autowired
	private RoomService service;
	@Autowired
	private ServletContext ctx;
	@Resource(name="path")
	private String path;
	private static final Logger logger= LoggerFactory.getLogger(RoomController.class);
	//	객실, 객실이미지 추가하기(완료).
	@RequestMapping(value="/manage/room/join", method=RequestMethod.GET)
	public String insertRoom(){
		return "room/insert";
	}
	//	객실, 객실이미지 추가완료(완료)=> 다중업로드 구현필요합니다(아직 단일업로드...)
	@RequestMapping(value="/manage/room/join", method=RequestMethod.POST)
	public String insertRoom(HttpSession session, @ModelAttribute Room room, @RequestParam("img")MultipartFile roomImg, @RequestParam("img2")MultipartFile roomImg2, @RequestParam("img3")MultipartFile roomImg3){
		RoomImg ri= new RoomImg();
		int accommodationNo= (Integer)session.getAttribute("accommodationNo");
		String fileName= UploadUtil.storeAndGetFileName(roomImg, ctx, path);
		room.setAccommodationNo(accommodationNo);
		ri.setAccommodationNo(accommodationNo);
		ri.setRoomImg(fileName);
		logger.info("객실이미지1:{}", ri);
		service.createRoom(room, ri);
		if(roomImg2==null)
			return "redirect:/manage/home";
		else if(roomImg3==null)
			return "redirect:/manage/home";
		else if(roomImg==roomImg2)
			return "redirect:/manage/home";
		else if(roomImg==roomImg3)
			return "redirect:/manage/home";
		else if(roomImg2==roomImg3)
			return "redirect:/manage/home";
		RoomImg ri2= new RoomImg();
		String fileName2= UploadUtil.storeAndGetFileName(roomImg2, ctx, path);
		ri2.setAccommodationNo(accommodationNo);
		ri2.setRoomImg(fileName2);
		service.createRoomImg(ri2);
		logger.info("객실이미지2:{}", ri2);
		RoomImg ri3= new RoomImg();
		String fileName3= UploadUtil.storeAndGetFileName(roomImg3, ctx, path);
		ri3.setAccommodationNo(accommodationNo);
		ri3.setRoomImg(fileName3);
		service.createRoomImg(ri3);
		logger.info("객실이미지3:{}", ri3);
		session.removeAttribute("accommodaionNo");
		return "redirect:/manage/home";
	}
	//	객실, 객실이미지 정보 조회하기(accommodationNo받는다)(완료, 사용자단)
	@RequestMapping(value="/room/view/{accommodationNo}&{ownerNo}", method=RequestMethod.GET)
	public String viewRoom(@PathVariable int accommodationNo, Model model, HttpSession session, @PathVariable int ownerNo){
		session.setAttribute("ownerNo", ownerNo);
		//	예약완료후 ownerNo세션에서 제거한다.
		model.addAttribute("result", service.getByRoom(accommodationNo));
		return "room/view";
	}
	//	객실, 객실이미지 정보 조회하기(accommodationNo받는다)(완료, 관리자단)
	@RequestMapping(value="/menage/room/view/{accommodationNo}", method=RequestMethod.GET)
	public String ownerViewRoom(@PathVariable int accommodationNo, Model model){
		model.addAttribute("result", service.getByRoom(accommodationNo));
		return "room/view";
	}
}
