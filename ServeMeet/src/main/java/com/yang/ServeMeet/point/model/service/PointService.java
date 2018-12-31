package com.yang.ServeMeet.point.model.service;

import java.util.List;

import com.yang.ServeMeet.point.model.vo.Attendence;
import com.yang.ServeMeet.point.model.vo.Point;

public interface PointService {
	
	int insertPoint(Point point);
	
	Point selectOne(int userNo);
	
	List<Attendence> selectAtt(int userNo);
	
	int updatePoint(Point point);
	
	int deletePoint(int userNo);
	
	int insertAtt(Attendence a);
	
	int selectAttCnt(int userNo);

}
