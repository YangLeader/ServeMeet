package com.yang.ServeMeet.matching.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.yang.ServeMeet.category.model.vo.Category;
import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.matching.model.vo.Matching;
import com.yang.ServeMeet.matching.model.vo.MatchingCondition;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;
import com.yang.ServeMeet.matching.model.vo.MatchingListObj;

public interface MatchingDao {
	
	int matchingHistoryInsert(MatchingHistory mHistory);
	
	public int matchingInsert(Matching matching);
	
	List<Map<String,String>> myMatchingList(String userName,String type);


	Map<String,String> mHistorySelectOne(int mHistoryId);
	
	Matching matchingSelectOne(int matchingId);
	
	int insertMHistory(MatchingHistory mHistory);
	
	int insertMHistoryFile(BoardFile boardFile);

	List<Map<String,String>> mHistoryList();
	
	List<Map<String,String>> matchingSelectList(String type);
	
	MatchingListObj matchingDetail(Map map);
	
	int matchingRequest(int matchingId,String writerName,String guestName,String content);

	int countMatchingCon(String userName);

	List<MatchingListObj> topMatchingList(String category);

	
	List<MatchingListObj> searchMatching(Map map);


	List<MatchingCondition> matchingConditions(int matchingId);

	String matchingAccept(int conId);

	String matchingDecline(int conId);

}