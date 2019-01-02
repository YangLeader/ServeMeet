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
		List<ChattingLog> chatList = new ArrayList<ChattingLog>();
		chatList=cs.selectChatLog(userNo);
		for(ChattingLog c :chatList) {
			String tmp=c.getChContent();
			if(tmp!=null&&tmp.length()>30) {
				tmp=tmp.substring(0, 30)+"...";
				c.setChContent(tmp);
			}
			System.out.println(c);
		}
		
		return chatList;
	}
	@RequestMapping("/chat/chatLogList.do")
	@ResponseBody
	public List<ChattingLog> chatLogList(HttpSession session) {
		
		//int userNo = ((Member)(session.getAttribute("member"))).getUserNo();
		List<ChattingLog> chatLogList = new ArrayList<ChattingLog>();
		int chatNo = ((Chatting)(session.getAttribute("chat"))).getChattingId();
		chatLogList=cs.selectChatLogList(chatNo);
		System.out.println("==============================="+chatLogList);
	
		
		return chatLogList;
	}
	
	@RequestMapping("/chat/memberList.do")
	public String memberList(Model model,HttpSession session) {
		
		int userNo=((Member)session.getAttribute("member")).getUserNo();
		List<Member> list = cs.memberList(userNo);
		model.addAttribute("list",list);
		
		return "chat/memberList";
	}
	
	

}
