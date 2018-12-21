package com.yang.ServeMeet.location.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yang.ServeMeet.location.model.dao.LocationDao;
import com.yang.ServeMeet.location.model.vo.Location;

@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	private LocationDao locDao;
	
	@Override
	public List<Location> selectLoc() {
		return locDao.selectLoc();
	}
	
	@Override
	public List<Location> selectBloc(String bloc){
		System.out.println("service:"+bloc);
		return locDao.selectBloc(bloc);
	}
	
	@Override
	public List<Location> selectSloc(String sloc){
		System.out.println("sloc_service: " +sloc);
		return locDao.selectSloc(sloc);
	}

}
