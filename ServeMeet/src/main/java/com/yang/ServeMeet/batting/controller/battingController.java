package com.yang.ServeMeet.batting.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yang.ServeMeet.batting.model.service.BattingService;
import com.yang.ServeMeet.batting.model.vo.BattingUser;

@Controller
public class battingController {

	
	@Autowired
	private BattingService battingService;	
		
	
	@RequestMapping("/batting/battingInfo.do")
	public String battingInfo(@RequestParam int no, Model model) {
		
		model.addAttribute("batting",battingService.battingSelect(no));
		
		return "batting/battingInfo";
	}
	
	@RequestMapping("/batting/battingList.do")
	public String battingList(Model model) {
		
		ArrayList<Map<String,String>> list = new ArrayList<Map<String,String>>(battingService.battingList());
		
		model.addAttribute("list",list);
		
		
		return "batting/battingList";
	}
	
	@RequestMapping("/batting/battingPick.do")
	public String battingPick(@RequestParam int battingId ,@RequestParam String battingSelect,@RequestParam String userName, Model model) {
		
		
		int result = battingService.battingPick(battingId, battingSelect);
		
		BattingUser bUser = new BattingUser(battingId,userName,battingSelect);
		
		int result2 = battingService.battingPickUser(bUser);
		
		ArrayList<Map<String,String>> list = new ArrayList<Map<String,String>>(battingService.battingList());
		
		model.addAttribute("list",list);
		
		return "batting/battingList";
	}
}
