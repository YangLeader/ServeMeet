package com.yang.ServeMeet.chatting.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.chatting.model.vo.ChattingLog;
import com.yang.ServeMeet.member.model.vo.Member;

@Repository
public class ChattingDaoImpl implements ChattingDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public List<Chatting> selectChatList(int userNo) {
		
		return sst.selectList("chat.selectCahtList",userNo);
	}


	@Override
	public int ChatLogInsert(ChattingLog chatLog) {
		// TODO Auto-generated method stub
		return sst.insert("chat.insertChatLog",chatLog);
	}

	@Override
	public List<Member> memberList(int userNo) {
		// TODO Auto-generated method stub
		return sst.selectList("chat.selectMember",userNo);
	}
	@Override
	public Chatting isChat(Map<String, String> userNameMap) {
		// TODO Auto-generated method stub
		System.out.println(userNameMap);
		return sst.selectOne("chat.isChat",userNameMap);
	}
	@Override
	public int insertChat(Map<String, String> userNameMap) {
		// TODO Auto-generated method stub
		return sst.insert("chat.insertChat",userNameMap);
	}
	@Override
	public Chatting selectChat(int chatNo) {
		// TODO Auto-generated method stub
		return sst.selectOne("chat.selectChat",chatNo);
	}
	@Override
	public ChattingLog selectChatLog(int chattingId) {
		// TODO Auto-generated method stub
		return sst.selectOne("chat.selectChatLog",chattingId);
	}
}
