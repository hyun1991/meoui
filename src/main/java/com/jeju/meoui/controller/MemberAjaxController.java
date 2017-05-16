package com.jeju.meoui.controller;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.jeju.meoui.service.*;

@RestController
public class MemberAjaxController {
	@Autowired
	private MemberService service;
	private static final Logger logger= LoggerFactory.getLogger(MemberController.class);
	
	//	9. 회원 아이디 찾기(완료)
	@RequestMapping(value="/member/idsearch", method=RequestMethod.POST)
	public List<String> selectByMemberId(String memberName, String memberMail){
		logger.info("아이디찾기{}", service.searchByMemberId(memberName, memberMail));
		return service.searchByMemberId(memberName, memberMail);
	}

	//	4. 회원 비밀번호 찾기 완료(미완료)
	@RequestMapping(value="/member/pwsearch", method=RequestMethod.POST)
	public String selectByMemberPassword(String garaName, String garaMail, String memberId){
		logger.info("비밀번호찾기{}", service.searchByMemberPassword(garaName, memberId, garaMail));
		return service.searchByMemberPassword(garaName, memberId, garaMail);
	}
}
