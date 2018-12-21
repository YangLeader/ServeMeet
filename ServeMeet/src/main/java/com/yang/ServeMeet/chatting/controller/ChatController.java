package com.yang.ServeMeet.chatting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yang.ServeMeet.chatting.model.service.ChattingService;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.member.model.vo.Member;
@Controller
public class ChatController {
	@Autowired
	private ChattingService cs;
	
	@RequestMapping(value ="/chat/chat.do",method = RequestMethod.GET)
	public String chat() {
		return "chat/chat";
	}
	
	@RequestMapping("/chat/chatList.do")
	public String chatList(Model model, HttpSession session ) {
	
		String userName=((Member)session.getAttribute("member")).getUserName();
		List<Chatting> list = cs.selectChatList(userName);
		
		model.addAttribute("list",list);
		
		return "chat/chatList";
	}
	

}
