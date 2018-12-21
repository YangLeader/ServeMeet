package com.yang.ServeMeet.chatting.model.service;

import java.util.List;

import com.yang.ServeMeet.chatting.model.vo.Chatting;

public interface ChattingService {
	
	List<Chatting> selectChatList(String userName);
	
	int ChatInsert(Chatting chat);
	int ChatUpdate(Chatting chat);
	int ChatDelete(Chatting chat);

}
