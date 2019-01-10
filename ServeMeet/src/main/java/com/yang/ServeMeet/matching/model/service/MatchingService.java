package com.yang.ServeMeet.matching.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import com.yang.ServeMeet.category.model.vo.Category;
import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.matching.model.vo.Matching;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;
import com.yang.ServeMeet.matching.model.vo.MatchingListObj;

public interface MatchingService {
	
	static int MATCHING_SERVICE_ERROR = 0;

	int matchingInsert(Matching m);
	
	int matchingHistoryInsert(MatchingHistory mHistory);
	
	List<Map<String,String>> myMatchingList(String userName,String type);

	Map<String,String> mHistorySelectOne(int mHistoryId);

	
	Matching matchingSelectOne(int matchingId);
	
	int mHistoryInsert(MatchingHistory mHistory , List<BoardFile> fileList);

	List<Map<String,String>> mHistoryList();
	
	List<Map<String,String>> matchingSelectList(String type);
	
	MatchingListObj matchingDetail(int matNum);
	
}
