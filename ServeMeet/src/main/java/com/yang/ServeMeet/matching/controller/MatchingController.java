package com.yang.ServeMeet.matching.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yang.ServeMeet.batting.model.service.BattingService;
import com.yang.ServeMeet.batting.model.vo.Batting;
import com.yang.ServeMeet.board.model.service.BoardService;
import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.common.util.Utils;
import com.yang.ServeMeet.matching.model.exception.MatchingException;
import com.yang.ServeMeet.matching.model.service.MatchingService;
import com.yang.ServeMeet.matching.model.vo.Matching;
import com.yang.ServeMeet.matching.model.vo.MatchingCondition;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;
import com.yang.ServeMeet.matching.model.vo.MatchingListObj;
import com.yang.ServeMeet.member.model.vo.Member;

@Controller
public class MatchingController {
	
	@Autowired
	private MatchingService matchingService;
	
	@Autowired
	private BattingService battingService;
	
	@Autowired
	private BoardService boardService;
	
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
		
		int battingId = matchingService.battingIdSelect(matchingId);
		
		model.addAttribute("matching",matching).addAttribute("battingId",battingId);
		
		return "matching/matchingHistoryForm";
		
	}
	
	@RequestMapping("matching/matcingHistoryInsert.ma")
	public String matchingHistoryInsert(@RequestParam String winnerChk , MatchingHistory mHistory, Model model, HttpSession session,
			@RequestParam(value="upFile", required = false) MultipartFile[] upFile) {
		
		System.out.println("winnerChk : "+winnerChk);

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
				
		System.out.println("winnerChk = "+winnerChk);
		String path = "common/msg";
		
		if(!winnerChk.equals("N")) {
			int battingId = battingService.checkBattingId(mHistory.getMatchingId());
			
			battingService.battingWinnerUpdate(winnerChk, battingId);
			
			int result = battingService.battingClose(battingId);
			
			String str = result >0 ? "배팅 종료 성공" : "배팅 종료 실패";
			
			System.out.println(str);
			
			path = "redirect:/batting/battingAllocation.ba?battingId="+battingId+"&winnerChk="+winnerChk;
		}
		
				
		int result;
				
		System.out.println("matchingHistory : "+ mHistory);
		try {
			result = matchingService.mHistoryInsert(mHistory,boardFileList);
					
		} catch(Exception e) {
					
			throw new MatchingException("매칭 후기 등록 오류!");
					
		}
				
		String msg = "매칭 후기 등록 성공!";
		String loc = "/";		
		
		if(result <= 0) {
			msg = "매칭 후기 등록 실패!";
			path ="common/msg";
		}
			
		model.addAttribute("loc", loc).addAttribute("msg", msg);
				
		return path;
		
	}
	
