package com.yang.ServeMeet.chatting.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.yang.ServeMeet.chatting.model.service.ChattingService;
import com.yang.ServeMeet.chatting.model.vo.ChatCreateInfo;
import com.yang.ServeMeet.chatting.model.vo.ChatUser;
import com.yang.ServeMeet.chatting.model.vo.Chatting;
import com.yang.ServeMeet.member.model.vo.Member;

@RestController
public class WebSocketChattingController {

	@Autowired
	private ChattingService cs;
	
	@RequestMapping(value = "/chat/allChatList.do", method = RequestMethod.POST)
	public ModelAndView allChatList(HttpServletRequest req,HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();
		String ipAddr = req.getRemoteAddr();

		Chatting chat = cs.selectLastChatNo(((Member)session.getAttribute("member")).getUserNo());
		System.out.println("allList ----------chat : "+chat);
		if(chat!=null) {
			mv.addObject("chatName", chat.getChattingName());
			mv.addObject("chatNo", chat.getChattingId());
			mv.addObject("host", ipAddr);
		}else {
			mv.addObject("chatName", null);
			mv.addObject("chatNo", -1);
		}
		mv.setViewName("chat/chattingView");
		return mv;
	}
	@RequestMapping(value = "/chat/chatOut.do/{chatNo}", method = RequestMethod.GET)
	public ModelAndView chatOut(HttpSession session,@PathVariable int chatNo,HttpServletRequest req) throws Exception {

		ModelAndView mv = new ModelAndView();
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		
		map.put("chatNo", chatNo);
		map.put("userNo", ((Member)session.getAttribute("member")).getUserNo());
		
		cs.deletechatRoom(map);

		Chatting chat = cs.selectLastChatNo(((Member)session.getAttribute("member")).getUserNo());
		System.out.println("allList ----------chat : "+chat);
		String ipAddr = req.getRemoteAddr();
		
		
		if(chat!=null) {
			mv.addObject("chatName", chat.getChattingName());
			mv.addObject("chatNo", chat.getChattingId());
			mv.addObject("host", ipAddr);
			
		}else {
			mv.addObject("chatName", null);
			mv.addObject("chatNo", -1);
		}
		mv.setViewName("chat/chattingView");
		return mv;
	}
	@RequestMapping(value = "/chat/chatting.do/{chatNo}", method = RequestMethod.POST)
	public ModelAndView chattingMethod(@PathVariable("chatNo")int chatNo,HttpServletRequest req, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();
		Map<String,Integer> map = new HashMap<String,Integer>();
		List<String> memberList = new ArrayList<String>();
		
		req.setCharacterEncoding("utf-8");

		String ipAddr = req.getRemoteAddr();

		map.put("chatNo", chatNo);
		map.put("userNo", ((Member)session.getAttribute("member")).getUserNo());
		Chatting chat=cs.getChatName(map);
		session.setAttribute("chat", chat);
		ChatUser chatuser = new ChatUser(chatNo,((Member)session.getAttribute("member")).getUserName());
		cs.updateStatus(chatuser);
		
		memberList=cs.selectChatMember(chat.getChattingId());
		System.out.println("memberList :::: "+memberList);
		
		mv.addObject("chatName", chat.getChattingName());
		mv.addObject("chatNo", chat.getChattingId());
		mv.addObject("host", ipAddr);
		mv.addObject("memberList", memberList);
		mv.setViewName("chat/chattingView");

		return mv;
	}
	@RequestMapping(value="/chat/upStatus.do/{chatNo}")
	public void upStatus(@PathVariable("chatNo")int chatNo, HttpSession session) {
		
		ChatUser chatuser = new ChatUser(chatNo,((Member)session.getAttribute("member")).getUserName());
		cs.updateStatus(chatuser);
		System.out.println("1111111111111111111111확인1111111111111111111111111");
	}
	
	@RequestMapping(value = "/chat/chattingRoom.do/{userName}", method=RequestMethod.POST)
	public ModelAndView chattingRoom(@PathVariable("userName")String userName,HttpServletRequest req, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,List> nameMap = new HashMap<String,List>();
		List<String> list =new ArrayList<String>();
		String myName = ((Member)session.getAttribute("member")).getUserName();
		String ipAddr = req.getRemoteAddr();
	
		Map<String,String> userNameMap = new HashMap<String,String>();
		
		userNameMap.put("myName", myName);
		userNameMap.put("userName", userName);
		
		list.add(myName);
		list.add(userName);
		nameMap.put("userNameList", list);
		System.out.println("userNamas:::::: "+list);
		System.out.println("userNamas:::::: "+nameMap.get("userNameList"));
		Chatting chat = cs.isChat(userNameMap);
		
		if(chat==null) {
			cs.insertChat(nameMap);
			chat = cs.isChat(userNameMap);
		}
		map.put("chatNo", chat.getChattingId());
		map.put("userName", ((Member)session.getAttribute("member")).getUserName());
		System.out.println("chat++++++++++++"+chat);
		session.setAttribute("chat", chat);	
		ChatUser chatuser = new ChatUser(chat.getChattingId(),((Member)session.getAttribute("member")).getUserName());
		cs.updateStatus(chatuser);
		
		mv.addObject("chatName", chat.getChattingName());
		mv.addObject("chatNo", chat.getChattingId());
		mv.addObject("host", ipAddr);
		mv.setViewName("chat/chattingView");
		
		
		return mv;
	}
	@RequestMapping(value="/chat/insertChatRoom.do" ,method=RequestMethod.POST)
	public ModelAndView insertChat(@RequestParam("memberName") String memberName,@RequestParam String chatName/*List<String> memberName*/,HttpServletRequest req, HttpSession session) {
		
		List<String> jsonToObj = new Gson().fromJson(memberName, List.class);
		List<String> list = new ArrayList<String>();
		Map<String,Integer> map = new HashMap<String,Integer>();

		ModelAndView mv = new ModelAndView();
		ChatCreateInfo chatInfo = new ChatCreateInfo();
		
		String ipAddr = req.getRemoteAddr();

		System.out.println("memberName  "+memberName);
		
		chatInfo.setChatName(chatName);
		for(String s :jsonToObj) {
			list.add(s);
		}
		chatInfo.setUserName(list);
		cs.insertChatGroup(chatInfo);
		map.put("chatNo", chatInfo.getReturnChatId());
		map.put("userNo", ((Member)session.getAttribute("member")).getUserNo());
		
		Chatting chat=cs.getChatName(map);
		session.setAttribute("chat", chat);	
		
		mv.addObject("chatName", chat.getChattingName());
		mv.addObject("chatNo", chat.getChattingId());
		mv.addObject("host", ipAddr);
		mv.setViewName("chat/chattingView");
		return mv;		
	}
}
