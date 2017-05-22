package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class SiteDAO {
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
	public void deleteSite(String siteName){
		template.delete("siteMapper.deleteSite", siteName);
	}
	// 4.전체 관광지 리스트
	public List<Site> selectAllSite(){
		return template.selectList("siteMappger.selectAllSite");
	}
	// 5.이름으로 관광지 찾기
	public Site selectSiteByName(String siteName){
		return template.selectOne("siteMapper.selectSiteByName", siteName);
	}
}
