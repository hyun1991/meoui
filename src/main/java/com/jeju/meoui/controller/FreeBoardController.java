package com.jeju.meoui.controller;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import com.jeju.meoui.service.*;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService service;
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	//1 .자유게시판 추가하기
	//2. 자유게시판 수정하기
	//3. 자유게시판 삭제하기
	//4. 자유게시판 페이지별 조회하기
	//5. 자유게시판 번호별 조회
}
