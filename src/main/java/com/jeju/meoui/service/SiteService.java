package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.jeju.meoui.dao.*;
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
	@Autowired
	private TicketDAO tDao;
	@Autowired
	private AccommodationDAO acDao;
	@Autowired
	private MemberDAO mDao;
	
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
	public void modifySite(Site site , Area area ){
		dao.updateSite(site);
		area.setSiteNo(site.getSiteNo());
		aDao.updateArea(area);
	}
	
	// 3.관광지 삭제
	@Transactional
	public void removeSite( int siteNo , Area area , Site site){
		commentdao.deleteAllSiteComment(siteNo);
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
	public HashMap<String, Object> selectSiteByNo(int siteNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		Site site= dao.selectSiteByNo(siteNo);
		List<SiteComment> comment= commentdao.selectSiteCommetn(siteNo);
		logger.info("주차정보:{}", site.getSitePark());
		if(site.getSitePark()==1)
			site.setPark("주차가능");
		else
			site.setPark("주차 불가능");
		logger.info("주차정보:{}", site.getPark());
		for(SiteComment cm: comment){
			if(cm.getMemberNo()!=0){
				List<Member>mList= mDao.findAllMemberNo(cm.getMemberNo());
				logger.info("고객정보:{}", mList);
				map.put("member", mList);
			}
		}
		List<Accommodation>list= acDao.findBySiteNo(siteNo);
		map.put("site", site);
		map.put("list", list);
		map.put("comment", comment);
		return map;
	}
	
	//	8.최근업로드된 메인페이지 노출용 관광명소 조회
	public HashMap<String, Object>findNewSite(){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("list", dao.fineNewSite());
		return map;
	}
	//	9. 인근 펜션정보&관광명소 상세정보 조회하기
	public HashMap<String, Object> getBySiteDetail(int siteNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		Site site= dao.selectSiteByNo(siteNo);
		List<SiteComment> comment= commentdao.selectSiteCommetn(siteNo);
		logger.info("주차정보:{}", site.getSitePark());
		if(site.getSitePark()==1)
			site.setPark("주차가능");
		else
			site.setPark("주차 불가능");
		logger.info("주차정보:{}", site.getPark());
		for(SiteComment cm: comment){
			if(cm.getMemberNo()!=0){
				List<Member>mList= mDao.findAllMemberNo(cm.getMemberNo());
				logger.info("고객정보:{}", mList);
				map.put("member", mList);
			}
		}
		List<Accommodation>list= acDao.findBySiteNo(siteNo);
		map.put("site", site);
		map.put("list", list);
		map.put("comment", comment);
		return map;
	}
}
