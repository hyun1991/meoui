package com.jeju.meoui.service;

import org.springframework.beans.factory.annotation.*;

import com.jeju.meoui.dao.*;
import com.jeju.meoui.vo.*;

public class NoticeCommentService {
	@Autowired
	private NoticeCommentDAO cdao;
	
	public void createNoticeComment(NoticeComment noticeComment){
		cdao.insertComment(noticeComment);
	}
	public void modifyNoticeComment(NoticeComment noticeComment){
		cdao.updateComment(noticeComment);
	}
	public void removeNoticeComment(int noticeCommentNo, int noticeNo){
		cdao.deleteComment(noticeCommentNo, noticeNo);
	}
	

}
