package com.yang.ServeMeet.matching.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.board.model.exception.BoardException;
import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.matching.model.dao.MatchingDao;

import com.yang.ServeMeet.matching.model.exception.MatchingException;
import com.yang.ServeMeet.matching.model.vo.Matching;
import com.yang.ServeMeet.matching.model.vo.MatchingCondition;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;
import com.yang.ServeMeet.matching.model.vo.MatchingListObj;

@Service
public class MatchingServiceImpl implements MatchingService {
	
	@Autowired
	private MatchingDao matchingDao;
	
	@Override
	public int matchingHistoryInsert(MatchingHistory mHistory) {
		
		
		return matchingDao.matchingHistoryInsert(mHistory);
	}
	
	@Override
	public List<MatchingListObj> myMatchingList(Map<String,String> map){
		
		return matchingDao.myMatchingList(map);
	}

	@Override
	public int matchingInsert(Matching matching) {
		// TODO Auto-generated method stub
		return matchingDao.matchingInsert(matching);
	}
	
	@Override
	public Map<String,String> mHistorySelectOne(int mHistoryId) {

		
		return matchingDao.mHistorySelectOne(mHistoryId);
	}
	
	@Override
	public List<Map<String,Object>> selectMhTop7List(){
		
		return matchingDao.selectMhTop7List();
	}
	
	@Override
	public Matching matchingSelectOne(int matchingId) {
		
		return matchingDao.matchingSelectOne(matchingId);
	}
	
	@Override
	public int mHistoryInsert(MatchingHistory mHistory , List<BoardFile> fileList) {
		
		int result = 0;
		
		try {
			result = matchingDao.insertMHistory(mHistory);
			if(result == MATCHING_SERVICE_ERROR) throw new MatchingException();
			
			if(fileList.size()>0) {
				for(BoardFile bf : fileList) {
					result = matchingDao.insertMHistoryFile(bf);
					System.out.println("result : "+result);
					if(result == MATCHING_SERVICE_ERROR) throw new MatchingException();
				}
			}
		} catch(Exception e){
			throw e;
		}
		return result;
		
	}
	

	@Override
	public List<Map<String,String>> mHistoryList(){
		
		return matchingDao.mHistoryList();
	}

	@Override
	public List<Map<String,String>> matchingSelectList(String type) {
		
		return matchingDao.matchingSelectList(type);
	}

	@Override
	public MatchingListObj matchingDetail(Map map) {
		
		return matchingDao.matchingDetail(map);
	}

	@Override
	public int matchingRequest(int matchingId, String writerName, String guestName, String content) {
		
		return matchingDao.matchingRequest(matchingId, writerName, guestName, content);
	}
	@Override
	public int countMatchingCon(String userName) {
		return matchingDao.countMatchingCon(userName);
	}
	@Override
	public List<MatchingListObj> topMatchingList(String category) {
		return matchingDao.topMatchingList(category);
	}
	@Override
	public List<MatchingListObj> searchMatching(Map map) {
		return matchingDao.searchMatching(map);
	}
	@Override
	public List<MatchingCondition> matchingConditions(int matchingId) {
		return matchingDao.matchingConditions(matchingId);
	}
	@Override
	public String matchingAccept(int conId) {
		return matchingDao.matchingAccept(conId);
	}
	@Override
	public String matchingDecline(int conId) {
		return matchingDao.matchingDecline(conId);

	}
	@Override
	public String matchingDeclineAll(Map<String,Integer> map) {
		return matchingDao.matchingDeclineAll(map);
	}
	
	@Override
	public int mHistoryContentCount() {
		return matchingDao.mHistoryContentCount();
	}
	
	@Override
	public int battingIdSelect(int matchingId) {
		return matchingDao.battingIdSelect(matchingId);
	}
	
}
