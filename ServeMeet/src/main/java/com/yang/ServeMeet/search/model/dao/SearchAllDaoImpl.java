package com.yang.ServeMeet.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.matching.model.vo.MatchingListObj;

@Repository
public class SearchAllDaoImpl implements SearchAllDao {
	
	@Autowired
	private SqlSessionTemplate sst;
@Override
public List<MatchingListObj> searchMeet(Map<String, String> map) {
	// TODO Auto-generated method stub
	return sst.selectList("");
}
}
