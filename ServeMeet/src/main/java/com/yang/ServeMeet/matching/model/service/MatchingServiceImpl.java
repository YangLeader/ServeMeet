package com.yang.ServeMeet.matching.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.category.model.vo.Category;
import com.yang.ServeMeet.matching.model.dao.MatchingDao;
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
	public int matchingInsert(Matching matching) {
		// TODO Auto-generated method stub
		return matchingDao.matchingInsert(matching);
	}
	
	
}
