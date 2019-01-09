package com.yang.ServeMeet.chatting.model.service;

import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.chatting.model.vo.ChatCreateInfo;
import com.yang.ServeMeet.chatting.model.vo.ChatUser;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.chatting.model.vo.ChattingLog;
import com.yang.ServeMeet.chatting.model.vo.ChattingRoom;
import com.yang.ServeMeet.member.model.vo.Member;

public interface ChattingService {
	int ChatLogInsert(ChattingLog chatLog);

	Chatting isChat(Map<String, String> userNameMap);

	int insertChat(Map<String, List> nameMap);

	List<ChattingRoom> selectChattingList(int chattingId);

	List<ChattingLog> selectChatLogList(int chatNo);

	List<ChatUser> selectChatMembers(Map<String, Integer> map);

	Chatting getChatName(Map<String, Integer> map);

	void updateStatus(Map<String, Integer> map);

	Chatting selectLastChatNo(int userNo);

	void deletechatRoom(Map<String, Integer> map);

	void insertChatGroup(ChatCreateInfo chatInfo);

	

}
