package com.jeju.meoui.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Controller
public class AreaController {
	@Autowired
	private AreaService service;
	// 지역 추가 폼
	@RequestMapping(value="/admin/site/insert", method=RequestMethod.GET)
	public String updateSite(){
		return "site/join";
	}
	// 관광지 추가 성공
	@RequestMapping(value="/admin/site/isnert" , method=RequestMethod.POST)
	public String updateSitd(@ModelAttribute Area area){
		service.createArea(area);
		return "redirect:/site/list?pageNo=1";
	}
}
