package com.yang.serveMeet.location.model.dao;

import java.util.List;

import com.yang.serveMeet.location.model.vo.Location;

public interface LocationDao {
	public List<Location> selectLoc();
	
	public List<Location> selectBloc(String bloc);
}
