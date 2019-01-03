package com.yang.ServeMeet.point.model.dao;

import java.util.HashMap;
import java.util.List;

import com.yang.ServeMeet.point.model.vo.Attendence;
import com.yang.ServeMeet.point.model.vo.Point;

public interface PointDao {

	int insertPoint(Point point);
	
	Point selectOne(int userNo);
	
	int updatePoint(Point point);
	
	int deletePoint(int userNo);

	int inserAtt(Attendence a);

	List<Attendence> selectAtt(int userNo);

	int selectAttCnt(int userNo);

	int getCount(Point point);
}
