package com.yang.ServeMeet.chatting.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.chatting.model.vo.ChatCreateInfo;
import com.yang.ServeMeet.chatting.model.vo.ChatUser;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.chatting.model.vo.ChattingLog;
import com.yang.ServeMeet.chatting.model.vo.ChattingRoom;
import com.yang.ServeMeet.member.model.vo.Member;

@Repository
public class ChattingDaoImpl implements ChattingDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	

	@Override
	public int ChatLogInsert(ChattingLog chatLog) {
		// TODO Auto-generated method stub
		return sst.insert("chat.insertChatLog",chatLog);
	}

	@Override
	public Chatting isChat(Map<String, String> userNameMap) {
		// TODO Auto-generated method stub
		System.out.println(userNameMap);
		return sst.selectOne("chat.isChat",userNameMap);
	}
	@Override
	public int insertChat(Map<String, List> nameMap) {
		// TODO Auto-generated method stub
		return sst.insert("chat.insertChat",nameMap);
	}
	
	@Override
	public List<ChattingRoom> selectChattingList(int chattingId) {
		// TODO Auto-generated method stub
		return sst.selectList("chat.selectChattingList",chattingId);
	}
	@Override
	public List<ChattingLog> selectChatLogList(int chatNo) {
		// TODO Auto-generated method stub
		return sst.selectList("chat.selectChatLogList",chatNo);
	}
	@Override
	public List<ChatUser> selectChatMembers(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sst.selectList("chat.selectChatMembers",map);
	}
	@Override
	public Chatting getChatName(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sst.selectOne("chat.getChatName",map);
	}
	@Override
	public void updateStatus(ChatUser chatuser) {
		sst.update("chat.updateStatus",chatuser);
		
	}
	@Override
	public Chatting selectLastChatNo(int userNo) {
		// TODO Auto-generated method stub
		return sst.selectOne("chat.selectLastChatNo",userNo);
	}
	@Override
	public void deletechatRoom(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		sst.delete("chat.deletechatRoom",map);
	}
	@Override
	public void insertChatGroup(ChatCreateInfo chatInfo) {
		// TODO Auto-generated method stub
		sst.insert("chat.insertChatGroup",chatInfo);
		
		
	}
}
