package com.yang.ServeMeet.matching.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.matching.model.vo.Matching;

@Repository
public class MatchingDaoImpl implements MatchingDao {
	
	@Autowired
	SqlSessionTemplate session;	
	
	@Override
	public int insertMatching(Matching matching) {
		
		return session.insert("matching.insertMatching",matching);
	}

}
