package com.yang.ServeMeet.matching.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yang.ServeMeet.category.model.vo.Category;
import com.yang.ServeMeet.matching.model.service.MatchingService;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService matchingService;
	
	
	@RequestMapping("matching/matchingHistoryForm.ma")
	public void matchingHistoryForm() {}
	
	@RequestMapping("matching/matcingHistoryInsert.ma")
	public String matchingHistoryInsert() {
		
		return "";
	}
	
	@RequestMapping("matching/myMatchingList.ma")
	public String myMatchingList(@RequestParam String userName, @RequestParam String type, Model model) {
		
		
//		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
//		
//		String path = "";
//		
//		if(type.equals("P")) {
//			
//			list = matchingService.myMatchingList(userName);
//			
//			model.addAttribute("list",list);
//			path = "matching/myMatchingList";
//			
//		} else {
//			list = matchingService.myMatchingEndList(userName);
//			
//			model.addAttribute("list",list);
//			path = "matching/myMatchingEndList";
//		}
//		
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>(matchingService.myMatchingList(userName,type));
		
		model.addAttribute("list",list);
		
		return "/matching/myMatchingList";
	}
	
}
