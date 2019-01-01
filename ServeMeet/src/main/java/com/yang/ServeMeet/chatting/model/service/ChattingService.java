package com.yang.ServeMeet.chatting.model.service;

import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.chatting.model.vo.ChattingLog;
import com.yang.ServeMeet.member.model.vo.Member;

public interface ChattingService {
	
	List<Chatting> selectChatList(int userNo);

	int ChatLogInsert(ChattingLog chatLog);

	List<Member> memberList(int userNo);

	Chatting isChat(Map<String, String> userNameMap);

	int insertChat(Map<String, String> userNameMap);

	Chatting selectChat(int chatNo);

	List<ChattingLog> selectChatLog(int chattingId);

}
