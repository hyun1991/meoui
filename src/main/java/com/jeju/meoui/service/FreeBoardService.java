package com.jeju.meoui.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Service
public class FreeBoardService {
	@Autowired
	private FreeBoardDAO dao;
	//1. 자유게시판  추가하기
	public void createFreeboard(FreeBoard freeBoard) {
		dao.insertFreeboard(freeBoard);
	}
	//2. 자유게시판  수정하기
	public void modifyFreeboard(FreeBoard freeBoard) {
		dao.updateFreeboard(freeBoard);
	}
	//3. 자유게시판 삭제하기
	public void removeFreeboard(int freeboardNo) {
		dao.deleteFreeboard(freeboardNo);
	}
	//4. 자유게시판 페이지별 조회하기
	public HashMap<String, Object> getByFreeboard(int pageNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cntRow = dao.findByMax();
		Pagination p = PagingUtil.getPagination(pageNo, cntRow);
		List<FreeBoard> list = dao.selectAllFreeboard(p.getStartPaging(), p.getLastPaging());
		map.put("pagination", p);
		map.put("list", list);
		return map;
	}
	//5. 자유게시판 번호별 조회
	public FreeBoard findByFreeboard(int freeboardNo) {
		dao.incrementCnt(freeboardNo);
		return dao.selectFreeboard(freeboardNo);
	}
}
