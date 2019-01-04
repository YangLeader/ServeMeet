package com.yang.ServeMeet.matching.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.matching.model.exception.MatchingException;
import com.yang.ServeMeet.matching.model.service.MatchingService;
import com.yang.ServeMeet.matching.model.vo.Matching;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService matchingService;
	
	@RequestMapping("matching/matchingInsertView.ma")
	public String matchingInsertView(){
		return "matching/matchingInsert";
	}
	
//	@RequestMapping("matching/matchingInsert.ma")
//	public String matchingInsert(Matching matching , Model model , HttpSession session) {
//		int result = matchingService.matchingInsert(matching);
//	}

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
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>(matchingService.myMatchingList(userName,type));
		
		model.addAttribute("list",list);
		
		return "/matching/myMatchingList";
	}
	
	@RequestMapping("matching/matchingSelectOne.ma")
	public String mHistorySelectOne(@RequestParam("no") int mHistoryId , Model model ) {
		
		MatchingHistory mHistory = matchingService.mHistorySelectOne(mHistoryId);
		
		return "/matching/matchingHistoryView";
	}
	
}
