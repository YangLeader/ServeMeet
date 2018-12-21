package com.yang.ServeMeet.chatting.model.dao;

import java.util.List;

import com.yang.ServeMeet.chatting.model.vo.Chatting;

public interface ChattingDao {
List<Chatting> selectChatList(String userName);
	
	int ChatInsert(Chatting chat);
	int ChatUpdate(Chatting chat);
	int ChatDelete(Chatting chat);

}
