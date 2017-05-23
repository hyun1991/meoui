package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.dao.test.*;
import com.jeju.meoui.vo.*;

@Service
public class SiteCommentService {
	private static final Logger logger = LoggerFactory.getLogger(SiteCommentService.class);
	@Autowired
	private SiteCommentDAO dao;
	
	// 관광지 댓글 추가
	public void createSiteComment(SiteComment sc){
		dao.insertSiteComment(sc);
	}
	
	// 관광지 댓글 수정
	public void modifySiteComent(SiteComment sc){
		dao.updateSiteComment(sc);
	}
	
	// 관광지 댓글 삭제
	public void deleteSiteComment(int siteNo, int memberNo){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("siteNo", siteNo);
		map.put("memberNo", memberNo);
		dao.deleteSiteComment(siteNo, memberNo);
	}
}
