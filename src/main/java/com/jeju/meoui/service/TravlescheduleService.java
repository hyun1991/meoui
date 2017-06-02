package com.jeju.meoui.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.format.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.google.gson.*;
import com.jeju.meoui.dao.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;
import com.jeju.meoui.vo.Calendar;

@Service
public class TravlescheduleService {
	@Autowired
	private TravlescheduleDAO dao;
	@Autowired
	private TravlescheduleDetailsDAO detailDao;
	private Logger logger= LoggerFactory.getLogger(TravlescheduleService.class);
	//	일정추가하기
	@Transactional
	public void createTravle(Travleschedule travleschedule, int siteNo){
		dao.insertTravle(travleschedule);
		int travlescheduleNo= dao.getByTravleNo();
		TravlescheduleDetails details= new TravlescheduleDetails();
		details.setMemberNo(travleschedule.getMemberNo());
		details.setSiteNo(siteNo);
		details.setTravlescheduleNo(travlescheduleNo);
		detailDao.insertTravleDetails(details);
	}
	//	고객번호별 일정전체 조회하기
	public HashMap<String, Object> getAllTravle(int memberNo){
		List<Travleschedule> extra= dao.findAllMemberNo(memberNo);
		/*
		ArrayList<Calendar> cal= new ArrayList<Calendar>();
		Calendar ca= new Calendar();
		for(Travleschedule tv: list){
			ca.setStart(tv.getTravlescheduleDate());
			ca.setTitle(tv.getSchedule());
			cal.add(ca);
		}
		*/	
		for(Travleschedule tv: extra){
			tv.setStart(tv.getTravlescheduleDate());
			tv.setTitle(tv.getSchedule());
		}
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("extra", extra);
		return map;
	}
	public HashMap<String, Object>findAllSchedule(int pageNo, int memberNo){
		int cntRow= dao.getByMax(memberNo);
		Pagination pagination= PagingUtil.getPagination(pageNo, cntRow);
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("list", dao.getBySchedule(memberNo, pagination.getStartRow(), pagination.getLastRow()));
		return map;
	}
	//	일정삭제하기
	@Transactional
	public void deleteSchedule(int travlescheduleNo, int memberNo){
		detailDao.deleteTravleDetails(travlescheduleNo, memberNo);
		dao.deleteTravle(travlescheduleNo, memberNo);
	}
}
