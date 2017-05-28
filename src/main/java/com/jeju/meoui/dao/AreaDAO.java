package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class AreaDAO {
	@Autowired
	private SqlSessionTemplate template;
	// 지역추가 
	public void insertArea(Area area){
		template.insert("AreaMapper.insertArea",area);
	}
	
	// 관광지 상세주소 수정
	public void updateArea(Area area){
		template.update("AreaMapper.updateArea", area);
	}
	
	// 지역 삭제
	public void deleteArea(String areaName){
		template.delete("AreaMapper.deleteArea", areaName);
	}
	
	// 지역 관광지 삭제
	public void deleteSiteArea(int siteNo){
		template.delete("AreaMapper.deleteSiteArea" , siteNo);
	}
	
	// 지역별 관광지 조회
	public List<Area> selectSiteByArea(String areaName, int startRow , int lastRow){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("areaName", areaName);
		map.put("start", startRow);
		map.put("last", lastRow);
		return template.selectList("AreaMapper.selectSiteByArea", map);
		
	}
	
	// 마지막 지역번호 조회
	public int maxAreaNo(){
		return template.selectOne("AreaMapper.selectMaxAreaNo");
	}
	
	// 지역별 관광지 개수
	public int areaCount(){
		return template.selectOne("siteMapper.SiteCount");
	}
}
