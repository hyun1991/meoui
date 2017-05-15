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
public class MemberDAOTest {
	@Autowired
	private MemberDAO dao;
	/*
	 * 
	1. 회원 추가하기(완료: 테스트 필요)
	2. 회원정보 수정하기(완료: 테스트 필요)
	3. 회원탈퇴(완료: 테스트 필요)
	4. 회원 아이디 조회하기(완료: 테스트 필요)
	5. 회원 비밀번호 조회하기(완료: 테스트 필요)
	6. 회원 별 정보조회(완료: 테스트 필요)
	7. 회원 아이디별 회원번호 조회하기(완료: 테스트 필요)
	8. 회원 로그인(완료: 테스트 필요)
	9. 회원 아이디 중복체크(완료: 테스트 필요)
	 * */
	//	회원 추가하기 테스트
	//	@Test
	public void insertTest(){
		dao.insertMember(new Member("admin", "1234", "임제현", "010", "인천", "test@naver.com", "백수", "남자", "운동"));
	}
	@Test
	public void selectAllTest(){
		List<Member>list= dao.selectAllMember();
		assertThat(list.size(), is(0));
	}
}
