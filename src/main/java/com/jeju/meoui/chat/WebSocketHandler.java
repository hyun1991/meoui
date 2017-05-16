package com.jeju.meoui.chat;

import java.util.*;

import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.*;

public class WebSocketHandler extends TextWebSocketHandler {
	//	ArrayList: 스레드 안전하지 않다
	//	Vector: 스레드 안전하다.
	private List<WebSocketSession>list= new ArrayList<WebSocketSession>();
	//	사용자가 접속하면 세션을 리스트에 추가
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		list.add(session);
	}
	//	사용자가 종료하면 세션을 리스트에 제거
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		list.remove(session);
	}

	//	누군가에게서 메세지가 오면 리스트의 모든 세션에서 보내준다.
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// TODO Auto-generated method stub
		for(int i=0; i<list.size(); i++){
			list.get(i).sendMessage(message);
		}
	}
}
