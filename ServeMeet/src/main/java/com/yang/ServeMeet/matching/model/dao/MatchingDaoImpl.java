package com.yang.ServeMeet.matching.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.category.model.vo.Category;
import com.yang.ServeMeet.matching.model.vo.MatchingHistory;

@Repository
public class MatchingDaoImpl implements MatchingDao {
	
	@Autowired
	SqlSessionTemplate session;	

	@Override
	public int matchingHistoryInsert(MatchingHistory mHistory) {
		
		return session.insert("matching.insertMatching",matching);
	}
	
	@Override
	public List<Map<String,String>> myMatchingList(String userName,String type){
		
		String mapperPath = type.equals("P") ? "Matching.myMatchingList" : "Matching.myMatchingEndList";
		
		return session.selectList(mapperPath,userName);
	}

}
