package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class SiteCommentDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	// 관광지 댓글 추가
	public void insertSiteComment(SiteComment sc){
		template.insert("siteCommentMapper.insertSiteComment", sc);
	}
	
	// 관광지 댓글 수정
	public void updateSiteComment(SiteComment sc){
		template.update("siteCommentMapper.updateSiteComment", sc);
	}
	
	// 관광지 댓글 삭제
	public void deleteSiteComment(int siteNo, int memberNo){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("siteNo", siteNo);
		map.put("memberNo", memberNo);
		template.delete("siteCommentMapper.deleteSiteComment", map);
	}
	
	// 관광지 댓글 전체삭제
	public void deleteAllSiteComment(int siteNo){
		template.delete("siteCommentMapper.deleteAllSiteComment", siteNo);
	}
	
	// 관광지 댓글 조회
	
}
