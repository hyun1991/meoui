package com.jeju.meoui.controller;

import javax.annotation.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
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
	//	객실, 객실이미지 추가하기.
	@RequestMapping(value="/manage/room/join", method=RequestMethod.GET)
	public String insertRoom(){
		return "room/insert";
	}
	@RequestMapping(value="/manage/room/join", method=RequestMethod.POST)
	public String insertRoom(HttpSession session, @ModelAttribute Room room, @RequestParam("img")MultipartFile roomImg){
		RoomImg ri= new RoomImg();
		int accommodationNo= (Integer)session.getAttribute("accommodationNo");
		String fileName= UploadUtil.storeAndGetFileName(roomImg, ctx, path);
		room.setAccommodationNo(accommodationNo);
		ri.setAccommodationNo(accommodationNo);
		ri.setRoomImg(fileName);
		logger.info("객실이미지:{}", ri);
		session.removeAttribute("accommodaionNo");
		service.createRoom(room, ri);
		return "redirect:/manage/home";
	}
	
}
