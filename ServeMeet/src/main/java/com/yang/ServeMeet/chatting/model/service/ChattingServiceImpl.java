package com.yang.ServeMeet.chatting.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.chatting.model.dao.ChattingDao;
import com.yang.ServeMeet.chatting.model.vo.ChatCreateInfo;
import com.yang.ServeMeet.chatting.model.vo.ChatUser;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.chatting.model.vo.ChattingLog;
import com.yang.ServeMeet.chatting.model.vo.ChattingRoom;
import com.yang.ServeMeet.member.model.vo.Member;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	private ChattingDao cDao;
	

	@Override
	public int ChatLogInsert(ChattingLog chatLog) {
		// TODO Auto-generated method stub
		return cDao.ChatLogInsert(chatLog);
	}
	@Override
	public Chatting isChat(Map<String, String> userNameMap) {
		// TODO Auto-generated method stub
		return cDao.isChat(userNameMap);
	}
	@Override
	public int insertChat(Map<String, List> nameMap) {
		// TODO Auto-generated method stub
		return cDao.insertChat(nameMap);
	}


	@Override
	public List<ChattingRoom> selectChattingList(int chattingId) {
		// TODO Auto-generated method stub
		return cDao.selectChattingList(chattingId);
	}
	@Override
	public List<ChattingLog> selectChatLogList(int chatNo) {
		// TODO Auto-generated method stub
		return cDao.selectChatLogList(chatNo);
	}
	public List<ChatUser> selectChatMembers(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return cDao.selectChatMembers(map);
	}
	@Override
	public Chatting getChatName(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return cDao.getChatName(map);
	}
	@Override
	public void updateStatus(ChatUser chatuser) {
		cDao.updateStatus(chatuser);		
	}
	@Override
	public Chatting selectLastChatNo(int userNo) {
		// TODO Auto-generated method stub
		return cDao.selectLastChatNo(userNo);
	}
	@Override
	public void deletechatRoom(Map<String, Integer> map) {
		cDao.deletechatRoom(map);
		
	}
	@Override
	public void insertChatGroup(ChatCreateInfo chatInfo) {
		// TODO Auto-generated method stub
		cDao.insertChatGroup(chatInfo);
	}
}
