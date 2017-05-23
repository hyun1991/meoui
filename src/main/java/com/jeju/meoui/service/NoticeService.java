package com.jeju.meoui.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.dao.test.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;
@Service
public class NoticeService {
	@Autowired
	private NoticeDAO dao;
	@Autowired
	private NoticeCommentDAO cdao;
	//1. 공지게시판 작성
	public void createNotice(Notice notice){
		dao.insertNotice(notice);
	}
	//2. 공지게시판 갱신
    public void modifyNotice(Notice notice){
    	dao.updateNotice(notice);
    }
    //3. 공지게시판 삭제 (달린 댓글 함께 삭제)
    @Transactional
    public void removeNotice(int noticeNo){
    	cdao.deleteAllComment(noticeNo);
        dao.deleteNotice(noticeNo);
    }
  //4. 공지게시판 목록 리스트 조회(폐이지 별)
    public HashMap<String,Object> getByNotice(int pageNo){
    int cntOfRow = dao.findByMax();
    Pagination p = PagingUtil.getPagination(pageNo, cntOfRow);
    List<Notice> list = dao.selectNoticeList(p.getStartRow(), p.getLastRow());
    HashMap<String, Object>map= new HashMap<String, Object>();
    map.put("pagination", p);
    map.put("list", list);
    return map;
    }
    //5. 공지게시판 상세 조회(달린 댓글 조회)
    @Transactional
     public HashMap<String,Object>findByNotice(int noticeNo){
     dao.incrementCnt(noticeNo);
     HashMap<String, Object> map = new HashMap<String, Object>();
     map.put("nlist", dao.selectNotice(noticeNo));
     map.put("nclist", cdao.selectCommentList(noticeNo));
     return map;
     }

}
