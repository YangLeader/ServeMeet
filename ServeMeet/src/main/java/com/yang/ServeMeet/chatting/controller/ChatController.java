package com.yang.ServeMeet.chatting.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yang.ServeMeet.chatting.model.service.ChattingService;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.chatting.model.vo.ChattingLog;
import com.yang.ServeMeet.member.model.vo.Member;
@Controller
public class ChatController {
	@Autowired
	private ChattingService cs;
	
	
	@RequestMapping("/chat/chatList.do")
	public String chatList(Model model, HttpSession session ) {
	
		int userNo = ((Member)(session.getAttribute("member"))).getUserNo();
		List<Chatting> list = cs.selectChatList(userNo);
		
		model.addAttribute("list",list);
		
		return "chat/chatList";
	}
	
	@RequestMapping("/chat/chatListMin.do")
	@ResponseBody
	public List<ChattingLog> chatListMin(HttpSession session) {
		
		int userNo = ((Member)(session.getAttribute("member"))).getUserNo();
		List<Chatting> list  = cs.selectChatList(userNo);
		List<ChattingLog> chatList = new ArrayList<ChattingLog>();
		for(Chatting c : list) {
			chatList.add( cs.selectChatLog(c.getChattingId()));
			System.out.println("chatList:::::::::::::"+chatList.toString());
		}
		return chatList;
	}
	
	@RequestMapping("/chat/memberList.do")
	public String memberList(Model model,HttpSession session) {
		
		int userNo=((Member)session.getAttribute("member")).getUserNo();
		List<Member> list = cs.memberList(userNo);
		model.addAttribute("list",list);
		
		return "chat/memberList";
	}
	
	

}
