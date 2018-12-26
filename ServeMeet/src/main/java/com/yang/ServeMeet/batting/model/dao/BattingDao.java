package com.yang.ServeMeet.batting.model.dao;

import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.batting.model.vo.Batting;
import com.yang.ServeMeet.batting.model.vo.BattingUser;

public interface BattingDao {
	
	Batting battingSelect(int battingId);

	List<Map<String,String>> battingList();
	
	int battingPick(Map<String, Object> hmap);
	
	int battingPickUser(BattingUser bUser);
	
	BattingUser battingPickCheck(BattingUser battingUser);
}
