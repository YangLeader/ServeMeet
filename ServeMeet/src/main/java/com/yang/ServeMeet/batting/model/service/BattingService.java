package com.yang.ServeMeet.batting.model.service;

import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.batting.model.vo.Batting;
import com.yang.ServeMeet.batting.model.vo.BattingUser;

public interface BattingService {

	
	Batting battingSelect(int battingId);
	
	Map<String,Object> battingSelectOne(int battingId);
	
	List<Map<String,String>> battingList(String type);
	
	int battingPick(int battingId, String battingSelect);
	
	int battingPickUser(BattingUser bUser);
	
	BattingUser battingPickCheck(int battingId, String userName);
	
	List<Map<String,String>> battingHistory();
	
	int battingClose(int battingId);
	
	int battingInsert();
	
	List<Map<String,Object>> battingAllocation(int battingId, String battingType);
	
	int battingPoint(List<Map<String,Object>> list);
	
	List<Map<String,Object>> myBattingList(String userName);
	
	int battingTotalContents();
	
	List<Map<String,Object>> topBattingList();
	
	int battingWinnerUpdate(String winnerChk,int battingId);
	
	int checkBattingId(int matchingId);
}
