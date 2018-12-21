package com.yang.ServeMeet.chatting.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yang.ServeMeet.chatting.model.service.ChattingService;

@RestController
public class WebSocketChattingController {

	@Autowired
	private ChattingService cs;
	
		
	@RequestMapping(value = "/chat/chatting.do/{chatNo}", method = RequestMethod.POST)
	public ModelAndView chattingMethod(@PathVariable("chatNo")int chatNo,HttpServletRequest req, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		req.setCharacterEncoding("utf-8");
		
		String ipAddr = req.getRemoteAddr();
		session.setAttribute("chatNo", chatNo);
		
		mv.addObject("host", ipAddr);
		mv.setViewName("chat/chattingView");
		
		return mv;
	}
}
