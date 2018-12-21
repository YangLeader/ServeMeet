package com.yang.ServeMeet.batting.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.batting.model.dao.BattingDao;
import com.yang.ServeMeet.batting.model.vo.Batting;


@Service
public class BattingServiceImpl implements BattingService {

	
	@Autowired
	private BattingDao battingDao;
	
	@Override
	public Batting battingSelect(int battingId) {

		
		
		return battingDao.battingSelect(battingId);
	}

}
