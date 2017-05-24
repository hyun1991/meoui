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
	public void updateMessage(int memberNo, int messageNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("messageNo", messageNo);
		template.update("MessageMapper.updateMessage", map);
	}
	//	쪽지리스트 조회하기
	public List<Message> selectAllMessage(int memberNo,int startRow, int lastRow){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("startRow", startRow);
		map.put("lastRow", lastRow);
		return template.selectList("MessageMapper.selectAllMessage", map);
	}
	//	쪽지삭제하기
	public void deleteMessage(int memberNo, int messageNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("memberId", memberNo);
		map.put("messageNo", messageNo);
		template.delete("MessageMapper.deleteMessage", map);
	}
	//	쪽지상세보기
	public Message selectByMessage(int memberNo, int messageNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("memberId", memberNo);
		map.put("messageNo", messageNo);
		return template.selectOne("MessageMapper.selectByMessage", map);
	}
	//	사용자 번호별 쪽지 DB개수 체크
	public int findDBMax(){
		return template.selectOne("MessageMapper.findDBMax");
	}

}
