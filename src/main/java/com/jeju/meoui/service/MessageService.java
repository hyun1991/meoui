package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

@Service
public class MessageService {
	@Autowired
	private MessageDAO dao;
	@Autowired
	private MemberDAO memberDao;
	private static final Logger logger= LoggerFactory.getLogger(MessageService.class);
	//	쪽지발송하기
	public void createMessage(Message message){
		dao.insertMessage(message);
	}
	//	쪽지수정하기
	public void modifyMessage(int memberId, int messageNo){
		dao.updateMessage(memberId, messageNo);
	}
	//	쪽지리스트 조회하기
	public List<Message> getAllMessage(String memberId){
		int memberNo= memberDao.selectByMemberNo(memberId);
		logger.info("아이디, 번호:{}", memberId, memberNo);
		return dao.selectAllMessage(memberNo);
	}
	// 쪽지삭제하기
	public void removeMessage(int memberId, int messageNo){
		dao.deleteMessage(memberId, messageNo);
	}
	//	쪽지상세보기
	public Message getByMessage(int memberId, int messageNo){
		return dao.selectByMessage(memberId, messageNo);
	}
}
