package com.jeju.meoui.dao.test;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.dao.test.*;
import com.jeju.meoui.vo.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("context.xml")
public class NoticeCommentDAOTest {
	@Autowired
	private NoticeCommentDAO dao;
	//@Test// 글등록 test 성공
	public void insertCommentTest(){
		NoticeComment noticeComment = new NoticeComment();
		noticeComment.setNoticeCommentContent("test65");
		noticeComment.setMemberNo(65);
		noticeComment.setNoticeNo(60);
		dao.insertComment(noticeComment);
	}
	//@Test// 게시글에 달린 댓글 조회 성공
	public void selectCommentListTest(){
		System.out.println(dao.selectCommentList(1));
	}
	//@Test// 댓글 번호로 공지게시판 번호 조회 성공
	public void selectNoticeCommentNoTest(){
		System.out.println(dao.selectNoticeCommentNo(41));
	}
	@Test
	public void delteTest(){
		int memberNo= 41;
		int noticeCommentNo= 1;
		dao.deleteComment(noticeCommentNo, memberNo);
	}
}
