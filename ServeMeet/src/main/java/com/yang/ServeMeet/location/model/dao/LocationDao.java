package com.yang.ServeMeet.location.model.dao;

import java.util.List;

import com.yang.ServeMeet.location.model.vo.Location;

public interface LocationDao {
	public List<Location> selectLoc();
	
	public List<Location> selectBloc(String bloc);
}
