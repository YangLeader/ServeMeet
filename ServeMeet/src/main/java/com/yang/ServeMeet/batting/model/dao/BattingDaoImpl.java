package com.yang.ServeMeet.batting.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yang.ServeMeet.batting.model.vo.Batting;
import com.yang.ServeMeet.batting.model.vo.BattingUser;

@Repository
public class BattingDaoImpl implements BattingDao {


	@Autowired SqlSessionTemplate sqlSession;
	
	@Override
	public Batting battingSelect(int battingId) {

		return sqlSession.selectOne("Batting_Mapper.battingSelect",battingId);
	}
		
	@Override
	public List<Map<String,String>> battingList(){
		
		return sqlSession.selectList("Batting_Mapper.battingList");
	}
	
	@Override
	public int battingPick(Map<String, Object> hmap) {
		
		System.out.println(hmap);
		
		return sqlSession.update("Batting_Mapper.battingPick", hmap);
	}
	
	@Override
	public int battingPickUser(BattingUser bUser) {
		
		
		return sqlSession.insert("Batting_Mapper.battingPickUser",bUser);
	}
	
	@Override
	public BattingUser battingPickCheck(BattingUser bUser) {
		
		return sqlSession.selectOne("Batting_Mapper.battingPickCheck",bUser);
	}
	

}
