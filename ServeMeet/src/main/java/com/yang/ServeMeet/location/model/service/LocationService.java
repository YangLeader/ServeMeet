package com.yang.serveMeet.location.model.service;

import java.util.List;

import com.yang.serveMeet.location.model.vo.Location;


public interface LocationService {
	public List<Location> selectLoc();
	
	public List<Location> selectBloc(String bloc);
}
