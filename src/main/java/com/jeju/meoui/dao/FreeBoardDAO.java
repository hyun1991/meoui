package com.jeju.meoui.dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.vo.*;

@Repository
public class FreeBoardDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	// 1. 자유게시판 작성
	public int insertFreeboard(FreeBoard freeboard) {
		return template.insert("FreeBoardMapper.insertFreeboard", freeboard);
	}
	// 2. 자유게시판 상세조회
	public FreeBoard selectFreeboard(int freeboardNo) {
		return template.selectOne("FreeBoardMapper.selectFreeboard", freeboardNo);
	}
	// 3. 자유게시판 리스트 조회
	public List<FreeBoard> selectAllFreeboard(int start, int end) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return template.selectList("FreeBoardMapper.selectAllFreeboard", map);
	}
	// 4. 자유게시판 수정
	public void updateFreeboard(FreeBoard freeBoard) {
		template.update("FreeBoardMapper.updateFreeboard", freeBoard);
	}
	// 5. 자유게시판 삭제
	public int deleteFreeboard(int freeboardNo) {
		return template.delete("FreeBoardMapper.deleteFreeboard", freeboardNo);
	}
	// 6. 자유게시판 DB개수조회(완료)
	public int findByMax() {
		return template.selectOne("FreeBoardMapper.findByMax");
	}
	// 7. 자유게시판 조회수 증가
	public void incrementCnt(int freeboardNo) {
		template.update("FreeBoardMapper.incrementCnt", freeboardNo);
	}
}
