package com.yang.ServeMeet.chatting.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.chatting.model.dao.ChattingDao;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.chatting.model.vo.ChattingLog;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	private ChattingDao cDao;
	@Override
	public List<Chatting> selectChatList(String userName) {
		
		return cDao.selectChatList(userName);
	}

	@Override
	public int ChatInsert(Chatting chat) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ChatUpdate(Chatting chat) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int ChatDelete(Chatting chat) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int ChatLogInsert(ChattingLog chatLog) {
		// TODO Auto-generated method stub
		return cDao.ChatLogInsert(chatLog);
	}

}
