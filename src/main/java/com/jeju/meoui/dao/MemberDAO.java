package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	//	1. 회원 추가하기(완료: 테스트 필요)
	public void insertMember(Member member){
		template.insert("MemberMapper.insertMember", member);
	}
	
	//	2. 회원정보 수정하기(완료: 테스트 필요)
	public void updateMember(Member member){
		template.update("MemberMapper.updateMember", member);
	}
	
	//	3. 회원탈퇴(완료: 테스트 필요)
	public void deleteMember(String memberId){
		template.delete("MemberMapper.deleteMember", memberId);
	}
	
	//	4. 회원 아이디 조회하기(완료: 테스트 필요)
	public String findByMemberId(String memberName, String memberEmail){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("memberName", memberName);
		map.put("memberEmail", memberEmail);
		return template.selectOne("MemberMapper.findByMemberId", map);
	}
	
	//	5. 회원 비밀번호 조회하기(완료: 테스트 필요)
	public String findByMemberPassword(String memberName, String memberEmail, String memberId){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("memberName", memberName);
		map.put("memberEmail", memberEmail);
		map.put("memberId", memberId);
		return template.selectOne("MemberMapper.findByMemberPassword", map);
	}
	
	//	6. 회원 별 정보조회(완료: 테스트 필요)
	public Member selectByMember(String memberId){
		return template.selectOne("MemberMapper.selectByMember", memberId);
	}
	
	//	7. 회원 아이디별 회원번호 조회하기(완료: 테스트 필요)
	public int selectByMemberNo(String memberId){
		return template.selectOne("MemberMapper.selectByMemberNo", memberId);
	}
	
	//	8. 회원 로그인(완료: 테스트 필요)
	public int memberLogin(String memberId, String memberPassword){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("memberPassword", memberPassword);
		return template.selectOne("MemberMapper.memberLogin", map);
	}
	
	//	9. 회원 아이디 중복체크(완료: 테스트 필요)
	public int checkId(String memberId){
		//	회원 중복조회
		//		1) 1값 반환시 중복존재
		//		2) 0값 반환시 사용가능
		return template.selectOne("MemberMapper.checkId", memberId);
	}

}
