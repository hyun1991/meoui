package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class MessageDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	//	쪽지 발송하기(추가하기)
	public void insertMessage(Message message){
		template.insert("MessageMapper.insertMessage", message);
	}
	//	쪽지수정하기(보낸날짜 및 확인여부)
	public void updateMessage(int messageNo){
		template.update("MessageMapper.updateMessage", messageNo);
	}
	//	쪽지리스트 조회하기
	public List<Message> selectAllMessage(String messageReceiveId,int startRow, int lastRow){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("messageReceiveId", messageReceiveId);
		map.put("startRow", startRow);
		map.put("lastRow", lastRow);
		return template.selectList("MessageMapper.selectAllMessage", map);
	}
	//	쪽지삭제하기
	public void deleteMessage(int messageNo){
		template.delete("MessageMapper.deleteMessage", messageNo);
	}
	//	쪽지상세보기
	public Message selectByMessage(int messageNo){
		return template.selectOne("MessageMapper.selectByMessage", messageNo);
	}
	//	사용자 번호별 쪽지 DB개수 체크
	public int findDBMax(String messageReceiveId){
		return template.selectOne("MessageMapper.findDBMax", messageReceiveId);
	}
	//	받는이 아이디 출력
	public List<String>getBySendId(){
		return template.selectList("MessageMapper.getBySendId");
	}

}
