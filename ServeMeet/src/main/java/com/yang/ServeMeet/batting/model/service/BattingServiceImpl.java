package com.yang.ServeMeet.batting.model.service;

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
	public List<Map<String, String>> battingList(){
	
		return battingDao.battingList();
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

}
