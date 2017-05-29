package com.jeju.meoui.dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class AgegroupDAO {
	@Autowired
	private SqlSessionTemplate template;
	// 연령대 추가
	public void insertAgegroup(AgeGroup ag){
		template.insert("AgegroupMapper.insertAgegroup", ag);
	}
	
	// 연령대 수정
	public void updateAgegroup(AgeGroup ag){
		template.update("AgegroupMapper.updateAgegroup", ag);
	}
	
	// 연령대 삭제
	public void deleteAgegroup(int agegroupNo){
		template.delete("AgegroupMapper.deleteAgegroup" , agegroupNo);
	}
	
	// 마지막 번호
	public int MaxNo(){
		return template.selectOne("AgegroupMapper.MaxAgegroupNo");
	}
}
