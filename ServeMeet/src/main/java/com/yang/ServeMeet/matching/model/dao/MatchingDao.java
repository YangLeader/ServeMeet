package com.yang.ServeMeet.matching.model.dao;

import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.matching.model.vo.Matching;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;

public interface MatchingDao {
	
	int matchingHistoryInsert(MatchingHistory mHistory);
	
	List<Map<String,String>> myMatchingList(String userName,String type);

	MatchingHistory mHistorySelectOne(int mHistoryId);
	
	Matching matchingSelectOne(int matchingId);
	
	int insertMHistory(MatchingHistory mHistory);
	
	int insertMHistoryFile(BoardFile boardFile);
	
}
