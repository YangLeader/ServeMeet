package com.yang.ServeMeet.location.model.dao;

import java.util.List;

import com.yang.ServeMeet.location.model.vo.Location;

public interface LocationDao {
	public List<Location> selectLoc();
	
	public List<Location> selectBloc(String bloc);
	
	public List<Location> selectSloc(String sloc);
	
	public String locationCheck(String bigLoc,String midLoc,String smallLoc);
}
