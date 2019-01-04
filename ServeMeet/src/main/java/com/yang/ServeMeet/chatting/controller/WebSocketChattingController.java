package com.yang.ServeMeet.chatting.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yang.ServeMeet.chatting.model.service.ChattingService;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.member.model.vo.Member;

@RestController
public class WebSocketChattingController {

	@Autowired
	private ChattingService cs;
	
	@RequestMapping(value = "/chat/chatting.do/{chatNo}", method = RequestMethod.POST)
	public ModelAndView chattingMethod(@PathVariable("chatNo")int chatNo,HttpServletRequest req, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();
		Map<String,Integer> map = new HashMap<String,Integer>();
		req.setCharacterEncoding("utf-8");

		String ipAddr = req.getRemoteAddr();
		
		Chatting chat = cs.selectChat(chatNo);
		session.setAttribute("chat", chat);

		map.put("chatNo", chat.getChattingId());
		map.put("userNo", ((Member)session.getAttribute("member")).getUserNo());
		String chatName=cs.getChatName(map);
		
		mv.addObject("chatName", chatName);
		mv.addObject("host", ipAddr);
		mv.setViewName("chat/chattingView");

		return mv;
	}
	
	@RequestMapping(value = "/chat/chattingRoom.do/{userName}", method=RequestMethod.POST)
	public ModelAndView chattingRoom(@PathVariable("userName")String userName,HttpServletRequest req, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		Map<String,Integer> map = new HashMap<String,Integer>();
		String myName = ((Member)session.getAttribute("member")).getUserName();
		String ipAddr = req.getRemoteAddr();
	
		Map<String,String> userNameMap = new HashMap<String,String>();
		
		userNameMap.put("myName", myName);
		userNameMap.put("userName", userName);
		
		Chatting chat = cs.isChat(userNameMap);
		
		if(chat==null) {
			cs.insertChat(userNameMap);
			chat = cs.isChat(userNameMap);
		}
		map.put("chatNo", chat.getChattingId());
		map.put("userNo", ((Member)session.getAttribute("member")).getUserNo());
		String chatName=cs.getChatName(map);
		System.out.println(chat);
		session.setAttribute("chat", chat);	
		
		mv.addObject("chatName", chatName);
		mv.addObject("host", ipAddr);
		mv.setViewName("chat/chattingView");
		
		
		return mv;
	}
}
