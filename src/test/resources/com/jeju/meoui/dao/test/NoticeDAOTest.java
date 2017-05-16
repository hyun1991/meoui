package com.jeju.meoui.dao.test;

import static org.junit.Assert.*;

import java.sql.*;
import java.text.*;
import java.util.*;

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
	public void selectNotice(){
		System.out.println(dao.selectNotice(1));
	}

}
