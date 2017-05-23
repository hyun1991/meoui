package com.jeju.meoui.service;

import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.dao.test.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Service
public class SiteService {
	private static final Logger logger = LoggerFactory.getLogger(SiteService.class);
	@Autowired
	private SiteDAO dao;
	@Autowired
	private AreaDAO aDao;
	@Autowired
	private TicketDAO tDao;
	@Autowired
	private SiteCommentDAO commentdao;
	
	// 1.관광지 추가
	public void createSite(Site site, Area area , Ticket ticket ){
		dao.insertSite(site);
		aDao.insertArea(area);
		tDao.insetTicket(ticket);
		
	}
	
	// 2.관광지 수정
	public void modifySite(Site site, Area area ,Ticket ticket ){
		dao.updateSite(site);
		aDao.updateArea(area);
		tDao.insetTicket(ticket);
	}
	
	// 3.관광지 삭제
	@Transactional
	public void removeSite(String siteName , int siteNo){
		dao.deleteSite(siteName);
		tDao.deleteTicket(siteNo);
		aDao.deleteSiteArea(siteNo);
		commentdao.deleteAllSiteComment(siteNo);
	}
	
	// 4.관광지 리스트
	public HashMap<String, Object> selectAllSite(int pageNo){
		System.out.println("페이징:"+pageNo);
		int cnt = dao.siteCount();
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		HashMap<String, Object>map= new HashMap<String, Object>();
		logger.info("스타트:{}", pagination.getStartRow());
		logger.info("스타트:{}", pagination.getLastRow());
		logger.info("dao:{}", dao.selectAllSite(pagination.getStartRow(), pagination.getLastRow()));
		map.put("list", dao.selectAllSite(pagination.getStartRow(), pagination.getLastRow()));
		map.put("pagination", pagination);
		return map;
		 
		
	}
	
	// 5.이름으로 관광지 조회
	public Site selectSiteByName(String siteName){
		return dao.selectSiteByName(siteName);
	}
}
