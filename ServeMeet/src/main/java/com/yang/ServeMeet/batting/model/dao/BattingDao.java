package com.yang.ServeMeet.batting.model.dao;

import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.batting.model.vo.Batting;
import com.yang.ServeMeet.batting.model.vo.BattingUser;

public interface BattingDao {
	
	Batting battingSelect(int battingId);
	
	Map<String,Object> battingSelectOne(int battingId);

	List<Map<String,String>> battingList(String type);
	
	int battingPick(Map<String, Object> hmap);
	
	int battingPickUser(BattingUser bUser);
	
	BattingUser battingPickCheck(BattingUser battingUser);
	
	List<Map<String,String>> battingHistory();
	
	int battingClose(int battingId);
	
	int battingInsert();
	
	List<Map<String,Object>> battingAllocation(Map<String,Object> hmap);
	
	int battingPoint(List<Map<String,Object>> list);
	
	List<Map<String,Object>> myBattingList(String userName);
	
	int battingTotalContents(String type);
	
	List<Map<String,Object>> topBattingList();
	
	int battingWinnerUpdate(String winnerChk,int battingId);
	
	int checkBattingId(int matchingId);
}
