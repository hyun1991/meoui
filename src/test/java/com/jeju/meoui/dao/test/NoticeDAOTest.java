package com.jeju.meoui.dao.test;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("context.xml")
public class NoticeDAOTest {
	@Autowired
	private NoticeDAO dao;
    //@Test // 글등록 test 성공
	public void insertNoticeTest(){
		Notice notice = new Notice();
		notice.setNoticeTitle("test2");
		notice.setNoticeContent("test");
		notice.setUsersNo(1);
		dao.insertNotice(notice);
		}
	@Test //상세 조회 성공
	public void selectNoticeTest(){
		System.out.println(dao.selectNotice(1));
	}
	//@Test //공지사항 리스트 조회 성공
	public void selectNoticeListTest(){
		System.out.println(dao.selectNoticeList(1, 2));
	}
	//@Test//공지사항 글개수 조회 성공
	public void findByMaxTest(){
		System.out.println(dao.findByMax());
	}
	//@Test//공지사항 조회수 증가 성공
	public void incrementCnt(){
		dao.incrementCnt(46);
		System.out.println(dao.selectNotice(46));
	}
	

}
