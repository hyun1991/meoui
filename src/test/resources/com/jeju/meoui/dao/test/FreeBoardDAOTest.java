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
public class FreeBoardDAOTest {
	@Autowired
	private FreeBoardDAO dao;
	//@Test
	public void insertFreeBoardTest(){
		FreeBoard freeBoard = new FreeBoard();
		freeBoard.setFreeboardTitle("안녕하세요ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
		freeBoard.setFreeboardContent("같이놀러가요");
		freeBoard.setFreeboardNo(1);
		freeBoard.setFreeboardImg("suga.png");
		dao.insertFreeboard(freeBoard);
		}
		
	//@Test
	public void selectFreeboardTest() {
		System.out.println(dao.selectFreeboard(1));
	}
	@Test
	public void selectAllFreeboardTest() {
		System.out.println(dao.selectAllFreeboard(1, 5));
	}
}
