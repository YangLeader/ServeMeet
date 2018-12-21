package com.yang.ServeMeet.batting.model.service;

import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.batting.model.vo.Batting;
import com.yang.ServeMeet.batting.model.vo.BattingUser;

public interface BattingService {

	
	Batting battingSelect(int battingId);
	
	List<Map<String,String>> battingList();
	
	int battingPick(int battingId, String battingSelect);
	
	int battingPickUser(BattingUser bUser);
}
