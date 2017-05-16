package com.jeju.meoui.dao.test;

import java.sql.*;
import java.text.*;

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
	
	@Test
	public void insertNoticeTest(){
		Notice notice = new Notice();
		notice.setNoticeTitle("test2");
		notice.setNoticeContent("test");
		notice.setNoticeCnt(0);
		notice.setUsersNo(1);
		dao.insertNotice(notice);
		}

}
