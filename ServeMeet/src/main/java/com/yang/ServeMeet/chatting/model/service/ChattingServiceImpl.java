package com.yang.ServeMeet.chatting.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.chatting.model.dao.ChattingDao;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.chatting.model.vo.ChattingLog;
import com.yang.ServeMeet.member.model.vo.Member;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	private ChattingDao cDao;
	@Override
	public List<Chatting> selectChatList(int userNo) {
		
		return cDao.selectChatList(userNo);
	}


	@Override
	public int ChatLogInsert(ChattingLog chatLog) {
		// TODO Auto-generated method stub
		return cDao.ChatLogInsert(chatLog);
	}
	@Override
	public List<Member> memberList(int userNo) {
		// TODO Auto-generated method stub
		return cDao.memberList(userNo);
	}
	@Override
	public Chatting isChat(Map<String, String> userNameMap) {
		// TODO Auto-generated method stub
		return cDao.isChat(userNameMap);
	}
	@Override
	public int insertChat(Map<String, String> userNameMap) {
		// TODO Auto-generated method stub
		return cDao.insertChat(userNameMap);
	}

}
