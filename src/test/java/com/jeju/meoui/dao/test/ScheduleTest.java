package com.jeju.meoui.dao.test;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.jeju.meoui.dao.*;

@ContextConfiguration("context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ScheduleTest {
	@Autowired
	private TravlescheduleDAO dao;
	@Test
	public void scheduleTest(){
		dao.getBySchedule(180, 1, 10);
	}
}
