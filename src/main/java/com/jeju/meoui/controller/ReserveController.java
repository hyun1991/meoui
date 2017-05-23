package com.jeju.meoui.controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.beans.propertyeditors.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Controller
public class ReserveController {
	@Autowired
	private ReserveService service;
	private Logger logger= LoggerFactory.getLogger(ReserveController.class);

	//	객실예약 추가완료
	@RequestMapping(value="/reserve/join", method=RequestMethod.POST)
	public ResponseEntity<String> createReserve(@ModelAttribute Reserve reserve, BindingResult result, @RequestParam int roomNo, HttpSession session){
		logger.info("객실예약하기 시작전");
		session.setAttribute("roomNo", roomNo);
		if(result.hasErrors()){
			logger.info("Date타입검증실패");
		}
		logger.info("checktIn:{}", reserve.getCheckIn());
		logger.info("checktOut:{}", reserve.getCheckOut());
		service.createReserve(reserve, session);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	@InitBinder
	public void initBinder(WebDataBinder binder)	{
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.sql.Date.class, "checkIn", new CustomDateEditor(sdf, false));
		binder.registerCustomEditor(java.sql.Date.class, "checkOut", new CustomDateEditor(sdf, false));
	}
	//	팝업페이지
	@RequestMapping(value="/reserve/event/cash", method=RequestMethod.GET)
	public String cashEvent(){
		return "room/event"; 
	}
}
