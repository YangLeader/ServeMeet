package com.yang.ServeMeet.chatting.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yang.ServeMeet.chatting.model.service.ChattingService;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.chatting.model.vo.ChattingLog;
import com.yang.ServeMeet.chatting.model.vo.ChattingRoom;
import com.yang.ServeMeet.member.model.vo.Member;
@Controller
public class ChatController {
	@Autowired
	private ChattingService cs;
	
	@RequestMapping("/chat/chatListMin.do")
	@ResponseBody
	public List<ChattingRoom> chatListMin(HttpSession session) {
		
		int userNo = ((Member)(session.getAttribute("member"))).getUserNo();
		List<ChattingRoom> chatList = new ArrayList<ChattingRoom>();
		chatList=cs.selectChattingList(userNo);
		for(ChattingRoom c :chatList) {
			String tmp=c.getChContent();
			if(tmp!=null&&tmp.length()>30) {
				tmp=tmp.substring(0, 30)+"...";
				c.setChContent(tmp);
			}
		
		}
		
		return chatList;
	}
	@RequestMapping("/chat/chatLogList.do")
	@ResponseBody
	public List<ChattingLog> chatLogList(HttpSession session,@RequestParam int chatNo ) {
		
		//int userNo = ((Member)(session.getAttribute("member"))).getUserNo();
		List<ChattingLog> chatLogList = new ArrayList<ChattingLog>();
		chatLogList=cs.selectChatLogList(chatNo);
		
		
		return chatLogList;
	}
	
	
	

}
