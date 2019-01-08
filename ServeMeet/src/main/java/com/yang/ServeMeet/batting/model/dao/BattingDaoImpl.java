package com.yang.ServeMeet.batting.model.dao;

import java.util.ArrayList;
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
	public Map<String,Object> battingSelectOne(int battingId) {
		
		return sqlSession.selectOne("Batting_Mapper.battingSelectOne",battingId);
	}
		
	@Override
	public List<Map<String,String>> battingList(String type){
		
		String path = type.equals("I") ? "Batting_Mapper.battingList" : "Batting_Mapper.battingHistoryList";
		
		return sqlSession.selectList(path);
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
	
	@Override
	public List<Map<String,String>> battingHistory(){
		
		return sqlSession.selectList("Batting_Mapper.battingHistoryList");
	}
	
	@Override
	public int battingClose(int battingId) {
				
		return sqlSession.update("Batting_Mapper.battingClose",battingId);
	}
	
	@Override
	public int battingInsert() {
		
		return sqlSession.insert("Batting_Mapper.battingInsert");
	}
	
	@Override
	public List<Map<String,Object>> battingAllocation(Map<String,Object> hmap){
		
		return sqlSession.selectList("Batting_Mapper.battingWinner",hmap);
	}
	
	@Override
	public int battingPoint(List<Map<String,Object>> list) {
		
		int result =0;
		
		for(int i=0;i<list.size();i++) result += sqlSession.update("Batting_Mapper.battingPoint",list.get(i));
		
		return result;
	}
	
	@Override
	public List<Map<String,Object>> myBattingList(String userName){
		
		return sqlSession.selectList("Batting_Mapper.myBattingList",userName);
	}
	
	

}
