package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class SiteService {
	@Autowired
	private SiteDAO dao;
	private static final Logger logger = LoggerFactory.getLogger(SiteService.class);
	
	// 1.관광지 추가
	public void createSite(Site site){
		dao.insertSite(site);
	}
	
	// 2.관광지 수정
	public void modifySite(Site site){
		dao.updateSite(site);
	}
	
	// 3.관광지 삭제
	public void removeSite(String siteName){
		dao.deleteSite(siteName);
	}
	
	// 4.관광지 리스트
	public List<Site> selectAllSite(){
		return dao.selectAllSite();
	}
	
	// 5.이름으로 관광지 조회
	public Site selectSiteByName(String siteName){
		return dao.selectSiteByName(siteName);
	}
}
