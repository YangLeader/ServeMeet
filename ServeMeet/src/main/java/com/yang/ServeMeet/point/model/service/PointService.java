package com.yang.ServeMeet.point.model.service;

import com.yang.ServeMeet.point.model.vo.Point;

public interface PointService {
	
	int insertPoint(Point point);
	
	Point selectOne(int userNo);
	
	int updatePoint(Point point);
	
	int deletePoint(int userNo);

}
