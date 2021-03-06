package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	//1. 공지게시판 작성
	public void insertNotice(Notice notice){
		template.insert("NoticeMapper.insertNotice", notice);
	}
	//2.공지게시판 상세조회
	public Notice selectNotice(int noticeNo){
		return template.selectOne("NoticeMapper.selectNotice", noticeNo);
	}
	//3.공지게시판 리스트 조회
	public List<Notice> selectNoticeList(int startRow, int lastRow){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", startRow);
		map.put("end", lastRow);
		return template.selectList("NoticeMapper.selectNoticeList",map);
	}
	//4. 공지게시글 갱신 (글제목 과 글내용 수정 가능)
   public void updateNotice(Notice notice){
	   template.update("NoticeMapper.updateNotice", notice);
   }
   //5. 공지게시글 삭제
   public void deleteNotice(int noticeNo){
	   template.delete("NoticeMapper.deleteNotice", noticeNo);
   }
   //6.공지게시글 전체 개수 조회
   public int findByMax(){
	  return template.selectOne("NoticeMapper.findByMax");
   }
   
   //7. 공지게시글 조회수 증가
   public void incrementCnt(int noticeNo){
	   template.update("NoticeMapper.incrementCnt", noticeNo);
   }
   
}