//	@RequestMapping("matching/myMatchingList.ma")
//	public String myMatchingList(@RequestParam String userName, @RequestParam String type, Model model) {
//
//		
////		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
////		
////		String path = "";
////		
////		if(type.equals("P")) {
////			
////			list = matchingService.myMatchingList(userName);
////			
////			model.addAttribute("list",list);
////			path = "matching/myMatchingList";
////			
////		} else {
////			list = matchingService.myMatchingEndList(userName);
////			
////			model.addAttribute("list",list);
////			path = "matching/myMatchingEndList";
////		}
////		
//		System.out.println("userName = "+userName);
//
//		
//		List<Map<String,String>> list = new ArrayList<Map<String,String>>(matchingService.myMatchingList(userName,type));
//		
//		model.addAttribute("list",list);
//		
//		return "/matching/myMatchingList";
//	}
	
	@RequestMapping("matching/mHistoryList.ma")
	public String mHistoryList(@RequestParam(value="cPage", required=false, defaultValue="1")
	int cPage,Model model) {
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>(matchingService.mHistoryList());
		
		int numPerPage = 10; 
		
		int totalContents = matchingService.mHistoryContentCount();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "battingList.do");
		
		model.addAttribute("list", list)
		.addAttribute("totalContents", totalContents)
		.addAttribute("numPerPage", numPerPage)
		.addAttribute("pageBar", pageBar);
			
				
		return "/matching/matchingHistoryList";
	}
	
	
	@RequestMapping(value="/ajax/mhTop7.do", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> boardTop7(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		list = matchingService.selectMhTop7List();
		
		return list;
		
	}
	
	
	@RequestMapping("matching/mHistorySelectOne.ma")
	public String mHistorySelectOne(@RequestParam(value="cPage", required=false , defaultValue ="1") int cPage , @RequestParam("no") int mHistoryId , Model model ) {
		
		Map<String,String> mHistory = matchingService.mHistorySelectOne(mHistoryId);
		
		List<Map<String,String>> list = new ArrayList<Map<String,String>>(matchingService.mHistoryList());
		
		System.out.println("엠 히스토리 셀렉트 "+list);
		
		model.addAttribute("mHistory",mHistory).addAttribute("boardFileList",boardService.selectBoardFileList(mHistoryId,"M")).addAttribute("list",list);		
		
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
		}else if(type.equals("E")){
			listName = "E-스포츠";
		}else {
			listName = "전부찾기";
		}
		model.addAttribute("matchingList",list);
		model.addAttribute("lName", listName);
		
		return "/matching/matchingList";
	}
	
	@RequestMapping("matching/myMatchingList.ma")
	public String myMatchingList() {
		
		return "/matching/myMatchingList";
	}
	@RequestMapping(value="matching/myMatchingListType.do")
	@ResponseBody
	public List<MatchingListObj> myMatchingListType(@RequestParam String userName , @RequestParam String type) {
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("userName", userName);
		map.put("type", type);
		
		System.out.println("실행은 잘되냐요? "+map);
		List<MatchingListObj> list = new ArrayList<>();
		list=matchingService.myMatchingList(map);
		
		List<String> jsonList = new ArrayList<>();
		System.out.println("실행은 잘되냐요? "+list);
		
		//return new Gson().toJson(list);
		return list;
	}

	
	@RequestMapping("matching/matchingDetail.md") // ma로 수정해야함
	public String mDatail(@RequestParam("matNum") int matNum, Model model,HttpSession session) {
		System.out.println("조회할 매칭 matNum : " + matNum);
		
		String userId = ((Member)session.getAttribute("member")).getUserName();
		Map map = new HashMap();
		map.put("matNum", matNum);
		map.put("userName", userId);
		MatchingListObj mo = new MatchingListObj();
		List<MatchingCondition> list = new ArrayList<MatchingCondition>();
		
		mo = matchingService.matchingDetail(map);
		System.out.println("moasdasdasd : " +mo);
		model.addAttribute("mDetail", mo);
		System.out.println(userId +" ::: "+mo.getmWriter());
		if(userId.equals(mo.getmWriter()) ) {
			System.out.println("같음 ::: "+userId +" ::: "+mo.getmWriter());
			list = matchingService.matchingConditions(mo.getMatchingId());
			System.out.println("list::::: "+list);
			model.addAttribute("mConditions", list);
		}
		
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
	public String mApplyRequest(@RequestParam int matchingId, @RequestParam String writerName,
								@RequestParam String guestName, @RequestParam String content) { 
		System.out.println("매칭아이디:"+matchingId);
		System.out.println("매칭등록자:"+writerName);
		System.out.println("매칭신청자:"+guestName);
		System.out.println("컨텐츠:"+content);
		int result = matchingService.matchingRequest(matchingId, writerName, guestName, content);
		String str = result+"";
		return str;
	}
	
	@RequestMapping("/matching/countMatchingCon.ma")
	@ResponseBody
	public String countMatchingCon(HttpSession session) {
		String result="N";
		System.out.println("countMatchingCon");
		int count = matchingService.countMatchingCon(((Member)session.getAttribute("member")).getUserName());
		if(count>0) result="Y";
		System.out.println("countMatchingCon : "+ count);
		return result;
	} 
	@RequestMapping("/ajax/topMatchingList.do")
	@ResponseBody
	public List<MatchingListObj> topMatchingList(@RequestParam String category) {
		List<MatchingListObj> list = new ArrayList<MatchingListObj>();
		System.out.println("실행");
		list=matchingService.topMatchingList(category);
		System.out.println("topMatchingList : "+list);
		return list;
	} 
	
	@RequestMapping("/matching/searchMatching.do")
	@ResponseBody
	public List<MatchingListObj> searchMathing(@RequestParam String[] locArrOne, @RequestParam String[] locArrTwo, @RequestParam String[] locArrThree,
												@RequestParam String firstCate,@RequestParam String category,
											   @RequestParam String people, @RequestParam String date){
		List<MatchingListObj> list = new ArrayList<MatchingListObj>();
		List<MatchingListObj> searchList = new ArrayList<MatchingListObj>();
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		System.out.println("들어옴.");
		
		for(int i=0; i<locArrOne.length; i++) {
			MatchingListObj mlo = new MatchingListObj();
			System.out.println("locArrOne : " + locArrOne[i]);
			System.out.println("locArrTwo : " + locArrTwo[i]);
			System.out.println("locArrThree : " + locArrThree[i]);
			mlo.setBigLocation(locArrOne[i]);
			if(!locArrTwo[i].equals("전체")) {
				mlo.setSmallCategory(locArrTwo[i]);				
			}
			if(!locArrThree[i].equals(" ")) {
				mlo.setMidLocation(locArrThree[i]);
			}
			searchList.add(mlo);
		}
		
		System.out.println("category : " + category);
		System.out.println("people : " + people);

		String firstPeople = "";
		String lastPeople = "";
		
		if(people.equals("인원수 무관")) {
			firstPeople = "1";
			lastPeople = "999";
		}else {
			String peopleArr[] = people.split("~");
			firstPeople = peopleArr[0];
			lastPeople = peopleArr[1].replace("명", "");
		}
	
		System.out.println("date : " + date);
		String dateArr[] = date.split("~"); 
		System.out.println("length: " +dateArr.length);
		String startDate = dateArr[0].trim();
		String finishDate = dateArr[0].trim();
		if(dateArr.length >= 2) {
			finishDate = dateArr[1].trim();			
		}
	
		System.out.println("searchList : " + searchList);
		System.out.println("firstPeople : " + firstPeople);
		System.out.println("lastPeople : " + lastPeople);
		System.out.println("startDate : " + startDate);
		System.out.println("finishDate : " + finishDate);
		
		for(int i=0; i<searchList.size(); i++) {
			String str1 = searchList.get(i).getBigLocation();
			String str2 = searchList.get(i).getMidLocation();
			String str3 = searchList.get(i).getSmallCategory();
			System.out.println("꺼내기1 : " + str1);
			System.out.println("꺼내기2 : " + str2);
			System.out.println("꺼내기3 : " + str3);
		}
		
		map.put("firstPeople", Integer.parseInt(firstPeople));
		map.put("lastPeople", Integer.parseInt(lastPeople));
		map.put("startDate", startDate);
		map.put("finishDate", finishDate);
		map.put("searchList", searchList);
		map.put("firstCate", firstCate);
		map.put("category", category);
		
		System.out.println("map : " + map);
		
		list = matchingService.searchMatching(map);
		
		System.out.println("결과값 : " + list);
		
		return list;
	}
	@RequestMapping(value="/matching/matchingAccept.ma",method=RequestMethod.POST)
	@ResponseBody
	public String matchingAccept(@RequestParam int conId,@RequestParam int matchingId) {
		String result="";
		Map<String,Integer> map = new HashMap<String,Integer>(); 
		result=matchingService.matchingAccept(conId);
		map.put("conId", conId);
		map.put("matchingId", matchingId);
		result+=matchingService.matchingDeclineAll(map);
		return result;
	}
	@RequestMapping(value="/matching/matchingDecline.ma",method=RequestMethod.POST)
	@ResponseBody
	public String matchingDecline(@RequestParam int conId) {
		String result="";
		
		result=matchingService.matchingDecline(conId);
		
		return result;
	}
}
