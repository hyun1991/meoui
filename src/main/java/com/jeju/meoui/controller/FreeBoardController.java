package com.jeju.meoui.controller;

import java.io.*;

import javax.annotation.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.io.*;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import com.jeju.meoui.service.*;
import com.jeju.meoui.util.*;
import com.jeju.meoui.vo.*;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService service;
	@Autowired
	private ServletContext ctx;
	@Resource(name="path")
	private String path;
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	//1 .자유게시판 추가하기(작성폼)
	@RequestMapping(value="/freeboard/join", method=RequestMethod.GET)
	public String insertFreeboardForm() {
		return "freeboard/insert";
	}
	//1-1.자유게시판 추가 성공
	@RequestMapping(value="/freeboard/join", method=RequestMethod.POST)
	public String insertFreeboard(@ModelAttribute FreeBoard freeboard, @RequestParam("img") MultipartFile freeboardImg, HttpSession session) {
		int memberNo= (Integer)session.getAttribute("memberNo");
		String fileName= UploadUtil.storeAndGetFileName(freeboardImg, ctx, path);
		freeboard.setMemberNo(memberNo);
		freeboard.setFreeboardImg(fileName);
		service.createFreeboard(freeboard);
		return "redirect:/freeboard/list?pageNo=1";
	}
	
	//2. 자유게시판 수정하기(작성폼)
	@RequestMapping(value="/freeboard/update", method=RequestMethod.GET)
	public String updateFreeboardForm() {
		return "freeboard/update";
	}
	//2-1. 자유게시판 수정하기 수정 성공
	@RequestMapping(value="/freeboard/update", method=RequestMethod.POST)
	public String updateFreeboardSuccess(@ModelAttribute FreeBoard freeBoard, @RequestParam("img") MultipartFile freeboardImg, HttpSession session){
		int freeboardNo= (Integer)session.getAttribute("freeboardNo");
		String fileName= UploadUtil.storeAndGetFileName(freeboardImg, ctx, path);
		freeBoard.setFreeboardNo(freeboardNo);
		freeBoard.setFreeboardImg(fileName);
		service.modifyFreeboard(freeBoard);
		return "redirect:/freeboard/list?pageNo=1";
	}
	//3. 자유게시판 삭제하기
	@RequestMapping(value="/freeboard/delete/{freeboardNo}", method=RequestMethod.GET)
	public String deleteFreeboard(@PathVariable int freeboardNo) {
		service.removeFreeboard(freeboardNo);
		return "redirect:/freeboard/list?pageNo=1";
	}
	//4. 자유게시판 페이지별 조회하기(사용자용)
	@RequestMapping(value="/freeboard/list", method=RequestMethod.GET)
	public String getAllFreeboard(Model model, @RequestParam(defaultValue="1") int pageNo) {
		model.addAttribute("result", service.getByFreeboard(pageNo));
		return "freeboard/list";
	}
	//5. 자유게시판 페이지별 조회하기(관리자용)
	@RequestMapping(value="/admin/freeboard/list", method=RequestMethod.GET)
	public String getAdminAllFreeboard(Model model, @RequestParam(defaultValue="1") int pageNo) {
		model.addAttribute("result", service.getByFreeboard(pageNo));
		return "admin/adminfb";
	}
	//6. 자유게시판 번호별 조회(사용자용)
	@RequestMapping(value="/freeboard/view/{freeboardNo}", method=RequestMethod.GET)
	public String selectByFreeboard(Model model, HttpSession session, @PathVariable int freeboardNo) {
		session.setAttribute("freeboardNo", freeboardNo);
		model.addAttribute("result", service.findByFreeboard(freeboardNo));
		return "freeboard/view";
	}
	//6. 자유게시판 번호별 조회(관리자용)
	@RequestMapping(value="/admin/view/{freeboardNo}", method=RequestMethod.GET)
	public String selectByAdminFreeboard(Model model, HttpSession session, @PathVariable int freeboardNo) {
		session.setAttribute("freeboardNo", freeboardNo);
		model.addAttribute("result", service.findByFreeboard(freeboardNo));
		return "admin/adminfdview";
	}
	
	//	자유게시판 상세뷰에서 이미지 다운로드
	@RequestMapping(value="/freeboard/download", method=RequestMethod.GET)
	public ResponseEntity<byte[]> download(String freeboardImg) throws IOException  {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			in = new FileInputStream(ctx.getRealPath(path) + "/" + freeboardImg);
			freeboardImg = freeboardImg.substring(freeboardImg.indexOf("-")+1);
			headers.add("Content-Disposition", "attachment;filename=\""
			+ new String(freeboardImg.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			entity = 
			new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} 
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} 
		finally {
			in.close();
		}
		return entity;
	}
}
