package com.yang.ServeMeet.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.yang.ServeMeet.chatting.model.service.ChattingService;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.chatting.model.vo.ChattingLog;
import com.yang.ServeMeet.member.model.vo.Member;

public class EchoHandler extends TextWebSocketHandler {

	@Autowired
	private ChattingService cs;
//웹 소켓에서 특정 사용자가 센션을 연결하여 주고받는 데이터를 처리하는 객체
	// 접속 사용자 리스트
	private List<WebSocketSession> sessionList = new ArrayList();

	private Map<Integer, List> rMap = new HashedMap();
	// 에러가 났을 때 로거
	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	// 사용자 연결 후 실행할 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// Websocket의 세션은 HttpSession과 다르다.
		int chatNo = ((Chatting)(session.getAttributes().get("chat"))).getChattingId();
		// 사용자 연결 시에 sessionList라는 사용자 리스트에 접속한 사용자를 추가한다.
System.out.println("==============chatNo : " + chatNo);
		if (rMap.containsKey(chatNo)) {
			(rMap.get(chatNo)).add(session);
		} else {
			sessionList.add(session);
			rMap.put(chatNo, sessionList);
		}
		sessionList = new ArrayList();

//		logger.info("{}연결됨", session.getId());
//		
//		System.out.println("채팅방 입장자 :"+session.getId() );
		// super.afterConnectionEstablished(session);
	}

	// 사용자가 메세지를 보냈을 때 접속한 사람 모두에게 해당 메세지를 전달하는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// session.sendMessage(new TextMessage(session.gadminetId() + "|" +
		// message.getPayload()));
		
		Member m = (Member) session.getAttributes().get("member");
		Chatting chat = (Chatting)(session.getAttributes().get("chat"));

		int chatNo = chat.getChattingId();
		int userNo = m.getUserNo();
		String userName = m.getUserName();

		System.out.println("session주소 : " + session.getRemoteAddress());
		System.out.println(userName);

		List<WebSocketSession> rSessionList = new ArrayList<WebSocketSession>();
		rSessionList = rMap.get(chatNo);
		System.out.println("rSessionList : "+rSessionList);

		ChattingLog chatLog = new ChattingLog(chatNo, userNo, message.getPayload(), "N");
		
		if (message.getPayload() != null) {
			int result = cs.ChatLogInsert(chatLog);
			System.out.println(result);
			if (result > 0) {
				// 사용자 모두에게 데이터를 전달하는 반복문
				for (WebSocketSession one : rSessionList) {
					one.sendMessage(new TextMessage(session.getId() + " | " + message.getPayload() + "|"
							+ session.getRemoteAddress() + "|" + userName));
				}
			}
		}

		// super.handleTextMessage(session, message);
	}

	// 사용자가 채팅방, 접속을 종료할 때 실행 되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		int chatNo = (Integer) (session.getAttributes().get("chatNo"));
		List<WebSocketSession> rSessionList = new ArrayList<WebSocketSession>();
		rSessionList = rMap.get(chatNo);

		rSessionList.remove(session);
		rMap.put(chatNo, rSessionList);
		logger.info("{}연결끊김", session.getId());

		for (WebSocketSession one : sessionList) {
			if (one == session)
				continue;
			one.sendMessage(new TextMessage(session.getAttributes().get("userName1") + "님이 퇴장하셨습니다."));
		}

		// super.afterConnectionClosed(session, status);
	}

}