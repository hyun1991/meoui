package com.jeju.meoui.controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.beans.propertyeditors.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@Controller
public class ReserveController {
	@Autowired
	private ReserveService service;
	private Logger logger= LoggerFactory.getLogger(ReserveController.class);

	//	객실예약 추가완료
	@RequestMapping(value="/reserve/join", method=RequestMethod.POST)
	public String createReserve(@ModelAttribute Reserve reserve, BindingResult result, HttpSession session){
		logger.info("객실예약하기 시작전");
		if(result.hasErrors()){
			logger.info("Date타입검증실패");
			service.createReserve(reserve, session);
		}
		logger.info("checktIn:{}", reserve.getCheckIn());
		logger.info("checktOut:{}", reserve.getCheckOut());
		service.createReserve(reserve, session);
		return "redirect:/accommodaion/list?pageNo=1";
	}
	@InitBinder
	public void initBinder(WebDataBinder binder)	{
		SimpleDateFormat sdf= new SimpleDateFormat("yy/mm/dd");
		binder.registerCustomEditor(Date.class, "checkIn", new CustomDateEditor(sdf, false));
		binder.registerCustomEditor(Date.class, "checkOut", new CustomDateEditor(sdf, false));
	}

}
