package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class SiteDAO {
	@Autowired
	private SqlSessionTemplate template;
	// 1.관광지 추가
	public void insertSite(Site site){
		template.insert("siteMapper.insertSite", site);
	}
	// 2.관광지 수정
	public void updateSite(Site site){
		template.update("siteMapper.updateSite" , site);
	}
	// 3.관광지 삭제
	public void deleteSite(int siteNo){
		template.delete("siteMapper.deleteSite", siteNo);
	}
	// 4.전체 관광지 리스트(페이징)
	public List<Site> selectAllSite(int startRow , int lastRow){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("start", startRow);
		map.put("last", lastRow);
		return template.selectList("siteMapper.selectAllSite", map);
	}
	// 5. 관광지 개수
	public int siteCount(){
		return template.selectOne("siteMapper.SiteCount");
	}
	
	// 6.이름으로 관광지 찾기
	public Site selectSiteByName(String siteName){
		return template.selectOne("siteMapper.selectSiteByName", siteName);
	}
	
	// 7.관광지 리스트
	public List<Site> selectSiteList(){
		return template.selectList("siteMapper.selectSiteList");
	}
	
	// 8.마지막 관광지 번호
	public int maxSiteNo(){
		return template.selectOne("siteMapper.selectMaxSiteNo");
	}
	
	// 9.관광지 상세
	public Site selectSiteByNo(int siteNo ){
		return template.selectOne("siteMapper.selectSiteByNo", siteNo);
	}
	//	10. 최근업로드된 관광명소 4개 노출
	public List<Site>fineNewSite(){
		return template.selectList("siteMapper.fineNewSite");
	}
}
