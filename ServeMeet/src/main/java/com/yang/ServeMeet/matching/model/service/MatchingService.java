package com.yang.ServeMeet.matching.model.service;

import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.category.model.vo.Category;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;

public interface MatchingService {

	int matchingHistoryInsert(MatchingHistory mHistory);
	
	List<Map<String,String>> myMatchingList(String userName,String type);
	
}
