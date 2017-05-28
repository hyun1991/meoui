package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Service
public class MeetingBoardService {

	@Autowired
	public MeetingBoardDAO dao;
	
	private Logger logger= LoggerFactory.getLogger(MeetingBoardService.class);


	//글 작성
	public void createMeetingBoard(MeetingBoard meetingBoard){
		dao.insertMeetingBoard(meetingBoard);
	}
	
	
	//모임게시판 리스트 출력
	public HashMap<String, Object> selectAllMeetingBoard(int pageNo, int meetingNo){
		int cnt = dao.meetingBoardCount();
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		List<MeetingBoard> list = dao.selectAllMeetingBoard(pagination.getStartRow(), pagination.getLastRow(), meetingNo);
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", list);
		logger.info("미팅보더서비스 리스트출력: {}", list);
		return map;
	}
	
}
