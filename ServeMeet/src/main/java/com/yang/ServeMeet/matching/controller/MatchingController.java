package com.yang.ServeMeet.matching.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yang.ServeMeet.matching.model.service.MatchingService;
import com.yang.ServeMeet.matching.model.vo.Matching;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService matchingService;
	
	@RequestMapping("matching/matchingInsertView.ma")
	public void matchingInsertView(){}
	
	@RequestMapping("matching/matchingInsert.ma")
	public String matchingInsert(Matching matching , Model model , HttpSession session) {
		
		
		int result = matchingService.matchingInsert(matching);
		
		String msg = result >0 ? "매칭 생성 성공!" : "매칭 생성 실패!";
				
		model.addAttribute("msg",msg).addAttribute("loc","matching/matchingList.ma");
		
		
		return "common/msg";
	}
}
