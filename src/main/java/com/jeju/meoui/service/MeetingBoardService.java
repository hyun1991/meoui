package com.jeju.meoui.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Service
public class MeetingBoardService {

	@Autowired
	public MeetingBoardDAO dao;
	
	
	public void createMeetingBoard(MeetingBoard meetingBoard){
		dao.insertMeetingBoard(meetingBoard);
	}
	
	public HashMap<String, Object> selectAllMeetingBoard(int pageNo){
		int cnt = dao.meetingBoardCount();
		Pagination pagination= PagingUtil.getPagination(pageNo, cnt);
		List<MeetingBoard> list = dao.selectAllMeetingBoard(pagination.getStartRow(), pagination.getLastRow());
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", list);
		return map;
	}
	
}
