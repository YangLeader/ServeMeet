package com.yang.ServeMeet.location.model.service;

import java.util.List;

import com.yang.ServeMeet.location.model.vo.Location;


public interface LocationService {
	public List<Location> selectLoc();
	
	public String locationCheck(String bigLoc,String midLoc,String smallLoc);
	
	public List<Location> selectBloc(String bloc);
	
	public List<Location> selectSloc(String sloc);
}
