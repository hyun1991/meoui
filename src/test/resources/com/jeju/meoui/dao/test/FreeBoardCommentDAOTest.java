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
public class FreeBoardCommentDAOTest {
	@Autowired
	private FreeBoardCommentDAO commentDAO;
	private FreeBoardDAO dao;
	@Test
	public void insertCommentTest() {
		FreeBoardComment comment = new FreeBoardComment();
		comment.setFreeboardCommentContent("우와 멋져");
		comment.setFreeboardCommentNo(1);
		dao.selectFreeboard(43);
		commentDAO.insertComment(comment);
	}
}
