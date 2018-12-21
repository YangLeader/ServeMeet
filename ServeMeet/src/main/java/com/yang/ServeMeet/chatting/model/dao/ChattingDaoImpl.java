package com.yang.ServeMeet.chatting.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.chatting.model.vo.Chatting;

@Repository
public class ChattingDaoImpl implements ChattingDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	@Override
	public List<Chatting> selectChatList(String userName) {
		
		return sst.selectList("chat.selectCahtList",userName);
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

}
