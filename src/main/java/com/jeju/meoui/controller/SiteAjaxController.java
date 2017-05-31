package com.jeju.meoui.controller;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.ui.*;
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
	
	
	// 관광지 상세
	// 관광지 이름으로 검색
//	@RequestMapping(value="/site/details" , method= {RequestMethod.GET, RequestMethod.POST})
	public Site detailsSite(int siteNo , HttpSession session){
			session.setAttribute("siteNo", siteNo);
		    return null;
	}
}
