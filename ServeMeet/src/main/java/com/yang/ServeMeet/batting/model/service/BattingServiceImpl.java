package com.yang.ServeMeet.batting.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.batting.model.dao.BattingDao;
import com.yang.ServeMeet.batting.model.vo.Batting;
import com.yang.ServeMeet.batting.model.vo.BattingUser;


@Service
public class BattingServiceImpl implements BattingService {

	
	@Autowired
	private BattingDao battingDao;
	
	@Override
	public Batting battingSelect(int battingId) {

		return battingDao.battingSelect(battingId);
	}
	
	@Override
	public Map<String,Object> battingSelectOne(int battingId){
		
		return battingDao.battingSelectOne(battingId);
	}
	
	@Override
	public int battingTotalContents() {
		
		return battingDao.battingTotalContents();
	}
	
	@Override
	public List<Map<String, String>> battingList(String type){
	
		return battingDao.battingList(type);
	}

	@Override
	public int battingPick(int battingId, String battingSelect) {
		Map<String, Object> hmap = new HashMap<>();
		hmap.put("battingId", battingId);
		hmap.put("battingSelect", battingSelect);
		
		System.out.println(hmap);
		
		return battingDao.battingPick(hmap);
	}
	
	@Override
	public int battingPickUser(BattingUser bUser) {
		
		return battingDao.battingPickUser(bUser);
	}
	
	@Override
	public BattingUser battingPickCheck(int battingId, String userName) {
		
		BattingUser bUser = new BattingUser(battingId , userName);
		
		return battingDao.battingPickCheck(bUser);
	}
	
	@Override
	public List<Map<String,String>> battingHistory(){
		
		
		return battingDao.battingHistory();
		
	}
	
	@Override
	public int battingClose(int battingId) {
		
		return battingDao.battingClose(battingId);
	}
	
	@Override
	public int battingInsert() {
		
		return battingDao.battingInsert();
	}
	
	@Override
	public List<Map<String,Object>> battingAllocation(int battingId, String battingType){
		
		Map<String,Object> hmap = new HashMap<>();
		
		hmap.put("battingId", battingId);
		hmap.put("battingType", battingType);
		
		return battingDao.battingAllocation(hmap);
	}
	
	@Override
	public int battingPoint(List<Map<String,Object>> list) {
		
		
		return battingDao.battingPoint(list);
	}
	
	@Override
	public List<Map<String,Object>> myBattingList(String userName){
		
		return battingDao.myBattingList(userName);
	}
	
	@Override
	public List<Map<String,Object>> topBattingList(){
		
		return battingDao.topBattingList();
	}

}
