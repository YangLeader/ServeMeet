package com.yang.ServeMeet.matching.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.board.model.exception.BoardException;
import com.yang.ServeMeet.board.model.vo.BoardFile;
import com.yang.ServeMeet.matching.model.dao.MatchingDao;
import com.yang.ServeMeet.matching.model.exception.MatchingException;
import com.yang.ServeMeet.matching.model.vo.Matching;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;

@Service
public class MatchingServiceImpl implements MatchingService {
	
	@Autowired
	private MatchingDao matchingDao;
	
	@Override
	public int matchingHistoryInsert(MatchingHistory mHistory) {
		
		
		return matchingDao.matchingHistoryInsert(mHistory);
	}
	
	@Override
	public List<Map<String,String>> myMatchingList(String userName,String type){
		
		return matchingDao.myMatchingList(userName,type);
	}
	
	@Override
	public MatchingHistory mHistorySelectOne(int mHistoryId) {
		
		return matchingDao.mHistorySelectOne(mHistoryId);
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
	
}
