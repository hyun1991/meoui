package com.jeju.meoui.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Service
public class AreaService {
	@Autowired
	private AreaDAO dao;
	
	// 1. 지역 추가
	public void createArea(Area area){
		int areaNo=dao.maxAreaNo();
		dao.insertArea(area);
	}
	
	// 2. 지역 수정
	public void modifyArea(Area area){
		dao.updateArea(area);
	}
	
	// 3. 지역 전체 삭제
	public void deleteArea(String areaName){
		dao.deleteArea(areaName);
	}
	
	// 4. 지역 관광지 삭제
	public void deleteAreaBySite(int siteNo){
		dao.deleteSiteArea(siteNo);
	}
	
	// 5. 지역별 관광지 검색
	public HashMap<String, Object> selectSiteByArea(String areaName,int pageNo){
		int cnt = dao.areaCount();
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		List<Area> list = dao.selectSiteByArea(areaName,pagination.getStartRow(), pagination.getLastRow());
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", list);
		return map;
	}
}
