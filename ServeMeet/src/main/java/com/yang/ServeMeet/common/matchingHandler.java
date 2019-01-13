package com.yang.ServeMeet.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.yang.ServeMeet.chatting.model.service.ChattingService;
import com.yang.ServeMeet.member.model.vo.Member;

public class matchingHandler extends TextWebSocketHandler {

	@Autowired
	private ChattingService cs;
//웹 소켓에서 특정 사용자가 센션을 연결하여 주고받는 데이터를 처리하는 객체
	// 접속 사용자 리스트
	//private List<WebSocketSession> sessionList = new ArrayList();
	private Map<String,WebSocketSession> mSessionMap= new HashMap<String,WebSocketSession>();
	//private Map<Integer, List> rMap = new HashedMap();
	private Map<Integer, List> rMap = new HashMap<Integer, List>();
	// 에러가 났을 때 로거
	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	// 사용자 연결 후 실행할 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// Websocket의 세션은 HttpSession과 다르다.
		// 사용자 연결 시에 sessionList라는 사용자 리스트에 접속한 사용자를 추가한다.

		String userName = ((Member)(session.getAttributes().get("member"))).getUserName();

		mSessionMap.put(userName, session);

		System.out.println("매칭 : "+mSessionMap);

	}

	// 사용자가 메세지를 보냈을 때 접속한 사람 모두에게 해당 메세지를 전달하는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String userId=message.getPayload();
		System.out.println("매칭 userId : "+userId);
				if(mSessionMap.get(userId)!=null) {
					System.out.println("mSessionMap.get(userId) : "+mSessionMap.get(userId)+" : "+userId);
					(mSessionMap.get(userId)).sendMessage(new TextMessage("new"));

			}



		// super.handleTextMessage(session, message);
	}

	// 사용자가 채팅방, 접속을 종료할 때 실행 되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Member m = (Member) session.getAttributes().get("member");
		mSessionMap.remove(m.getUserName());
		System.out.println("==============mSessionMap=================\n"+mSessionMap);
//
//		// super.afterConnectionClosed(session, status);
	}

} 