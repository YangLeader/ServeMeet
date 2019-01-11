package com.yang.ServeMeet.matching.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yang.ServeMeet.batting.model.service.BattingService;
import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.matching.model.exception.MatchingException;
import com.yang.ServeMeet.matching.model.service.MatchingService;
import com.yang.ServeMeet.matching.model.vo.Matching;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;
import com.yang.ServeMeet.matching.model.vo.MatchingListObj;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService matchingService;
	
	@Autowired
	private BattingService battingService;
	
	@RequestMapping("matching/matchingInsertView.ma")
	public String matchingInsertView(){
		return "matching/matchingInsert";
	}
	
	@RequestMapping("matching/matchingInsert.ma")
	public String matchingInsert(Matching matching , Model model , HttpSession session, @RequestParam("batChk") String batChk) {
		//int result = matchingService.matchingInsert(matching);
		System.out.println(matching.toString());
		System.out.println("++++++++++++++++++++++++++++++++" + batChk);
		int result = matchingService.matchingInsert(matching);
		
		String home = "/";
		String msg = "";
		if(result > 0) {
			msg = "매칭이 등록 되었습니다.";
		}else {
			msg = "매칭 등록에 실패하였습니다.";
		}
		if(batChk.equals("true")) {
		
			battingService.battingInsert();
			
			System.out.println("배팅 생성 성공!!");
			
		}
		
		model.addAttribute("home", home);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}

	@RequestMapping("matching/matchingHistoryForm.ma")
	public String matchingHistoryForm(@RequestParam int matchingId, Model model) {
		
		Matching matching = matchingService.matchingSelectOne(matchingId);
		
		model.addAttribute("matching",matching);
		
		return "matching/matchingHistoryForm";
		
	}
	
	@RequestMapping("matching/matcingHistoryInsert.ma")
	public String matchingHistoryInsert(MatchingHistory mHistory, Model model, HttpSession session,
			@RequestParam(value="upFile", required = false) MultipartFile[] upFile) {

		String saveDir = session.getServletContext().getRealPath("/resources/upload/mHistory");
				
		List<BoardFile> boardFileList = new ArrayList<BoardFile>();
				
		File dir = new File(saveDir);
				
		System.out.println("폴더 존재 여부 : " + dir.exists());
				
		if(dir.exists() == false) dir.mkdirs();
				
		for(MultipartFile f : upFile) {
			
			if(!f.isEmpty()) {
				String originName = f.getOriginalFilename();
				String ext = originName.substring(originName.lastIndexOf(".")+1);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
						
				int rnNum = (int)(Math.random() * 1000);
						
				String changeName = sdf.format(new Date()) + "_" + rnNum + "." + ext;
						
				try {
					f.transferTo(new File(saveDir + "/" + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
	
				BoardFile bf = new BoardFile();
				bf.setOriginName(originName);
				bf.setChangeName(changeName);
				bf.setUserName(mHistory.getUserName());
				
				System.out.println("원본 이름 : " + bf.getOriginName());
				System.out.println("바뀐 이름 : " + bf.getChangeName());
						
				boardFileList.add(bf);
			}
		}
		
				
		int result;
				
		System.out.println("matchingHistory : "+ mHistory);
		try {
			result = matchingService.mHistoryInsert(mHistory,boardFileList);
					
		} catch(Exception e) {
					
			throw new MatchingException("매칭 후기 등록 오류!");
					
		}
				
		String msg = "";
		String loc = "/";		
		
		if(result > 0) {
			msg = "매칭 후기 등록 성공!";
					
		} else {
			msg = "매칭 후기 등록 실패!";
		}
			
		model.addAttribute("loc", loc).addAttribute("msg", msg);
				
		return "common/msg";
		
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
		System.out.println("userName = "+userName);

		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>(matchingService.myMatchingList(userName,type));
		
		model.addAttribute("list",list);
		
		return "/matching/myMatchingList";
	}
	
	@RequestMapping("matching/mHistoryList.ma")
	public String mHistoryList(Model model) {
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>(matchingService.mHistoryList());
		
		model.addAttribute("list",list);
				
		return "/matching/matchingHistoryList";
	}
	
	
	@RequestMapping("matching/mHistorySelectOne.ma")
	public String mHistorySelectOne(@RequestParam("no") int mHistoryId , Model model ) {
		
		Map<String,String> mHistory = matchingService.mHistorySelectOne(mHistoryId);
		
		model.addAttribute("mHistory",mHistory);
		
		return "/matching/matchingHistoryView";
	}
	
	@RequestMapping("matching/matchingList.ma")
	public String mList(@RequestParam String type, Model model) {
		System.out.println(type);
		String listName = "";
		List<Map<String, String>> list = new ArrayList<Map<String, String>>(matchingService.matchingSelectList(type));
		
		if(type.equals("M")) {
			listName = "소모임";
		}else if(type.equals("S")) {
			listName = "스포츠";
		}else {
			listName = "E-스포츠";
		}
		model.addAttribute("matchingList",list);
		model.addAttribute("lName", listName);
		
		return "/matching/matchingList";
	}
	
	@RequestMapping("matching/matchingDetail.md")
	public String mDatail(@RequestParam("matNum") int matNum, Model model) {
		System.out.println("조회할 매칭 matNum : " + matNum);
		
		MatchingListObj mo = new MatchingListObj();
		mo = matchingService.matchingDetail(matNum);
		
		model.addAttribute("mDetail", mo);
		
		return "/matching/matchingDetail";
	}
	
	@RequestMapping("matching/matchingApply.ma")
	public String mApply() {
		return "/matching/matchingApply";
	}
	
	/*@RequestMapping("matching/matchingRequest.ma")
	public String mApplyRequest(@RequestParam("matchingId") int matchingId, @RequestParam("writerName") String writerName,
								@RequestParam("guestName") String guestName, @RequestParam("content") String content, Model model) {
		System.out.println("매칭아이디:"+matchingId);
		System.out.println("매칭등록자:"+writerName);
		System.out.println("매칭신청자:"+guestName);
		System.out.println("컨텐츠:"+content);
		
		matchingService.matchingRequest(matchingId, writerName, guestName, content);
		
		model.addAttribute("msg", "매칭 신청이 완료되었습니다.");
		
		return "common/msg";
	}*/
	
	@RequestMapping(value = "matching/matchingRequest.ma", method = RequestMethod.POST)
	@ResponseBody
	public int mApplyRequest(@RequestParam int matchingId, @RequestParam String writerName,
								@RequestParam String guestName, @RequestParam String content) { 
		System.out.println("매칭아이디:"+matchingId);
		System.out.println("매칭등록자:"+writerName);
		System.out.println("매칭신청자:"+guestName);
		System.out.println("컨텐츠:"+content);
		int result = matchingService.matchingRequest(matchingId, writerName, guestName, content);
		
		return result;
	}
}
