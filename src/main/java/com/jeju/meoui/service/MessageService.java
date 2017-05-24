package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.dao.test.*;
import com.jeju.meoui.util.*;
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
	public void modifyMessage(String memberId, int messageNo){
		int memberNo= memberDao.selectByMemberNo(memberId);
		dao.updateMessage(memberNo, messageNo);
	}
	//	회원별 쪽지리스트 조회하기
	public HashMap<String, Object> getAllMessage(String memberId, int pageNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		int memberNo= memberDao.selectByMemberNo(memberId);
		System.out.println("회원기본키"+memberNo);
		int cnt= dao.findDBMax(memberNo);
		System.out.println("db개수"+cnt);
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		System.out.println(pagination);
		List<Message> message= dao.selectAllMessage(memberNo,pagination.getStartRow(), pagination.getLastRow());
		ArrayList<Message>mesList= new ArrayList<Message>();
		for(Message ms:message){
			Message mes= new Message();
			if(ms.getMessageReceiveCheck()==0)
				mes.setCheck("안읽음");
			else
				mes.setCheck("읽음");
			mesList.add(mes);
		}
		map.put("message", message);
		map.put("list", mesList);
		map.put("pagination", pagination);
		return map;
		/*
		 * int cnt= dao.findByMemberMax();
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		logger.info("페이징,{}",pagination.getStartPaging());
		logger.info("페이징,{}",pagination.getLastPaging());
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", dao.selectAllMember(pagination.getStartRow(), pagination.getLastRow()));
		return map;
		 * */
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
