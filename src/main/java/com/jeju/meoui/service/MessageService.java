package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.jeju.meoui.dao.*;
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

	//	회원별 쪽지리스트 조회하기
	public HashMap<String, Object> getAllMessage(String messageReceiveId, int pageNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		int cnt= dao.findDBMax(messageReceiveId);
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		List<Message> message= dao.selectAllMessage(messageReceiveId ,pagination.getStartRow(), pagination.getLastRow());
		ArrayList<Message>okMessage= new ArrayList<Message>();
		ArrayList<Message>failMessage= new ArrayList<Message>();
		for(Message ms:message){
			if(ms.getMessageReceiveCheck()==0){
				Message mes= new Message(ms.getMessageNo(), ms.getMemberNo(), ms.getMessageReceiveId(), ms.getMessageSendId(),ms.getMessageTitle(),ms.getMessageContent(), ms.getMessageDate(), ms.getMessageReceiveDate());
				mes.setCheck("읽지않음");
				okMessage.add(mes);
			}
			else{
				Message mes= new Message(ms.getMessageNo(), ms.getMemberNo(), ms.getMessageReceiveId(), ms.getMessageSendId(),ms.getMessageTitle(),ms.getMessageContent(), ms.getMessageDate(), ms.getMessageReceiveDate());
				mes.setCheck("읽음");
				failMessage.add(mes);
			}
			System.out.println(ms);
		}
		map.put("okMessage", okMessage);
		map.put("failMessage", failMessage);
		map.put("pagination", pagination);
		return map;
		
	}
	// 쪽지삭제하기
	public void removeMessage(int messageNo){
		dao.deleteMessage(messageNo);
	}
	//	쪽지상세보기
	@Transactional
	public Message getByMessage(int messageNo){
		dao.updateMessage(messageNo);
		return dao.selectByMessage(messageNo);
	}
}
