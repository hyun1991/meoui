package com.jeju.meoui.controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.beans.propertyeditors.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class ReserveController {
	@Autowired
	private ReserveService service;
	
	@RequestMapping(value="/reserve/join", method=RequestMethod.GET)
	public String createReserve(@RequestParam int roomPrice, HttpSession session){
		session.setAttribute("roomPrice", roomPrice);
		return "reserve/join";
	}
	@RequestMapping(value="/reserve/join", method=RequestMethod.POST)
	public ResponseEntity<String> createReserve(@ModelAttribute Reserve reserve, HttpSession session){
		int memberNo= (Integer)session.getAttribute("memberNo");
		int ownerNo= (Integer)session.getAttribute("ownerNo");
		reserve.setMemberNo(memberNo);
		reserve.setOwnerNo(ownerNo);
		ReserveDetails details= new ReserveDetails();
		details.setAccommodationNo((Integer)session.getAttribute("accommodationNo"));
		details.setRoomNo((Integer)session.getAttribute("roomNo"));
		details.setReserveTotalPrice(reserve.getReservePrice());
		service.createReserve(reserve, details);
		session.removeAttribute("roomPrice");
		session.removeAttribute("ownerNo");
		session.removeAttribute("accommodationNo");
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	@InitBinder
	public void initBinder(WebDataBinder binder)	{
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		//	java.Date.util에 대하여 binder를 한다.
		binder.registerCustomEditor(Date.class, "checkIn", new CustomDateEditor(sdf, false));
		binder.registerCustomEditor(Date.class, "checkOut", new CustomDateEditor(sdf, false));
	}	
}
