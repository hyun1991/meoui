package com.jeju.meoui.dao.test;

import java.util.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;
import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("context.xml")
public class MessageDAOTest {
	@Autowired
	private MessageDAO dao;
	//	메세지 발송 테스트
	/*insert into message(message_no, message_receive_id, message_send_id, message_title, message_content,
		message_date, message_receive_date, message_receive_check, member_no)values
		(#{messageNo}, #{messageReceiveId}, #{messageSendId}, #{messageTitle}, #{messageContent},
		sysdate, #{messageReceiveDate, jdbcType=DATE}, 0, #{memberNo})*/
	//	@Test
	//	성공
	public void insertTest(){
		dao.insertMessage(new Message("hanamana", "admin9999", "안녕하세요", "반갑습니다", 62));
	}
	//	@Test
	//	성공
	public void update(){
		int messageNo= 42;
		int memberNo= 62;
		dao.updateMessage(memberNo, messageNo);
	}
	//	@Test
	public void selectAll(){
		List<Message>list= dao.selectAllMessage(62);
		assertThat(list.size(), is(2));
	}
}
