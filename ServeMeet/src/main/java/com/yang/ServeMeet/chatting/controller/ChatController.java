package com.yang.ServeMeet.chatting.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yang.ServeMeet.chatting.model.service.ChattingService;
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
	public List<ChattingLog> chatLogList(HttpSession session,@RequestParam int chatNo,@RequestParam int msgCount,@RequestParam int page ) {
		
		//int userNo = ((Member)(session.getAttribute("member"))).getUserNo();
		List<ChattingLog> chatLogList = new ArrayList<ChattingLog>();
		Map<String,Integer> map =new HashMap<String,Integer>();
		
		map.put("chatNo",chatNo );
		map.put("msgCount", msgCount);
		map.put("page", page);
		chatLogList=cs.selectChatLogList(map);
		
		
		return chatLogList;
	}
	
	
	

}
