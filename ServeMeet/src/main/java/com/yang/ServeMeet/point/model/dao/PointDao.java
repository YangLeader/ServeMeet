package com.yang.ServeMeet.point.model.dao;

import com.yang.ServeMeet.point.model.vo.Point;

public interface PointDao {

	int insertPoint(Point point);
	
	Point selectOne(int userNo);
	
	int updatePoint(Point point);
	
	int deletePoint(int userNo);
}
