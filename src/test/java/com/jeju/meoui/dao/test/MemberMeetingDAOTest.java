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
public class MemberMeetingDAOTest {
	@Autowired
	private MemberMeetingDAO dao;
	@Test
	public void insertTest(){
		dao.insertMemberMeeting(new MemberMeeting("스쿠버다이빙", "test.jpg"));
	}
}
