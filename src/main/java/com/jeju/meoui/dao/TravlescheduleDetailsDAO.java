package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class TravlescheduleDetailsDAO {
	@Autowired
	private SqlSessionTemplate template;
	//	일정상세 추가하기
	public void insertTravleDetails(TravlescheduleDetails details){
		template.insert("TravlescheduleDetailsMapper.insertTravleDetails", details);
	}
	//	일정상세 삭제하기
	public void deleteTravleDetails(int travlescheduleNo,int memberNo){
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("travlescheduleNo", travlescheduleNo);
		map.put("memberNo", memberNo);
		template.delete("TravlescheduleDetailsMapper.deleteTravleDetails",map);
	}
}
