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
	private SiteCommentDAO commentdao;
	
	// 1.관광지 추가
	public void createSite(Site site , Area area ){
		dao.insertSite(site);
		area.setAreaNo(aDao.maxAreaNo());
		area.setSiteNo(site.getSiteNo());
		aDao.insertArea(area);
		
		/*
		 * public void createRoom(Room room, RoomImg roomImg){
		dao.insertRoom(room);
		int roomNo= dao.selectByRoomNoMax();
		logger.info("객실번호:{}", roomNo);
		roomImg.setRoomNo(roomNo);
		roomImgDao.insertRoomImg(roomImg);
		 */
		
	}
	
	// 2.관광지 수정
	public void modifySite(Site site ){
		dao.updateSite(site);
	}
	
	// 3.관광지 삭제
	@Transactional
	public void removeSite( int siteNo , Area area , Site site){
		area.setSiteNo(site.getSiteNo());
		aDao.deleteSiteArea(siteNo);
		dao.deleteSite(siteNo);
		
	}
	
	// 4.관광지 리스트
	public HashMap<String, Object> selectAllSite(int pageNo){
		int cnt = dao.siteCount();
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		List<Site> list = dao.selectAllSite(pagination.getStartRow(), pagination.getLastRow());
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", list);
		return map;
	}
	
	
	// 6.이름으로 관광지 조회
	public Site selectSiteByName(String siteName){
		return dao.selectSiteByName(siteName);
	}
	
	// 7.관광지 상세
	public Site selectSiteByNo(int siteNo){
		return dao.selectSiteByNo(siteNo);
	}
}
