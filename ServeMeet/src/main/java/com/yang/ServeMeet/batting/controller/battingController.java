package com.yang.ServeMeet.batting.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yang.ServeMeet.batting.model.service.BattingService;
import com.yang.ServeMeet.batting.model.vo.Batting;
import com.yang.ServeMeet.batting.model.vo.BattingUser;

@Controller
public class battingController {

	
	@Autowired
	private BattingService battingService;	
		
	
	@RequestMapping("/batting/battingInfo.ba")
	public String battingInfo(@RequestParam int no, Model model) {
		
		model.addAttribute("batting",battingService.battingSelect(no));
		
		return "batting/battingInfo";
	}
	
	@RequestMapping("/batting/battingList.ba")
	public String battingList(Model model) {
		
		ArrayList<Map<String,String>> list = new ArrayList<Map<String,String>>(battingService.battingList());
		
		model.addAttribute("list",list);
		
		
		return "batting/battingList";
	}
	
	@RequestMapping("/batting/battingPick.ba")
	public String battingPick(@RequestParam int battingId ,@RequestParam("battingType") String battingSelect,@RequestParam String userName, Model model) {
		
		BattingUser check = battingService.battingPickCheck(battingId, userName);
				
		String path = "";
		
		if(check != null) {
			
			model.addAttribute("loc","/batting/battingList.ba");
			
			model.addAttribute("msg","한 배팅 당 한 번의 선택만 할 수 있습니다.");
			
			path = "common/msg";
			
		} else {
		
		int result = battingService.battingPick(battingId, battingSelect);
		
		BattingUser bUser = new BattingUser(battingId,userName,battingSelect);
		
		int result2 = battingService.battingPickUser(bUser);
		
		ArrayList<Map<String,String>> list = new ArrayList<Map<String,String>>(battingService.battingList());
		
		model.addAttribute("list",list);
		
		path = "batting/battingList";
		
		}
		
		return path;
	}
	
	
	@RequestMapping("/batting/battingHistory.ba")
	public String battingHistory(Model model) {
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>(battingService.battingHistory());
		
		model.addAttribute("list",list);
		
		
		return "batting/battingHistoryList";
	}
	
	@RequestMapping("/batting/battingClose.ba")
	public String battingClose(@RequestParam int battingId, Model model, RedirectAttributes rat){
		 
		
		Batting batting = battingService.battingSelect(battingId);
		
		String battingType = batting.getBattingPNumA() > batting.getBattingPNumB() ? "A" : "B";
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>(battingService.battingAllocation(battingId,battingType));
		
		System.out.println(list);
		
		
		
		
		int result = battingService.battingClose(battingId);
		
		boolean check = result >0;
		
		String msg = check ? "배팅을 종료 하였습니다." : "배팅을 종료하지 못했습니다.";
		String loc = check ? "/batting/battingList.ba" : "/batting/battingInfo.ba";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("/batting/battingInsert.ba")
	public String battingInsert(Model model) {
		
		int result = battingService.battingInsert();
		
		String msg = result >0 ? "배팅 생성 성공!" : "배팅 생성 실패!";
		
		model.addAttribute("msg",msg);

		model.addAttribute("loc","/batting/battingList.ba");
		
		return "common/msg";
		
	}
	@RequestMapping("/batting/battingAllocation.ba")
	public String battingAllocation(@RequestParam int battingId, Model model) {
		
		
		
		
		return "/";
	}
}
