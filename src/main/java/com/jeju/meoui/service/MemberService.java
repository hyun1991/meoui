package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.controller.*;
import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;
	private static final Logger logger= LoggerFactory.getLogger(MemberService.class);
	//	1. 회원 추가하기
	public void createMember(Member member){
		dao.insertMember(member);
	}	
	//	2. 회원 수정하기
	public void modifyMember(Member member){
		dao.updateMember(member);
	}	
	//	3. 회원탈퇴
	public void removeMember(String memberId){
		dao.deleteMember(memberId);
	}
	//	4. 회원 아이디 조회하기
	public List<String> searchByMemberId(String memberName, String memberMail){
		List<String> list= dao.findByMemberId(memberName, memberMail);
		return list;
	}
	//	5. 회원 비밀번호 조회하기
	public String searchByMemberPassword(String memberName, String memberId, String memberMail){
		return dao.findByMemberPassword(memberName, memberMail, memberId);
	}
	//	6. 회원별 정보조회하기
	public Member getByMember(String memberId){
		return dao.selectByMember(memberId);
	}
	//	7. 로그인
	public int memberLogin(String memberId, String memberPassword){
		return dao.memberLogin(memberId, memberPassword);
	}
	//	8. 회원 아이디 중복체크
	public int checkId(String memberId){
		return dao.checkId(memberId);
	}
	//	9. 회원 전체리스트 조회하기
	public List<Member> selectAllMember(){
		return dao.selectAllMember();
	}

}
