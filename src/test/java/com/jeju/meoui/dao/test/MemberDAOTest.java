package com.jeju.meoui.dao.test;

import java.util.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.dao.test.*;
import com.jeju.meoui.vo.*;
import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("context.xml")
public class MemberDAOTest {
	@Autowired
	private MemberDAO dao;
	//	회원 추가하기 테스트(성공)
	//	@Test
	public void insertTest(){
		dao.insertMember(new Member("admin", "1234", "임제현", "010", "인천", "test@naver.com", "백수", "남자", "운동"));
	}
	//	@Test
	//	회원 리스트 조회하기(성공)
	public void selectAllTest(){
		//List<Member>list= dao.selectAllMember();
		//assertThat(list.size(), is(0));
	}
	//	@Test
	//	회원 아이디 탈퇴(성공)
	public void delete(){
		dao.deleteMember("admin");
		//List<Member>list= dao.selectAllMember();
		//assertThat(list.size(), is(0));
	}
	//	@Test
	public void selectList(){
		dao.insertMember(new Member("admin", "1234", "임제현", "010", "인천", "test@naver.com", "백수", "남자", "운동"));
		String memberId= "admin";
		dao.selectByMember(memberId);
	}
	@Test
	public void idcheck(){
		//dao.selectAllMember();
		String id= "admin";
		int result= dao.checkId(id);
		assertThat(result, is(1));
	}
}
