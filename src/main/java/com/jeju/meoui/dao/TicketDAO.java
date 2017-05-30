package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.slf4j.*;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

import ch.qos.logback.classic.*;

@Repository
public class TicketDAO {
	private static final Logger logger = LoggerFactory.getLogger(TicketDAO.class);
	@Autowired
	private SqlSessionTemplate template;
	
	// 1.티켓 추가
	public void insetTicket(Ticket t){
		template.insert("TicketMapper.insertTicket",t);
	}
	
	// 2.티켓 수정
	public void updateTicket(Ticket t){
		template.update("TicketMapper.updateTicket", t);
	}
	
	// 3.티켓 전체 삭제
	public void deleteTicket(int siteNo){
		template.delete("TicketMapper.deleteTicket", siteNo);
		logger.info("찍어봐라:{}", siteNo);
	}
	
	// 4.연령대별 티켓 삭제
	public void deleteTicketByAgegroup(int siteNo, String ticketStandard){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("siteNo", siteNo);
		map.put("ticketStandard", ticketStandard);
		template.delete("TicketMapper.deleteTicketByAgegroup",map);
	}
	
	// 5.관광지별 티켓 리스트
	public List<Ticket> selectTicketList(int siteNo){
		System.out.println(template.selectList("TicketMapper.selectTicket",siteNo));
		return template.selectList("TicketMapper.selectTicket",siteNo);
	}
	
	// 6. 마지막번호
	public int MaxTicketNo(){
		return template.selectOne("TicketMapper.maxTicketNo");
	}

}
