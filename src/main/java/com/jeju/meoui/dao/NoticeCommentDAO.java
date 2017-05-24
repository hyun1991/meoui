package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;
@Repository
public class NoticeCommentDAO {
   @Autowired
	private SqlSessionTemplate template;
//1.공지게시판 댓글 작성	
   public void insertComment(NoticeComment noticeComment){
	   template.insert("NoticeCommentMapper.insertComment", noticeComment);
   }
 //2.공지게시글에 달린 댓글 조회
   public List<NoticeComment> selectCommentList(int noticeNo){
	   return template.selectList("NoticeCommentMapper.selectCommentList", noticeNo);
   }
 //3.공지게시판 댓글 갱신 (글내용 수정 가능)  
   public void updateComment(NoticeComment noticeComment){
	   template.update("NoticeCommentMapper.updateComment", noticeComment);
	 }
 //4.공지게시판 댓글 삭제 (단일 삭제)
   public void deleteComment(int noticeCommentNo, int memberNo){
	   HashMap<String, Object>map = new HashMap<String, Object>();
	   map.put("noticeCommentNo", noticeCommentNo);
	   map.put("memberNo", memberNo);
	   template.delete("NoticeCommentMapper.deleteComment",map);
   }

 //5.공지게시판 댓글 삭제 (전체 삭제)
   public void deleteAllComment(int noticeNo){
	   template.delete("NoticeCommentMapper.deleteAllComment", noticeNo);
   }
 //6. 공지사항 댓글 번호로 공지사항 게시글 번호 조회
   public int selectNoticeCommentNo(int noticeCommentNo){
	   return template.selectOne("NoticeCommentMapper.selectNoticeCommentNo", noticeCommentNo);
   }
}
