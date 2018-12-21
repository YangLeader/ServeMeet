package com.yang.ServeMeet.chatting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yang.ServeMeet.chatting.model.service.ChattingService;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.member.model.vo.Member;

@Controller
public class WebSocketChattingController {

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
	
	@RequestMapping(value = "/chat/chatting.do", method = RequestMethod.POST)
	public String chattingMethod(String userName1,String userName2,Model model,HttpServletRequest req, HttpSession session) throws Exception {

		req.setCharacterEncoding("utf-8");
		session.setAttribute("userName1", userName1);
		session.setAttribute("userName2", userName2);
		
		String ipAddr = req.getRemoteAddr();
		
		List<Chatting> list = cs.selectChatList(userName1);
		
		model.addAttribute("list",list);
		model.addAttribute("host", ipAddr);
		
		return "chat/chattingView";
	}
}
