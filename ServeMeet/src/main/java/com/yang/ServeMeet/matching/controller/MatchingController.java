package com.yang.ServeMeet.matching.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yang.ServeMeet.matching.model.service.MatchingService;
import com.yang.ServeMeet.matching.model.vo.Matching;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService matchingService;
	
	@RequestMapping("matching/matchingInsertView.ma")
	public String matchingInsertView(){
		return "matching/matchingInsert";
	}
	
	@RequestMapping("matching/matchingInsert.ma")
	public String matchingInsert(Matching matching , Model model , HttpSession session) {
		//int result = matchingService.matchingInsert(matching);
		System.out.println(matching.toString());
		
		int result = matchingService.matchingInsert(matching);
		String home = "/";
		String msg = "";
		if(result > 0) {
			msg = "매칭이 등록 되었습니다.";
		}else {
			msg = "매칭 등록에 실패하였습니다.";
		}
		
		model.addAttribute("home", home);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}

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
