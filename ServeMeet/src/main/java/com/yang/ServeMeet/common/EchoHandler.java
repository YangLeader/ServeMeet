package com.yang.ServeMeet.common;

import java.util.ArrayList;
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
import com.yang.ServeMeet.chatting.model.vo.ChatUser;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.chatting.model.vo.ChattingLog;
import com.yang.ServeMeet.member.model.vo.Member;

public class EchoHandler extends TextWebSocketHandler {

	@Autowired
	private ChattingService cs;
//웹 소켓에서 특정 사용자가 센션을 연결하여 주고받는 데이터를 처리하는 객체
	// 접속 사용자 리스트
	//사용자 닉네음,WebSocketSession 저장할 map
	private Map<String,WebSocketSession> mSessionMap= new HashMap<String,WebSocketSession>();
	//채팅방 번호, 채팅방에 속한 유저의 닉네임을 담은 list 저장할 map
	private Map<Integer, List> rMap = new HashMap<Integer, List>();
	// 에러가 났을 때 로거
	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);

	// 사용자 연결 후 실행할 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// Websocket의 세션은 HttpSession과 다르다.
		int chatNo=0;
		if (session.getAttributes().get("chat") != null) {
		
			chatNo = ((Chatting) (session.getAttributes().get("chat"))).getChattingId();
		}
		// 사용자 연결 시에 sessionList라는 사용자 리스트에 접속한 사용자를 추가한다.
		System.out.println("==============chatNo : " + chatNo);
		
		String userName = ((Member)(session.getAttributes().get("member"))).getUserName();
		int userNo=((Member)(session.getAttributes().get("member"))).getUserNo();
		
		List<ChatUser> chatUser= new ArrayList<ChatUser>();
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		List<String> users=new ArrayList<String>();
		
		map.put("chatNo", chatNo);
		map.put("userNo", userNo);
		
		mSessionMap.put(userName, session);
		
		System.out.println(mSessionMap);
	
		
		chatUser=cs.selectChatMembers(map);
		
		System.out.println(chatUser);
		users.add(userName);
		for(ChatUser c:chatUser) {
			users.add(c.getUserName());
		}
		rMap.put(chatNo, users);
		
		System.out.println("users : "+users);
		System.out.println("rMap : "+rMap);
		
//		if (rMap.containsKey(chatNo)) {
//			if(!(rMap.get(chatNo)).contains(userId))
//				(rMap.get(chatNo)).add(userId);
//		} else {
//			users.add(userId);
//			rMap.put(chatNo, users);
//		}
//		System.out.println("rMap : "+rMap);
//		System.out.println("users : "+users);
		
//		if (rMap.containsKey(chatNo)) {
//			(rMap.get(chatNo)).add(session);
//		} else {
//			sessionList.add(session);
//			rMap.put(chatNo, sessionList);
//		}
//		sessionList = new ArrayList();

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
		Map<String,Object> map;
		Member m = (Member) session.getAttributes().get("member");
		int chatNo;
		int userNo = m.getUserNo();
		String userName = m.getUserName();
		if (session.getAttributes().get("chat") == null) {
			chatNo = (Integer) (session.getAttributes().get("chatNo"));
		} else {
			Chatting chat = (Chatting) (session.getAttributes().get("chat"));
			chatNo = chat.getChattingId();
		}
		

		System.out.println("session주소 : " + session.getRemoteAddress());
		System.out.println(userName);
		List<String> list = new ArrayList<String>();
		//현재 사용자가 접속해있는 채팅방의 방 번호
		list=rMap.get(chatNo);
		System.out.println(list);

		ChattingLog chatLog = new ChattingLog(chatNo, userNo, message.getPayload(),list);
		System.out.println(chatLog);
		if (message.getPayload() != null) {
			if(list.contains(m.getUserName())) {
				
				list.remove(m.getUserName());
				int result = cs.ChatLogInsert(chatLog);
				
				list.add(m.getUserName());
			
				if (result > 0) {
					// 사용자 모두에게 데이터를 전달하는 반복문
					for (String userId : list) {
						map=new HashMap<>();
						
						if(mSessionMap.get(userId)!=null) {
							System.out.println("mSessionMap.get(userId) : "+mSessionMap.get(userId)+" : "+userId);
							(mSessionMap.get(userId)).sendMessage(new TextMessage(session.getId() + " | " + message.getPayload() + "|"
									+ session.getRemoteAddress() + "|" + userName+"|"+chatNo));
						}
					}
					
				}
			}
			
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