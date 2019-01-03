package com.yang.ServeMeet.matching.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.matching.model.dao.MatchingDao;
import com.yang.ServeMeet.matching.model.vo.Matching;

@Service
public class MatchingServiceImpl implements MatchingService {
	
	@Autowired
	private MatchingDao matchingDao;
	
	@Override
	public int matchingInsert(Matching matching) {
		
		
		return matchingDao.insertMatching(matching);
	}
	
}
