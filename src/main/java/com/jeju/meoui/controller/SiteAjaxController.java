package com.jeju.meoui.controller;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.vo.*;

@RestController
public class SiteAjaxController {
	public static final Logger logger = LoggerFactory.getLogger(SiteController.class);
	@Autowired
	private SiteService service;

	
	// 관광지 이름으로 검색
	@RequestMapping(value="/site/view" , method= {RequestMethod.GET, RequestMethod.POST})
	public Site siteByName(String siteName){
		return service.selectSiteByName(siteName);
		
	}

}
