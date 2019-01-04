package com.yang.ServeMeet.matching.model.dao;

import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.category.model.vo.Category;
import com.yang.ServeMeet.matching.model.vo.Matching;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;

public interface MatchingDao {
	
	int matchingHistoryInsert(MatchingHistory mHistory);
	
	public int matchingInsert(Matching matching);
	
	List<Map<String,String>> myMatchingList(String userName,String type);
	
}
