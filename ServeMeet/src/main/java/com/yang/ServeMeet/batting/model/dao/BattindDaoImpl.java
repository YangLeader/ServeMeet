package com.yang.ServeMeet.batting.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.batting.model.vo.Batting;

@Repository
public class BattindDaoImpl implements BattingDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	@Override
	public Batting battingSelect(int battingId) {

		return sqlSession.selectOne("Batting_Mapper.battingSelect",battingId);
	}

}
