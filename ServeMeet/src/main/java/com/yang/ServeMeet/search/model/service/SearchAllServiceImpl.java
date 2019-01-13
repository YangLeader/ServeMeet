package com.yang.ServeMeet.search.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.matching.model.vo.MatchingListObj;
import com.yang.ServeMeet.search.model.dao.SearchAllDao;

@Service
public class SearchAllServiceImpl implements SearchAllService{
	
	@Autowired
	private SearchAllDao sad;
	
 @Override
public List<MatchingListObj> searchMeet(Map<String, String> map) {
	// TODO Auto-generated method stub
	return sad.searchMeet(map);
}
}
