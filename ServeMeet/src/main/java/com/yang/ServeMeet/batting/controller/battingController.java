package com.yang.ServeMeet.batting.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.yang.ServeMeet.point.model.service.PointService;
import com.yang.ServeMeet.point.model.service.PointServiceImpl;

@Controller
public class battingController {

	
	@Autowired
	private BattingService battingService;
	
	@Autowired
	private PointService pointService;	
	
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
		
		Batting batting = battingService.battingSelect(battingId);
		
		
		// 임의값 지정, 종료 시 매칭후기에서 이긴팀을 받아 넘겨줄 예정.
		String battingType = batting.getBattingPNumA() > batting.getBattingPNumB() ? "A" : "B";
		
		// 배팅에서 이긴 사람의 목록을 불러오기
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>(battingService.battingAllocation(battingId,battingType));
		
		System.out.println(list);
		
		float aNum = batting.getBattingPNumA();
		float bNum = batting.getBattingPNumB();
		
		System.out.println("aNum : "+aNum+"\nbNum : "+bNum);
		
		System.out.println("battingType = "+battingType);
		
		float pct = battingType.equals("A") ? aNum/(aNum+bNum)*100 : bNum/(bNum+aNum)*100; // 인원수 퍼센트 계산식
		
		int alloc = Math.round(((100 - pct) *15/1000 + 1) * 100); // 배당계산식 중 반올림을 위해 100을 곱해 int형으로 저장
		// 배당만을 보기 위해서는 float alloc = alloc/100 을 해줘야 배율이 나오지만, 포인트를 100점 걸었다는 가정 하에 int값만 보냄. 추후 배팅 포인트 선택 가능 시 추가요망.
		
		System.out.println("pct : "+pct+"\nac1 = "+alloc);
		
		Map<String,Object> hmap = new HashMap<String,Object>();
		List<Map<String,Object>> userList= new ArrayList<Map<String,Object>>();
		for(int i= 0 ; i < list.size() ; i++) {
			hmap = list.get(i);			
			hmap.put("alloc", alloc);
			hmap.put("pContent", "배팅 성공 포인트");
			userList.add(hmap);
		}
		
		int pointResult = battingService.battingPoint(userList);
		
		if(pointResult == list.size()) {
			System.out.println("#포인트,#지급,#성공적");
			int pointDate = pointService.insertBattingPoint(userList);
			
			if(pointDate == pointResult) System.out.println("포인트 기록 성공.");
			
		} else {
			System.out.println("포인트 지급 실패");
		}
		
		return "redirect:/batting/battingClose.ba?battingId="+battingId;
	}
	
	@RequestMapping("batting/myBattingList.ba")
	public String myBattingList(@RequestParam String userName , Model model) {
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>(battingService.myBattingList(userName));
		
		model.addAttribute("list",list);
		
		
		return "batting/myBattingList";
	}
}
